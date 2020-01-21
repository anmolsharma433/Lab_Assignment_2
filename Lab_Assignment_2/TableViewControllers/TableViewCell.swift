//
//  TableViewCell.swift
//  Lab_Assignment_2
//
//  Created by Anmol Sharma on 2020-01-21.
//  Copyright © 2020 anmol. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var totalDays: UILabel!
    @IBOutlet weak var workingDays: UILabel!
    @IBOutlet weak var daysLeft: UILabel!
    @IBOutlet weak var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
