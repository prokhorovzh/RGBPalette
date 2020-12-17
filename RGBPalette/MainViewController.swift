//
//  MainViewController.swift
//  RGBPalette
//
//  Created by Евгений Прохоров on 18.12.2020.
//

import UIKit


class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.setHidesBackButton(true, animated: false)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ViewController
        vc.delegate = self
    }
    
}

extension MainViewController: ViewControllerDelegate {
    func pressColor(color: UIColor) {
        view.backgroundColor = color
    }
}
