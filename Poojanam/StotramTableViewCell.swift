//
//  StotramTableViewCell.swift
//  Poojanam
//
//  Created by Gupta on 19/10/16.
//  Copyright © 2016 Gupta. All rights reserved.
//

import UIKit

class StotramTableViewCell: UITableViewCell {

    @IBOutlet weak var stotramAudioBtn: UIButton!
    @IBOutlet weak var stotramProgressLabel: UILabel!
    @IBOutlet weak var stotramNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
