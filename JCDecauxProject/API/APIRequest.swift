//
//  APIRequest.swift
//  Velov
//
//  Created by jeremy ballot on 28/11/2017.
//  Copyright © 2017 jeremy ballot. All rights reserved.
//

import Foundation


public extension API {
    
    
    internal func stationCkeck( valueStation: String , completionHandler : @escaping (([String:AnyObject])?)->()) {
        get(router.requestStationt(valueStation: valueStation)) { (dict) in
            if dict != nil {
                completionHandler (dict!)
            }
            else{
               completionHandler (nil)
            }
            

        }
        
    }
    
        
}
