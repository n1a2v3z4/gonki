//
//  ToViewController.swift
//  gonki
//
//  Created by Cергей Иванович on 27.08.21.
//

import Foundation
import UIKit

class ToViewController: UIViewController {
   
    @IBOutlet weak var LeftView: UIView!
    
    @IBOutlet weak var CentrView: UIView!
    
    @IBOutlet weak var RightView: UIView!
    
    @IBOutlet weak var CarOutlet: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Игра"
}
    
    
    
    @IBAction func ButtonRight(_ sender: Any) {
        
        
        
        UIView.animate(withDuration: 1) {
//            self.CarOutlet.frame = CGRect(x: self.RightView.frame.maxX/2, y: self.RightView.frame.maxY, width: self.CarOutlet.frame.width, height: self.CarOutlet.frame.height)
//
////            self.RightView.addSubview(self.CarOutlet)
//
//
//            self.CarOutlet.layer.zPosition = 1
//            self.RightView.bringSubviewToFront(self.CarOutlet);
           
            self.RightView.bringSubviewToFront(self.CarOutlet)

            self.CarOutlet.center = CGPoint (x: self.RightView.frame.maxX/2, y: self.RightView.frame.maxY - self.CarOutlet.frame.height/2 - 5)
//            self.RightView.superview?.bringSubviewToFront(self.CarOutlet)
//            self.CarOutlet.sendSubviewToBack(self.RightView)

//
//
//        }
    
    
        
    
    }
}

}
