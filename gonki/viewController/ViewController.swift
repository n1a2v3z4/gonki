//
//  ViewController.swift
//  gonki
//
//  Created by Cергей Иванович on 27.08.21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonSetting: UIButton!
    @IBOutlet weak var buttonNext: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Начальный экран"
       
        if let navigationBar = self.navigationController?.navigationBar {
            
            navigationBar.backgroundColor = .red
            navigationBar.barStyle = .black
        }
        print (SettingViewController.shared.speed)

    }

    override func viewWillAppear(_ animated: Bool) {
        buttonNext.addTarget(self, action: #selector(action(sender:)), for: UIControl.Event.touchUpInside)
        
        buttonSetting.addTarget(self, action: #selector(actionSetting), for: UIControl.Event.touchUpInside)
        }
        
        
    
        
        
@objc func action (sender: UIButton!) {
    let nextVC = UIStoryboard(name: "ToStoryboard", bundle: Bundle.main).instantiateViewController(identifier: "2") as! ToViewController


//        show(nextVC, sender: self)
    nextVC.modalTransitionStyle = .flipHorizontal
    
    show(nextVC, sender: self)
}

    @objc func actionSetting (sender: UIButton!) {
        let nextVC = UIStoryboard(name: "SettingStoryboard", bundle: Bundle.main).instantiateViewController(identifier: "SettingViewController") as! SettingViewController


    //        show(nextVC, sender: self)
        nextVC.modalTransitionStyle = .flipHorizontal
        
        show(nextVC, sender: self)
    }

    
    
    
}
