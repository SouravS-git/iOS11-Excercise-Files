//
//  Round.swift
//  Button Circles
//
//  Created by Sourav Sarkar on 26/07/18.
//  Copyright © 2018 Sourav Sarkar. All rights reserved.
//

import UIKit
@IBDesignable

class Round: UIButton {
    
    @IBInspectable var cornerRadius: Int = 0 {
        didSet {
            self.layer.cornerRadius = CGFloat(cornerRadius)
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear{
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: Int = 0 {
        didSet {
            self.layer.borderWidth = CGFloat(borderWidth)
        }
    }
}
