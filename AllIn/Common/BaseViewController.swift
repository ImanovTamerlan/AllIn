//
//  BaseViewController.swift
//  AllIn
//
//  Created by Tamerlan Imanov on 08.05.2018.
//  Copyright © 2018 MarsStudio. All rights reserved.
//

import UIKit

enum NavigationBarType {
    case hidden
    case visible
    case translucent
}

enum BackButtonType {
    case hidden
    case visible
}

protocol CustomNavigationBar {
    var navigationType: NavigationBarType { get set }
    var backButtonType: BackButtonType { get set }
}

class BaseViewController: UIViewController, CustomNavigationBar {
    var navigationType: NavigationBarType = .visible
    var backButtonType: BackButtonType = .hidden
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureBackButton()
        configureNavigationBar()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension BaseViewController {
    
    private func configureBackButton() {
        switch backButtonType {
        case .hidden:
            let item = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
            self.navigationItem.backBarButtonItem = item
        case .visible:
            break
        }
    }
    
    private func configureNavigationBar() {
        switch navigationType {
        case .hidden:
            self.navigationController?.navigationBar.isHidden = true
        case .translucent:
            self.navigationController?.navigationBar.isHidden = false
        case .visible:
            self.navigationController?.navigationBar.isHidden = false
            self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 1, green: 0.3921568627, blue: 0.4039215686, alpha: 1)
            self.navigationController?.navigationBar.tintColor = .white
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.black]
            self.navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 1, green: 0.3921568627, blue: 0.4039215686, alpha: 1)
            self.navigationController?.navigationBar.shadowImage = UIImage()
            self.navigationController?.navigationBar.isTranslucent = false
        }
    }
}

