//
//  ColorSettingsScreenVC.swift
//  HW3
//
//  Created by Nur on 30.11.2023.
//

import UIKit

protocol ColorSelectedDelegate: AnyObject {
    func didSelectedTheColors (color: UIColor)
}

class ColorSettingsScreenVC: UIViewController, UITextFieldDelegate {

    
    func didSelectedTheColors(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        
    }
    
    @IBOutlet var screenRGB: UIView!
    @IBOutlet var labelBlue: UILabel!
    @IBOutlet var labelGreen: UILabel!
    
    @IBOutlet var doneButtone: UIButton!
    @IBOutlet var labelRed: UILabel!
    
    
    @IBOutlet var switchRed: UISlider!
    @IBOutlet var switchGreen: UISlider!
    @IBOutlet var switchBlue: UISlider!
    
    @IBOutlet var textFieldRed: UITextField!
    @IBOutlet var textFieldBlue: UITextField!
    @IBOutlet var textFieldGreen: UITextField!
    var colorFromMainScreen: UIColor!
    var delegate: ColorSelectedDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brekeToRGB()
        }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textFieldRed.resignFirstResponder()
        textFieldGreen.resignFirstResponder()
        textFieldBlue.resignFirstResponder()
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func updateScreenColor() {
        screenRGB.backgroundColor = UIColor(red: CGFloat(switchRed.value),
                                            green: CGFloat(switchGreen.value),
                                            blue: CGFloat(switchBlue.value),
                                            alpha: 1)
    }
    func brekeToRGB() {
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        colorFromMainScreen.getRed(&r, green: &g, blue: &b, alpha: &a)
        switchRed.value = Float(r)
        switchGreen.value = Float(g)
        switchBlue.value = Float(b)
        switchRedMuved()
    }
    
    func updateLabelValues() {
        labelRed.text = String(format: "%.2f", switchRed.value)
        labelGreen.text = String(format: "%.2f",switchGreen.value)
        labelBlue.text = String(format: "%.2f",switchBlue.value)
    }
    func updateTextValues() {
        textFieldRed.text = labelRed.text
        textFieldGreen.text = labelGreen.text
        textFieldBlue.text = labelBlue.text
    }
    
    
    @IBAction func switchRedMuved() {
        updateScreenColor()
        updateLabelValues()
        updateTextValues()
    }
    @IBAction func switchGreenMuved(_ sender: Any) {
        updateScreenColor()
        updateLabelValues()
        updateTextValues()
    }
    @IBAction func switchBlueMuved(_ sender: Any) {
        updateScreenColor()
        updateLabelValues()
        updateTextValues()
    }
    
    func updateTextFilds() {
        if let converterToCGFloat = NumberFormatter().number(from: textFieldRed.text ?? "1.0") {
            switchRed.value = Float(CGFloat(truncating: converterToCGFloat))
        }
        if let converterToCGFloat = NumberFormatter().number(from: textFieldGreen.text ?? "1.0") {
            switchGreen.value = Float(CGFloat(truncating: converterToCGFloat))
        }
        if let converterToCGFloat = NumberFormatter().number(from: textFieldBlue.text ?? "1.0") {
            switchBlue.value = Float(CGFloat(truncating: converterToCGFloat))
        }
        }
    
    @IBAction func textFieldRedWrited() {
        updateTextFilds()
        updateScreenColor()
        updateLabelValues()
    }
    
    
    @IBAction func textFieldGreenWrited() {
        updateTextFilds()
        updateScreenColor()
        updateLabelValues()
    }
    
    @IBAction func textFieldBlueWrited() {
        updateTextFilds()
        updateScreenColor()
        updateLabelValues()
    }
    

   deinit{
       delegate?.didSelectedTheColors(color: screenRGB.backgroundColor!)
        }
}
