//
//  CustomLabel.swift
//  AllIn
//
//  Created by Tamerlan Imanov on 08.05.2018.
//  Copyright © 2018 MarsStudio. All rights reserved.
//

import UIKit

class CustomLabel: UILabel {

    override func awakeFromNib() {
        super.awakeFromNib()
        if DeviceType.IS_IPHONE_5 {
            self.font = self.font.withSize(self.font.pointSize-2)
        }
    }

}
