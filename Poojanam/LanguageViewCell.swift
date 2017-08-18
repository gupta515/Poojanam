//
//  LanguageViewCell.swift
//  Poojanam
//
//  Created by Gupta on 19/09/16.
//  Copyright © 2016 Gupta. All rights reserved.
//

import UIKit

class LanguageViewCell: UITableViewCell {
    
    @IBOutlet var languageLable : UILabel!
    @IBOutlet weak var languageHighLight: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
