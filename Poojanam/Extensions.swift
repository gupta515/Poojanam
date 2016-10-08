//
//  Constants.swift
//  Poojanam
//
//  Created by Gupta on 02/10/16.
//  Copyright © 2016 Gupta. All rights reserved.
//

import UIKit

extension UINavigationController{
    public func removeNavigationBarBorder(){
        self.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationBar.shadowImage = UIImage()
    }
}

extension UIColor {
    public func appBaseColorSaffaron() -> UIColor {
        return UIColor.init(colorLiteralRed: 0.984, green: 0.549, blue: 0.000, alpha: 1)
    }
    
    public func colorGray() -> UIColor {
        return UIColor.init(colorLiteralRed: 0.961, green: 0.961, blue: 0.961, alpha: 1)
    }
}

extension UIButton {
    public func swapButtonState(active : Bool) {
        if active {
            self.backgroundColor = UIColor().appBaseColorSaffaron()
            self.setTitleColor(UIColor.white, for: UIControlState.normal)
        } else {
            self.backgroundColor = UIColor().colorGray()
            self.setTitleColor(UIColor().appBaseColorSaffaron(), for: UIControlState.normal)
        }
    }
}

extension UIView{
    public func setViewRoundCorner(borderWidth : CGFloat = 0, cornerRadius : CGFloat = 0){
        self.layer.borderWidth = borderWidth
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
    }
    
    public func setViewRoundCornerWithBorder(borderWidth : CGFloat = 0, cornerRadius : CGFloat = 0, borderColor : UIColor = UIColor.white){
        self.setViewRoundCorner(borderWidth: borderWidth, cornerRadius: cornerRadius)
        self.layer.borderColor = borderColor.cgColor
    }
}

extension UITextView{
    public func setTextViewHeightAsPerContent(){
        let contentSize = self.sizeThatFits(self.bounds.size)
        var frame = self.frame
        frame.size.height = contentSize.height
        self.frame = frame
    }
}
