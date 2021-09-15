//
//  ToViewController.swift
//  gonki
//
//  Created by Cергей Иванович on 27.08.21.
//

import Foundation
import UIKit

class ToViewController: UIViewController {
    
//    var animator = UIDynamicAnimator()
//
//    var collision: UICollisionBehavior!
//
//    var paddleOneOriginalCenter: CGPoint!
//
    var rand = 0
    
//    var randTime = 0
    
    var randDelay = 0
    
//    var count = 0
    
    @IBOutlet weak var LeftView: UIView!
    
    @IBOutlet weak var CentrView: UIView!
    
    @IBOutlet weak var RightView: UIView!
    
    @IBOutlet weak var CarOutlet: UIImageView!
    
    @IBOutlet weak var zentrConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var lowerView: UIView!
    
    var timer: Timer!
    
    var timer1: Timer!
    
//    let speed = SettingViewController.shared.speed
    
    let speed = UserDefaults.standard.value(forKey: "speed") as? Double ?? 2.5
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print ("\(self.speed) + YQQ")

        self.CarOutlet.layoutIfNeeded()
        title = "Игра"
        
        //        for i in 1...20 {
        
        timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true, block: { _ in
            
            self.rand = Int.random(in: 1...3)
   
            self.randDelay = Int.random(in: 2...5)
            
            switch self.rand {
            
            case 1:
                var wood = UIImageView()
                
                wood.translatesAutoresizingMaskIntoConstraints = false
                
                wood.image = #imageLiteral(resourceName: "wood")
                
                self.view.addSubview(wood)
                
                let horizontalConstraint = NSLayoutConstraint(item: wood, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: -self.view.frame.width*0.33333)
                
                var verticalConstraint = NSLayoutConstraint(item: wood, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: -self.view.frame.height*0.5)
                
                let widthConstraint = NSLayoutConstraint(item: wood, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
                
                let heightConstraint = NSLayoutConstraint(item: wood, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
                
                NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
                
                self.timer1 = Timer.scheduledTimer(withTimeInterval: 0, repeats: false, block: { _ in
                    UIView.animate(withDuration: TimeInterval(self.speed), delay: 0, options: .curveEaseIn ) {
                        
                        horizontalConstraint.constant = -self.view.frame.width*0.33333
                        
                        verticalConstraint.constant = self.LeftView.frame.height*0.5 - wood.frame.height/2
                        
                        self.view.layoutIfNeeded()
                    
//                        self.view.bringSubviewToFront(self.lowerView)
                        
                    } completion: { _ in
                        if verticalConstraint.constant == self.LeftView.frame.height*0.5 - wood.frame.height/2 && self.zentrConstraint.constant == -self.view.frame.width*0.33333 {
                            
                        self.navigationController?.popViewController(animated: true)
                        
                    }
                        
                    wood.isHidden = true
                        
                    }
                    
                })
            
            case 2:      var wood: UIImageView
                
                wood = UIImageView(frame:CGRect(x: self.view.frame.maxX*0.16666, y: -100, width: 100, height: 100))
                
                wood.center = CGPoint(x: self.view.frame.maxX*0.5, y: 0)
                
                wood.image = #imageLiteral(resourceName: "wood")
                
                self.view.addSubview(wood)
                
                UIView.animate(withDuration: TimeInterval(self.speed), delay: 0, options: .curveEaseIn ) {
                    wood.center = CGPoint(x: self.view.frame.maxX*0.5, y: self.LeftView.frame.maxY + wood.frame.height/2)
//                    self.view.bringSubviewToFront(self.lowerView)
                    
                } completion: { _ in
                    if wood.center == CGPoint(x: self.view.frame.maxX*0.5, y: self.LeftView.frame.maxY + wood.frame.height/2) && self.zentrConstraint.constant == 0 {
                        self.navigationController?.popViewController(animated: true)
                    }
                    wood.isHidden = true
                }
                
            case 3:
                
                var wood: UIImageView
                wood = UIImageView(frame:CGRect(x: self.view.frame.maxX*0.85, y: -100, width: 100, height: 100))
                wood.center = CGPoint(x: self.view.frame.maxX*0.85, y: 0)
                
                wood.image = #imageLiteral(resourceName: "wood")
                self.view.addSubview(wood)
                UIView.animate(withDuration: TimeInterval(self.speed), delay: 0, options: .curveEaseIn ) {
                    wood.center = CGPoint(x: self.view.frame.maxX*0.85, y: self.LeftView.frame.maxY + wood.frame.height/2)
//                    self.view.bringSubviewToFront(self.lowerView)
                    
                } completion: { _ in
                    if wood.center == CGPoint(x: self.view.frame.maxX*0.85, y: self.LeftView.frame.maxY + wood.frame.height/2) && self.zentrConstraint.constant == self.view.frame.width*0.33333 {
                        self.navigationController?.popViewController(animated: true)
                    }
                    wood.isHidden = true
                }
            default:
                
                print ("ошибка")
                
            }
        })
        
    }
    
