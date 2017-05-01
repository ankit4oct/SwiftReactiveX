//
//  TableViewCell.swift
//  SwiftReactiveX
//
//  Created by ANKIT SHARMA on 30/04/17.
//  Copyright © 2017 ANKIT SHARMA. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
