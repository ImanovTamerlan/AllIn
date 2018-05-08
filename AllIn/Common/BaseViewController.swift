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

extension CustomNavigationBar {
    var navigationType: NavigationBarType {
        get {
            return .visible
        }
        set {}
    }
    
    var backButtonType: BackButtonType {
        get {
            return .hidden
        }
        set {}
    }
}

class BaseViewController: UIViewController, CustomNavigationBar {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureBackButton()
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
        }
    }
}

