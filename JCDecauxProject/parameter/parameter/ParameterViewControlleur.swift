//
//  ParameterViewControlleur.swift
//  JCDecauxProject
//
//  Created by jeremy ballot on 28/11/2017.
//  Copyright © 2017 jeremy ballot. All rights reserved.
//

import UIKit
import NotificationCenter

class ParameterViewControlleur: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var widgetController = NCWidgetController()
    var reminderList = [[String:AnyObject]]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
       
        

        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        //refreshUI()
        //tableView.reloadData()
//         NotificationCenter.default.addObserver(self, selector: #selector(ParameterViewControlleur.refreshUI), name: Notification.Name.cameInForeground, object: nil)
        // Do any additional setup after loading the view.
    }
    func refreshUI() {
        if let reminderArray = UserDefaultsManager.getReminders() {
            reminderList = reminderArray
            
        }
    }
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshUI()

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
