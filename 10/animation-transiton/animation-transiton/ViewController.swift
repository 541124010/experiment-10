//
//  ViewController.swift
//  animation-transiton
//
//  Created by student on 2018/11/24.
//  Copyright © 2018年 xh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var firstView: UIView!
    var secondView: UIView!
    
    @IBOutlet weak var orangeview: UIView!
    var timer:Timer?
    @IBOutlet weak var pinkview: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        timer=Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (t) in
            self.orangeview.center.x+=20
        })
        
        
        animation()
        
        transition()
      
    }
    
    @IBAction func stop(_ sender: Any) {
        timer?.invalidate()
    }
    
    func animation(){
        let myview=UIView(frame: CGRect(x: 0, y: 20, width: 100, height: 100))
        myview.backgroundColor=UIColor.red
        self.view.addSubview(myview)
        
        //3秒的过程重复repeat
        UIView.animate(withDuration: 3, delay: 0, options: [.autoreverse], animations: {
            myview.frame=CGRect(x: 300, y: 500, width: 10, height: 10)
            myview.backgroundColor=UIColor.yellow
            //好像view才可以用这个 label不行 参照手势那个
            myview.transform=myview.transform.rotated(by: CGFloat.pi)
        
            myview.transform=CGAffineTransform(rotationAngle: (CGFloat(Double.pi)))
            //2d??
            myview.transform=CGAffineTransform.identity
          //  myview.alpha=0//透明
        }, completion: { (finished) in
           // myview.removeFromSuperview() //消失  透明消失两部曲
        })
    }
    
    
    
    
    func transition(){
        let btn=UIButton(frame: CGRect(x: 0, y: 200, width: 100, height: 50))
        btn.setTitle("切换视图(改背景色)", for:.normal)
        btn.setTitleColor(UIColor.purple, for: .normal)
        btn.addTarget(self, action: #selector(changeView), for: .touchUpInside)
        self.view.addSubview(btn)
        
        let btn2=UIButton(frame: CGRect(x: 0, y: 400, width: 100, height: 50))
        btn2.setTitle("切换View", for:.normal)
        btn2.setTitleColor(UIColor.purple, for: .normal)
        btn2.addTarget(self, action: #selector(changeView2), for: .touchUpInside)
        self.view.addSubview(btn2)
        
        //  代码生成可以完全位置相同
        firstView = UIView(frame: CGRect(x: 100, y: 300, width: 100, height: 100))
        firstView.backgroundColor = UIColor.purple
        self.view.addSubview(firstView)
        
        secondView = UIView(frame: CGRect(x: 100, y: 300, width: 100, height: 100))
        secondView.backgroundColor = UIColor.brown
        self.view.addSubview(secondView)

    
        
    }
    
    @objc func changeView(){
        UIView.transition(with: firstView, duration: 3, options: .transitionCurlUp, animations: {
            
            //把firstview定义在外面就可以直接访问 而不用 去遍历判断 但是s缺点是数量有限 不便于循环
                self.firstView.backgroundColor=UIColor.brown
            }, completion: nil)
    }
    
    @objc func changeView2(){
//         UIView.transition(from: firstView, to: secondView, duration: 3, options: .transitionFlipFromLeft, completion: nil)
        
        //相对于父视图反转 只是正好在同一位置  从brown到purple
           UIView.transition(from:  secondView, to: firstView, duration: 3, options: [.transitionFlipFromLeft], completion: nil)
    }

    @IBAction func fromviewtoimage(_ sender: Any) {
        
        let imageview=UIImageView(frame:CGRect(x: 300, y: 100, width: 100, height: 100))
        imageview.image=UIImage(named:"6" )
        UIView.transition(from: pinkview, to: imageview, duration: 2, options:.transitionFlipFromLeft, completion: nil)
    }
    
}

