//
//  localTableViewCell.swift
//  sharingApp
//
//  Created by 大原一倫 on 2019/12/08.
//  Copyright © 2019 oharakazumasa. All rights reserved.
//

import UIKit

class localTableViewCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
