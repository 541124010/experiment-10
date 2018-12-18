//
//  ViewController.swift
//  重力和碰撞
//
//  Created by student on 2018/11/24.
//  Copyright © 2018年 xh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var animator:UIDynamicAnimator!//  一定要拆包
    
    
    var gravity=UIGravityBehavior()
    var collision=UICollisionBehavior()
    var time:Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        dynamicAnimation()
    }
    
    
    @IBAction func stop(_ sender: Any) {
        time?.invalidate()
    }
    func dynamicAnimation(){
        animator=UIDynamicAnimator(referenceView: self.view)
        
        animator.addBehavior(gravity)
        animator.addBehavior(collision)
        //限制掉落的边界
        collision.translatesReferenceBoundsIntoBoundary=true
        
        //闭包里要self
       time=Timer.scheduledTimer(withTimeInterval: 0.5, repeats:true) { (t) in
            let x=CGFloat(arc4random()%(UInt32(self.view.frame.width)-50)) //.bounds.width
            let fallingview=UIView(frame: CGRect(x: x, y: 20, width: 50, height: 50))
            fallingview.backgroundColor=UIColor.green
            fallingview.layer.borderWidth=1
            fallingview.layer.cornerRadius=10
            self.view.addSubview(fallingview)
            
            self.gravity.addItem(fallingview)
            self.collision.addItem(fallingview)
        }
        
        
    }
    
    
    @IBAction func up(_ sender: Any) {
        gravity.gravityDirection=CGVector(dx: 0, dy: -1)
    }
    


    @IBAction func left(_ sender: Any) {
        gravity.gravityDirection=CGVector(dx: -1, dy: 0)
    }
    
}

