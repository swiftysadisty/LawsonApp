//
//  UIFont-Ext.swift
//  LawsonApp
//
//  Created by Алмаз Рахматуллин on 04.07.2024.
//

import UIKit

extension UIFont {
    
    enum Montserrat: String {
        case bold = "Montserrat-Bold"
        case medium = "Montserrat-Medium"
    }
    
    class func montserratFont(ofSize fontSize: CGFloat, weight: UIFont.Montserrat) -> UIFont {
        return UIFont(name: weight.rawValue, size: fontSize) ?? .systemFont(ofSize: fontSize)
    }
}
