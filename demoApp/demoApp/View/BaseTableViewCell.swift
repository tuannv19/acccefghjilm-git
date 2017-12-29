//
//  BaseTableViewCell.swift
//  demoApp
//
//  Created by tuannv on 12/29/17.
//  Copyright © 2017 tuannv. All rights reserved.
//

import UIKit

struct LeftMenuModal {
    var name : String
    var icon : String
}

open class BaseTableViewCell : UITableViewCell {
    
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    open override func awakeFromNib() {
    }
    
    open func setup() {
    }
    
    open class func height() -> CGFloat {
        return 48
    }
    
    open func setData(_ data: Any?) {
        if let leftMenuModal = data as? LeftMenuModal {
            self.backgroundColor = UIColor(hex: "F1F8E9")
            self.textLabel?.font = UIFont.italicSystemFont(ofSize: 14)
            self.textLabel?.textColor = UIColor(hex: "9E9E9E")
            
            self.textLabel?.text = leftMenuModal.name
            
            self.imageView?.image = UIImage.init(named: leftMenuModal.icon)
        }
        
    }
    
    override open func setHighlighted(_ highlighted: Bool, animated: Bool) {
        if highlighted {
            self.alpha = 0.4
        } else {
            self.alpha = 1.0
        }
    }
    
    // ignore the default handling
    override open func setSelected(_ selected: Bool, animated: Bool) {
    }
    
}
