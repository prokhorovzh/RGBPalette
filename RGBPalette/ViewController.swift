//
//  ViewController.swift
//  RGBPalette
//
//  Created by Евгений Прохоров on 04.12.2020.
//

import UIKit

protocol ViewControllerDelegate: AnyObject {
    func pressColor(color: UIColor)
}

class ViewController: UIViewController {
    
    var colorBackground: UIColor?

    @IBOutlet weak var redNumber: UILabel!
    @IBOutlet weak var greenNumber: UILabel!
    @IBOutlet weak var blueNumber: UILabel!
    
    @IBOutlet weak var paletteView: UIView! {
        didSet {
            paletteView.backgroundColor = colorBackground
        }
    }
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet var dobeButton: UIButton! {
        didSet {
            dobeButton.layer.cornerRadius = 10
        }
    }
    
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    
    weak var delegate: ViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redSlider.minimumValue = 0
        redSlider.maximumValue = 255
        redSlider.minimumTrackTintColor = .red
        redSlider.value = Float(colorBackground?.rgba.red ?? 0) * 255
        redNumber.text = String(Int(redSlider.value))
        redTextField.text = String(Int(redSlider.value))
        
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 255
        greenSlider.minimumTrackTintColor = .green
        greenSlider.value = Float(colorBackground?.rgba.green ?? 0) * 255
        greenNumber.text = String(Int(greenSlider.value))
        greenTextField.text = String(Int(greenSlider.value))
        
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 255
        blueSlider.minimumTrackTintColor = .blue
        blueSlider.value = Float(colorBackground?.rgba.blue ?? 0) * 255
        blueNumber.text = String(Int(blueSlider.value))
        blueTextField.text = String(Int(blueSlider.value))
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        
    }
    
    // Метод для скрытия клавиатуры тапом по экрану
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    @IBAction func redSliderAction(_ sender: Any) {
        redNumber.text = String(Int(redSlider.value))
        redTextField.text = String(Int(redSlider.value))
        
        paletteView.backgroundColor = UIColor(red: CGFloat(redSlider.value)/255, green: CGFloat(greenSlider.value)/255, blue: CGFloat(blueSlider.value)/255, alpha: 1)
    }
    
    @IBAction func greenSliderAction(_ sender: Any) {
        greenNumber.text = String(Int(greenSlider.value))
        greenTextField.text = String(Int(greenSlider.value))
        
        paletteView.backgroundColor = UIColor(red: CGFloat(redSlider.value)/255, green: CGFloat(greenSlider.value)/255, blue: CGFloat(blueSlider.value)/255, alpha: 1)
    }
    
    @IBAction func blueSliderAction(_ sender: Any) {
        blueNumber.text = String(Int(blueSlider.value))
        blueTextField.text = String(Int(blueSlider.value))
        
        paletteView.backgroundColor = UIColor(red: CGFloat(redSlider.value)/255, green: CGFloat(greenSlider.value)/255, blue: CGFloat(blueSlider.value)/255, alpha: 1)
    }
    
    
    @IBAction func doneButtonAction() {
        
            delegate?.pressColor(color: paletteView.backgroundColor ?? .white)
            dismiss(animated: true)
    }
    
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
       if textField == redTextField || textField == greenTextField || textField == blueTextField {
            redSlider.value = Float(redTextField.text!) ?? 0
            redNumber.text = redTextField.text
            
            greenSlider.value = Float(greenTextField.text!) ?? 0
            greenNumber.text = greenTextField.text
            
            blueSlider.value = Float(blueTextField.text!) ?? 0
            blueNumber.text = blueTextField.text
            
        if greenSlider.value > 255 && greenSlider.value < 0 && redSlider.value > 255 && redSlider.value < 0 && blueSlider.value > 255 && blueSlider.value < 0 {
            let alertVC = UIAlertController(
                title: "Error",
                message: "Значение больше 255 или меньше 0",
                preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertVC.addAction(action)
            self.present(alertVC, animated: true, completion: nil)
        } else {
            paletteView.backgroundColor = UIColor(red: CGFloat(redSlider.value)/255, green: CGFloat(greenSlider.value)/255, blue: CGFloat(blueSlider.value)/255, alpha: 1)
        }
        }
    }
}


