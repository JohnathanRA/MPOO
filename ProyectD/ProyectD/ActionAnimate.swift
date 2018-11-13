//
//  ActionAnimate.swift
//  ProyectD
//
//  Created by Macbook on 13/11/18.
//  Copyright © 2018 DixLab. All rights reserved.
//

import UIKit

class ActionAnimate: UIButton {

    override func awakeFromNib() {
        layer.cornerRadius = 25
        
        pulseAnimation()
    }
    
    func pulseAnimation(){
//        let pulse = CASpringAnimation(keyPath: "transform.scale")
//        pulse.duration = 0.6
//        pulse.fromValue = 0.95
//        pulse.toValue = 1.0
//        pulse.autoreverses = true
//        pulse.repeatCount = 2
//        pulse.initialVelocity = 0.5
//        pulse.damping = 1.0
        
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.5
        flash.fromValue = 1.0
        flash.toValue = 0.1
        flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = 2
        
//        let shake = CABasicAnimation(keyPath: "position")
//        shake.duration = 0.5
//
//        let fromPoint = CGPoint(x: center.x - 15, y: center.y)
//        let fromValue = NSValue(cgPoint: fromPoint)
//
//        let toPoint = CGPoint(x: center.x + 15, y: center.y)
//        let toValue = NSValue(cgPoint: toPoint)
//
//        shake.fromValue = fromValue
//        shake.toValue = toValue
//
//        shake.repeatCount = 2
//        shake.autoreverses = true
//
//        layer.add(shake, forKey: nil)
        layer.add(flash, forKey: nil)
//        layer.add(pulse, forKey: nil)
    }

}
