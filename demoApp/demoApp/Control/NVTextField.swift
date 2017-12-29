//
//  NVTextField.swift
//  demoApp
//
//  Created by tuannv on 12/28/17.
//  Copyright © 2017 tuannv. All rights reserved.
//

import UIKit

class NVTextField: UITextField {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureUI()
    }
    
    private func configureUI() {
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 0.5
        self.layer.cornerRadius = self.frame.height/2
        self.clipsToBounds = true
    }
}
