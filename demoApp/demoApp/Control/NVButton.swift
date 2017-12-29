//
//  NVButton.swift
//  demoApp
//
//  Created by tuannv on 12/28/17.
//  Copyright © 2017 tuannv. All rights reserved.
//

import UIKit

class NVButton: UIButton {
    
    
    let kLoginButtonBackgroundColor = UIColor(displayP3Red: 31/255, green: 75/255, blue: 164/255, alpha: 1)
    let kLoginButtonTintColor = UIColor.white


    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureUI()
    }
    
    private func configureUI() {
        self.backgroundColor = kLoginButtonBackgroundColor
        self.layer.cornerRadius = self.frame.height/2
        self.tintColor = kLoginButtonTintColor
        self.clipsToBounds = true
        
    }
}
