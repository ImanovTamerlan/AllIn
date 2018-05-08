//
//  UIExtension.swift
//  AllIn
//
//  Created by Tamerlan Imanov on 08.05.2018.
//  Copyright © 2018 MarsStudio. All rights reserved.
//

import UIKit

extension UIViewController {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
}

extension UIView {
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
}

extension UIStoryboard {
    
    class func create<T: UIViewController>(with name: String, identifier: String) -> T {
        return UIStoryboard(name: name, bundle: nil).instantiateViewController(withIdentifier: identifier) as! T
    }
    
}

extension UIFont {
    class func systemFontWithScale(fontSize size: CGFloat, weight: CGFloat = UIFont.Weight.regular.rawValue) -> UIFont {
        let scale = getFontScaleForDevice()
        return UIFont.systemFont(ofSize: size * scale, weight: UIFont.Weight(rawValue: weight))
    }
    
    func withScaleSize(fontSize size: CGFloat) -> UIFont {
        let scale = UIFont.getFontScaleForDevice()
        return self.withSize(size * scale)
    }
    
    func withScale() -> UIFont {
        let scale = UIFont.getFontScaleForDevice()
        return self.withSize(self.pointSize * scale)
    }
    
    fileprivate class func getFontScaleForDevice() -> CGFloat {
        var sizeScale = CGFloat(1.0)
        if DeviceType.IS_IPHONE_5 {
            sizeScale = 0.882352941
        }
        return sizeScale
    }
}
