//
//  NameCellTableViewCell.swift
//  CookBook
//
//  Created by José Carlos Araújo on 14/06/2018.
//  Copyright © 2018 Juliane Cristina. All rights reserved.
//

import UIKit

class NamesCellTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
