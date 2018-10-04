//
//  AgreeToCar.swift
//  tienda
//
//  Created by Macbook on 28/09/18.
//  Copyright © 2018 Macbook. All rights reserved.
//

import UIKit

class AgreeToCar: UIButton {

    override func awakeFromNib() {
        
        layer.cornerRadius = 15
        
        layer.frame.size = CGSize(width: 233, height: 62)
        
        pulseAnimation()
    }
    
    func pulseAnimation(){
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        
        pulse.duration = 0.6
        pulse.fromValue = 0.95
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = 2
        pulse.initialVelocity = 0.5
        pulse.damping = 1.0
        
        layer.add(pulse, forKey: nil)
        
    }

}
