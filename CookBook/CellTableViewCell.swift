//
//  CellTableViewCell.swift
//  CookBook
//
//  Created by José Carlos Araújo on 13/06/2018.
//  Copyright © 2018 Juliane Cristina. All rights reserved.
//

import UIKit

class CellTableViewCell: UITableViewCell {



   
    @IBOutlet weak var titleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
