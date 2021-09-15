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

    var currentValue: Float = 50 {
        didSet {
            UserDefaults.standard.setValue(self.currentValue, forKey: key)
            //сохраняет только в оперативной памяти
            UserDefaults.standard.synchronize()
        }
    }
    
    var speed: Double = 2.5 {
       didSet {
        UserDefaults.standard.setValue(self.speed, forKey: key2)
        //сохраняет только в оперативной памяти
        UserDefaults.standard.synchronize()
        }
        
    }
    
    
    static let shared: SettingViewController = SettingViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let value = UserDefaults.standard.integer(forKey: key)
        sliderOutlet.value = Float(value)

        lableText.text = "\(value) %"
        
        let speedValue = UserDefaults.standard.double(forKey: key2)
        SettingViewController.shared.speed = speedValue
       
    }
    
    
        
    @IBAction func sliderAction(_ : UISlider) {


         SettingViewController.shared.currentValue = sliderOutlet.value
        
        lableText.text = "\(Int(SettingViewController.shared.currentValue))  %"
        
        SettingViewController.shared.speed = 5 - (5 * Double(SettingViewController.shared.currentValue)/100)
       
    }
  


}
