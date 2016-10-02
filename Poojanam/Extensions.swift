//
//  Constants.swift
//  Poojanam
//
//  Created by Gupta on 02/10/16.
//  Copyright © 2016 Gupta. All rights reserved.
//

import UIKit

extension UIColor {
    public func appBaseColorSaffaron() -> UIColor {
        return UIColor.init(colorLiteralRed: 0.984, green: 0.549, blue: 0.000, alpha: 1)
    }
    
    public func btnInactiveColorGray() -> UIColor {
        return UIColor.init(colorLiteralRed: 0.961, green: 0.961, blue: 0.961, alpha: 1)
    }
}

extension UIButton {
    public func swapButtonState(active : Bool) {
        if active {
            self.backgroundColor = UIColor().appBaseColorSaffaron()
            self.setTitleColor(UIColor.white, for: UIControlState.normal)
        } else {
            self.backgroundColor = UIColor().btnInactiveColorGray()
            self.setTitleColor(UIColor().appBaseColorSaffaron(), for: UIControlState.normal)
        }
    }
}
