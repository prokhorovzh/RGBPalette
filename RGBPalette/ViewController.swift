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

    @IBOutlet weak var redNumber: UILabel!
    @IBOutlet weak var greenNumber: UILabel!
    @IBOutlet weak var blueNumber: UILabel!
    
    @IBOutlet weak var paletteView: UIView!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet var dobeButton: UIButton! {
        didSet {
            dobeButton.layer.cornerRadius = 10
        }
    }
    
    weak var delegate: ViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redSlider.minimumValue = 0
        redSlider.maximumValue = 255
        redSlider.minimumTrackTintColor = .red
        
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 255
        greenSlider.minimumTrackTintColor = .green
        
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 255
        blueSlider.minimumTrackTintColor = .blue
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    @IBAction func redSliderAction(_ sender: Any) {
        redNumber.text = String(Int(redSlider.value))
        
        paletteView.backgroundColor = UIColor(red: CGFloat(redSlider.value)/255, green: CGFloat(greenSlider.value)/255, blue: CGFloat(blueSlider.value)/255, alpha: 1)
    }
    
    @IBAction func greenSliderAction(_ sender: Any) {
        greenNumber.text = String(Int(greenSlider.value))
        
        paletteView.backgroundColor = UIColor(red: CGFloat(redSlider.value)/255, green: CGFloat(greenSlider.value)/255, blue: CGFloat(blueSlider.value)/255, alpha: 1)
    }
    
    @IBAction func blueSliderAction(_ sender: Any) {
        blueNumber.text = String(Int(blueSlider.value))
        
        paletteView.backgroundColor = UIColor(red: CGFloat(redSlider.value)/255, green: CGFloat(greenSlider.value)/255, blue: CGFloat(blueSlider.value)/255, alpha: 1)
    }
    
    
    @IBAction func doneButtonAction() {
        delegate?.pressColor(color: paletteView.backgroundColor ?? .white)
        
        dismiss(animated: true)
    }
}

