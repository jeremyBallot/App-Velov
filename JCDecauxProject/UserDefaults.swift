//
//  UserDefaults.swift
//  JCDecauxProject
//
//  Created by jeremy ballot on 29/11/2017.
//  Copyright © 2017 jeremy ballot. All rights reserved.
//

import Foundation


    class UserDefaultsManager {
        private static let JCDecauxFav: String = "JCDecauxFav"
        
        class func addReminders(reminderDetails: [[String:AnyObject]]) {
            UserDefaults(suiteName: "group.stationfav.remind")?.set(reminderDetails, forKey: JCDecauxFav)
        }
            
            class func getReminders() -> [[String:AnyObject]]? {
                let value =  UserDefaults(suiteName: "group.stationfav.remind")?.value(forKey: JCDecauxFav)
                return value as? [[String:AnyObject]]
            }
            
        }



