//
//  ImageViewRoundCornered.swift
//  Poojanam
//
//  Created by Gupta on 25/12/16.
//  Copyright © 2016 Gupta. All rights reserved.
//

import UIKit

class ImageViewRoundCornered: UIImageView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBInspectable var BorderColor : UIColor = UIColor.clear {
        didSet {
            layer.borderColor = BorderColor.cgColor
        }
    }
    
    @IBInspectable var BorderWidth : CGFloat = 0 {
        didSet {
            layer.borderWidth = BorderWidth
        }
    }
    
    @IBInspectable var CornerRadius : CGFloat = 0 {
        didSet {
            layer.cornerRadius = CornerRadius
        }
    }

}
