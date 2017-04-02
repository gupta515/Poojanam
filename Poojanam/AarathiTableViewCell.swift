//
//  AarathiTableViewCell.swift
//  Poojanam
//
//  Created by Gupta on 09/10/16.
//  Copyright © 2016 Gupta. All rights reserved.
//

import UIKit

class AarathiTableViewCell: UITableViewCell {

    @IBOutlet weak var aarathiDietyImage: UIImageView!
    @IBOutlet weak var aarathiDietyName: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
