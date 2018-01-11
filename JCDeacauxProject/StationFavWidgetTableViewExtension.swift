//
//  StationFavWidgetTableViewExtension.swift
//  JCDeacauxProject
//
//  Created by jeremy ballot on 01/12/2017.
//  Copyright © 2017 jeremy ballot. All rights reserved.
//

import Foundation
import UIKit

extension TodayViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StationRemind.count
    }
    
    func refreshWidget() {
        StationRemind = UserDefaultsManager.getReminders() ?? []
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        extensionContext?.open(URL(string: "widgetStation://")!, completionHandler: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellWidget", for: indexPath) as? WidgetStationTableViewCell
            let data = StationRemind[indexPath.row]
        cell?.nameStation.text = data["title"] as? String
        self.api.stationCkeck(valueStation:  data["numero"] as! String , completionHandler: {dict in DispatchQueue.main.async {
            if let number = dict!["available_bikes"] as? Int {
                
                cell?.numberBike.text = "\(number)"
                cell?.bikeImage.isHidden = false
                cell?.terminalImage.isHidden = false
            }
            else{
                cell?.numberBike.text = "error_loading".translate
            }
            if let number = dict!["available_bike_stands"] as? Int {
                //print("\(number)")
                cell?.numberStation.text = "\(number)"
            }
            else{
                cell?.numberStation.text = "error_loading".translate
            }
            
            }
        })
        if cell?.numberBike.text == " " {
            cell?.numberBike.text = "Impossible_to_connect".translate
            cell?.bikeImage.isHidden = true
            cell?.terminalImage.isHidden = true
        }
            
            return cell!
        }
    
}

