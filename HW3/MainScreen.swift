//
//  MainScreen.swift
//  HW7
//
//  Created by Nur on 13.12.2023.
//

import UIKit



class MainScreen: UIViewController, ColorSelectedDelegate {

    
    var delegate: ColorSelectedDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
     
    @IBAction func unwindToMainScreen(for segue: UIStoryboardSegue) {
        let colorVC = segue.source as! ColorSettingsScreenVC
        colorVC.delegate = self
    }
    
    func didSelectedTheColors(color: UIColor) {
        view.backgroundColor = color
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! ColorSettingsScreenVC
        destination.colorFromMainScreen = view.backgroundColor
    }
    }

    
