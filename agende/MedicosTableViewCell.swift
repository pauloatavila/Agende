//
//  MedicosTableViewCell.swift
//  agende
//
//  Created by Paulo Atavila on 22/02/18.
//  Copyright © 2018 Paulo Atavila. All rights reserved.
//

import UIKit

class MedicosTableViewCell: UITableViewCell {

    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var crmLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
