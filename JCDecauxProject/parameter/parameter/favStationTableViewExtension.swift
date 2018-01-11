//
//  favStationTableViewExtension.swift
//  JCDecauxProject
//
//  Created by jeremy ballot on 29/11/2017.
//  Copyright © 2017 jeremy ballot. All rights reserved.
//

import Foundation
import UIKit

extension ParameterViewControlleur: UITableViewDataSource, UITableViewDelegate{
   
    func hideShowWidget() {
        if reminderList.count == 0 {
            
            widgetController.setHasContent(false, forWidgetWithBundleIdentifier: "group.stationfav.remind")
            
        }else {
            widgetController.setHasContent(true, forWidgetWithBundleIdentifier: "group.stationfav.remind")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if reminderList.count == 0 {
            return 1
        }else {
            return reminderList.count
        }
        
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {

        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete", handler:  {_,_ in
            self.reminderList.remove(at: indexPath.row)
            UserDefaultsManager.addReminders(reminderDetails: self.reminderList)
            self.tableView.reloadData()
            self.hideShowWidget()
        })
        
        return [deleteAction]
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if reminderList.count == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellBase")
            return cell!
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellStationFav", for: indexPath) as? FavStationCell
            let data = reminderList[indexPath.row]
            cell?.configureCell(title: data["title"] as! String, adress: data["adress"] as! String)
            return cell!
        }
    }
    
    
    
}