    @IBAction func ButtonRight(_ sender: Any) {
        
        if self.zentrConstraint.constant == 0 {
            
            
            UIView.animate(withDuration: 0.5, delay: 0,  options: [.curveEaseIn]) {
                
                
                self.zentrConstraint.constant = self.view.frame.width*0.33333
                
                self.view.layoutIfNeeded()
                
            }
            
        } else { if self.zentrConstraint.constant == -self.view.frame.width*0.33333 {
            
            UIView.animate(withDuration: 0.5, delay: 0,  options: [.curveEaseIn]) {
                
                self.zentrConstraint.constant = 0
                
                self.view.layoutIfNeeded()
            }
        }
    }
        
}
    
    @IBAction func ButtonLeft(_ sender: Any) {
        
        if self.zentrConstraint.constant == self.view.frame.width*0.33333 {
            
            UIView.animate(withDuration: 0.5, delay: 0,  options: [.curveEaseIn]) {
                
                self.zentrConstraint.constant = 0
                
                self.view.layoutIfNeeded()
                
                //                self.CarOutlet.transform = CGAffineTransform(scaleX: 2, y: 0.5)
            }
        } else  { UIView.animate(withDuration: 0.5, delay: 0,  options: [.curveEaseIn]) {
           
            self.zentrConstraint.constant = -self.view.frame.width*0.33333
            
            self.view.layoutIfNeeded()
            
        }
        }
        
}
    
    
    func delay(_ delay:Double, closure:@escaping ()->()) {
        DispatchQueue.main.asyncAfter(
            deadline: .now () + 2 + Double(Int64(delay *
                                                    Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
    }
    
    
}










////                    var wood: UIImageView
//                    wood = UIImageView(frame:CGRect(x: self.view.frame.maxX*0.16666, y: -100, width: 100, height: 100))
//                    wood.center = CGPoint(x: self.view.frame.maxX*0.16666, y: 0)

//                    self.view.addSubview(wood)





//                        et coordinates = wood.frame.origin.y
//                        let coordinates1 = self.CarOutlet.frame.origin.y
//print (coordinates)
//print (coordinates1)
//                      var z = wood.center.y
//                        print (z)
//
//                        if self.zentrConstraint.constant == -self.view.frame.width*0.33333  {
//                            print ("1111")
//                        }
//                        var animator = UIDynamicAnimator()
//                        let collision = UICollisionBehavior(items: [wood, self.CarOutlet])
//                            collision.translatesReferenceBoundsIntoBoundary = true
//                            animator.addBehavior(collision)


//                    if  self.CarOutlet.bounds.intersects(wood.bounds) {
//                        self.timer.invalidate()
//                    }




//                    let horizontalConstraint = NSLayoutConstraint(item: wood, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)










//

//            self.CarOutlet.frame = CGRect(x: self.view.frame.maxX*0.75, y: self.RightView.frame.maxY, width: self.CarOutlet.frame.width, height: self.CarOutlet.frame.height)
//
////            self.RightView.addSubview(self.CarOutlet)
//
//
//            self.CarOutlet.layer.zPosition = 1
//            self.RightView.bringSubviewToFront(self.CarOutlet);
//


//            self.RightView.bringSubviewToFront(self.CarOutlet)
//
//            self.CarOutlet.center = CGPoint (x: self.RightView.frame.maxX/2, y: self.RightView.frame.maxY - self.CarOutlet.frame.height/2 - 5)
//
//            self.RightView.addSubview(self.CarOutlet)
//




//     self.RightView.superview?.bringSubviewToFront(self.CarOutlet)
//            self.CarOutlet.sendSubviewToBack(self.RightView)

//
//
//        }









//        if self.CarOutlet.center == CGPoint (x: self.RightView.frame.maxX/2, y: self.RightView.frame.maxY - self.CarOutlet.frame.height/2 - 5) {
//
//        UIView.animate(withDuration: 1) {
//
//            self.CarOutlet.center = CGPoint (x: self.CentrView.frame.maxX/4, y: self.CentrView.frame.maxY - self.CarOutlet.frame.height/2 - 5)
//        }} else
//
//            if self.CarOutlet.center == CGPoint (x: self.CentrView.frame.maxX/4, y: self.CentrView.frame.maxY - self.CarOutlet.frame.height/2 - 5) {
//
//
//                UIView.animate(withDuration: 1) {
//
//                self.CarOutlet.center = CGPoint (x: self.LeftView.frame.maxX/8, y: self.LeftView.frame.maxY - self.CarOutlet.frame.height/2 - 5)
//                    self.LeftView.addSubview(self.CarOutlet)
//                }}
//
//
//
//        }









