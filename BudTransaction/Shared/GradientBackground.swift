//
//  GradientBackground.swift
//  BudTransaction
//
//  Created by Godfrey Bagley-Clarke on 01/07/2018.
//  Copyright © 2018 Godfrey Bagley-Clarke. All rights reserved.
//

import UIKit

class GradientBackground: NSObject {
    
    func setGradientBackground(view: UIView) {
        
        let colorTop =  UIColor(red: 60.0/255.0, green: 60.0/255.0, blue: 60.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [ colorTop, colorBottom]
        gradientLayer.locations = [ 0.0, 1.0]
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
