//
//  SettingViewController.swift
//  gonki
//
//  Created by Cергей Иванович on 13.09.21.
//

import Foundation
import UIKit

class SettingViewController: UIViewController {
   
    @IBOutlet weak var lableText: UILabel!
    
    @IBOutlet weak var sliderOutlet: UISlider!
    
    let key = "speedKey"
    
    let key2 = "speed"
    var speed = 2.5
     
    override func viewDidLoad() {
        super.viewDidLoad()
        let value = (UserDefaults.standard.value(forKey: key)  as? Float) ?? 50
        
        sliderOutlet.value = value
        
        lableText.text = "\(Int(value)) %"
       
    }
        
    @IBAction func sliderAction(_ : UISlider) {

     
        var  currentValue = sliderOutlet.value
        
        lableText.text = "\(Int(currentValue))  %"
        UserDefaults.standard.setValue(currentValue, forKey: key)
        //сохраняет только в оперативной памяти
        UserDefaults.standard.synchronize()
     
        
        var speed = 5 - (5 * Double(currentValue)/100) + 0.2
        UserDefaults.standard.setValue(speed, forKey: key2)
        //сохраняет только в оперативной памяти
        UserDefaults.standard.synchronize()
        
    }

}
