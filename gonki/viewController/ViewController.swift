//
//  ViewController.swift
//  gonki
//
//  Created by Cергей Иванович on 27.08.21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonNext: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let navigationBar = self.navigationController?.navigationBar {
            
            let secondFrame = CGRect(x: navigationBar.frame.width/2, y: 0, width: navigationBar.frame.width/2, height: navigationBar.frame.height)
            
            
            let  secondLabel = UILabel(frame: secondFrame)
            secondLabel.text = "Начальный экран"
            secondLabel.center = navigationBar.center
            secondLabel.textAlignment = .center
            navigationBar.backgroundColor = .red
            navigationBar.addSubview(secondLabel)
        }
        
    }

    override func viewWillAppear(_ animated: Bool) {
        buttonNext.addTarget(self, action: #selector(action(sender:)), for: UIControl.Event.touchUpInside)
        }
        
        
    
        
        
@objc func action (sender: UIButton!) {
    let nextVC = UIStoryboard(name: "ToStoryboard", bundle: Bundle.main).instantiateViewController(identifier: "2") as! ToViewController


//        show(nextVC, sender: self)
    nextVC.modalTransitionStyle = .flipHorizontal
    
    show(nextVC, sender: self)
}


}
