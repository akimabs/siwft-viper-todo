//
//  UIButton.Extension.swift
//  cobaviper
//
//  Created by Abdul Hakim on 15/10/23.
//

import Foundation
import UIKit

extension UIButton {
    func setLabel(val: String) {
        self.setTitle(val, for: .normal)
    }
    
    func setRadius(val: CGFloat) {
        self.layer.cornerRadius = val
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.systemBlue.cgColor
    }
    
    func setEnable(isEnabled: Bool) {
        if isEnabled {
            self.isEnabled = true
        } else {
            self.isEnabled = false
        }
    }
}
