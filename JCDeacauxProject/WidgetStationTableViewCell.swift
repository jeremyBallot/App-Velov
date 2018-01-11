//
//  WidgetStationTableViewCell.swift
//  JCDeacauxProject
//
//  Created by jeremy ballot on 29/11/2017.
//  Copyright © 2017 jeremy ballot. All rights reserved.
//

import UIKit

class WidgetStationTableViewCell: UITableViewCell {

    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    @IBOutlet weak var nameStation: UILabel!
    @IBOutlet weak var numberBike: UILabel!
    @IBOutlet weak var numberStation: UILabel!
    @IBOutlet weak var bikeImage: UIImageView!
    @IBOutlet weak var terminalImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        visualEffectView.effect = UIVibrancyEffect.widgetPrimary()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configureCell(nom : String, numberVelov : String, numberTerminal : String) {
        nameStation.text = nom
        numberBike.text = numberVelov
        numberStation.text = numberTerminal
        
        
    }
}
