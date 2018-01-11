//
//  ListStationViewController.swift
//  JCDecauxProject
//
//  Created by jeremy ballot on 28/11/2017.
//  Copyright © 2017 jeremy ballot. All rights reserved.
//

import UIKit

class ListStationViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let searchController = UISearchController(searchResultsController: nil)
    var filterStations = [Station]()
    var selectedIndex : NSInteger! = -1
    let api = API()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.searchResultsUpdater = self
        tableView.tableHeaderView = searchController.searchBar
        definesPresentationContext = true
        searchController.dimsBackgroundDuringPresentation = false
        //tableView.estimatedRowHeight = 113
        tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.dataSource = self
        self.tableView.delegate = self
        tableView.reloadData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
