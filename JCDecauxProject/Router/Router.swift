//
//  Router.swift
//  Velov
//
//  Created by jeremy ballot on 28/11/2017
//  Copyright © 2017 jeremy ballot. All rights reserved.
//

import Foundation
//https://api.jcdecaux.com/vls/v1/stations/  5015?contract=Lyon&apiKey=03923c048978b91d2d429d25625690322c9ca033

open class Router {
      let baseURL = URL(string: "https://api.jcdecaux.com/vls/v1/stations")!


    
    func buildURL(path : String )-> URL{
        let urlComps = URL(string: "\(self.baseURL)/\(path)")
        
        return urlComps!
    }
    
    
    
}
