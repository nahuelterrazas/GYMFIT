//
//  UIView+Ext.swift
//  GYMFIT
//
//  Created by Nahuel Terrazas on 03/01/2024.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        for view in views { addSubview(view) }
    }
}
