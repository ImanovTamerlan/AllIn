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

