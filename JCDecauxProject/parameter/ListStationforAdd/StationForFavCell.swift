//
//  StationForFavCell.swift
//  JCDecauxProject
//
//  Created by jeremy ballot on 28/11/2017.
//  Copyright © 2017 jeremy ballot. All rights reserved.
//

import UIKit

class StationForFavCell: UITableViewCell {

    @IBOutlet weak var stationName: UILabel!
    @IBOutlet weak var stationAdress: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
