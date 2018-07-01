//
//  FieldLabel.swift
//  BudTransaction
//
//  Created by Godfrey Bagley-Clarke on 01/07/2018.
//  Copyright © 2018 Godfrey Bagley-Clarke. All rights reserved.
//

import UIKit

class FieldLabel: UILabel {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

@IBDesignable extension UILabel {
    @IBInspectable var cornerRadius: CGFloat {
         set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
        get {
            return layer.cornerRadius
        }
    }
}
