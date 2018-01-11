//
//  TodayViewController.swift
//  JCDeacauxProject
//
//  Created by jeremy ballot on 29/11/2017.
//  Copyright © 2017 jeremy ballot. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    @IBOutlet weak var tableView: UITableView!
    let api = API()
    
    var StationRemind = [[String:AnyObject]]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        extensionContext?.widgetLargestAvailableDisplayMode = .expanded
        StationRemind = UserDefaultsManager.getReminders() ?? []
        self.tableView.dataSource = self
        self.tableView.delegate = self
        

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        if let reminders = UserDefaultsManager.getReminders() {
            StationRemind = reminders
            completionHandler(.newData)
        }else {
            completionHandler(.failed)
        }
    }
    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
        
        if (activeDisplayMode == NCWidgetDisplayMode.compact) {
            self.preferredContentSize = CGSize()
        }
        else {
            let height = StationRemind.count > 0 ? StationRemind.count * 59 : 59
            self.preferredContentSize = CGSize(width: 0, height: height);
        }
        
    }
    
   
}
