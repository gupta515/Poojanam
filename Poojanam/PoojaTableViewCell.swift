//
//  PoojaTableViewCell.swift
//  Poojanam
//
//  Created by Gupta on 26/09/16.
//  Copyright © 2016 Gupta. All rights reserved.
//

import UIKit

class PoojaTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var poojaDietyImage: UIImageView!
    @IBOutlet weak var poojaNameBtn: UIButton!
    @IBOutlet weak var poojaInfoBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
