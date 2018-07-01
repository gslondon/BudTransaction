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
    
    var topInset:       CGFloat = 0
    var rightInset:     CGFloat = 0
    var bottomInset:    CGFloat = 0
    var leftInset:      CGFloat = 0
    
    override func drawText(in rect: CGRect) {
        let insets: UIEdgeInsets = UIEdgeInsets(top: self.topInset, left: self.leftInset, bottom: self.bottomInset, right: self.rightInset)
        self.setNeedsLayout()
        return super.drawText(in: UIEdgeInsetsInsetRect(rect, insets))
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
