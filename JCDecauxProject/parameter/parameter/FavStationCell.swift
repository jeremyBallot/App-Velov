//
//  favStationCell.swift
//  JCDecauxProject
//
//  Created by jeremy ballot on 29/11/2017.
//  Copyright © 2017 jeremy ballot. All rights reserved.
//

import UIKit

class FavStationCell: UITableViewCell {

    @IBOutlet weak var nameStation: UILabel!
    @IBOutlet weak var adressStation: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(title:String, adress: String) {
        
        nameStation.text = title
        adressStation.text = adress
        
    }

}
