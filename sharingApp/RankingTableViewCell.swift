//
//  RankingTableViewCell.swift
//  sharingApp
//
//  Created by 大原一倫 on 2020/01/19.
//  Copyright © 2020 oharakazumasa. All rights reserved.
//

import UIKit

class RankingTableViewCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var rankLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
