//
//  ListStationForFav.swift
//  JCDecauxProject
//
//  Created by jeremy ballot on 28/11/2017.
//  Copyright © 2017 jeremy ballot. All rights reserved.
//

import UIKit

class ListStationForFav: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let searchController = UISearchController(searchResultsController: nil)
    var filterStations = [Station]()
    var selectedIndex : NSInteger! = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        tableView.tableHeaderView = searchController.searchBar
        definesPresentationContext = true
        self.tableView.dataSource = self
        self.tableView.delegate = self
        tableView.reloadData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func saveStation(stationAddFav : Station){
        if let defaultArray =  UserDefaultsManager.getReminders() {
            var reminderArray = defaultArray
            var dict = [String:AnyObject]()
            let title : String = stationAddFav.title!
            let adress : String = stationAddFav.subtitle!
            let numero : String = stationAddFav.number!
            dict.updateValue(title as AnyObject, forKey: "title")
            dict.updateValue(adress as AnyObject, forKey: "adress")
            dict.updateValue(numero as AnyObject, forKey: "numero")
            reminderArray.append(dict)
            UserDefaultsManager.addReminders(reminderDetails: reminderArray)
        }
        else{
            var reminderArray = [[String:AnyObject]]()
            var dict = [String:AnyObject]()
            let title : String = stationAddFav.title!
            let adress : String = stationAddFav.subtitle!
            let numero : String = stationAddFav.number!
            dict.updateValue(title as AnyObject, forKey: "title")
            dict.updateValue(adress as AnyObject, forKey: "adress")
            dict.updateValue(numero as AnyObject, forKey: "numero")
            reminderArray.append(dict)
            UserDefaultsManager.addReminders(reminderDetails: reminderArray)
        }
     let _ = self.navigationController?.popViewController(animated: true)
    }
}
