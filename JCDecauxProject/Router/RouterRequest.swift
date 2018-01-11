//
//  RouterRequest.swift
//  Velov
//
//  Created by jeremy ballot on 28/11/2017
//  Copyright © 2017 jeremy ballot. All rights reserved.
//

import Foundation

private let key = "03923c048978b91d2d429d25625690322c9ca033"

public extension Router {
    
    internal func requestStationt(valueStation: String)-> URLRequest{
       return URLRequest(url: self.buildURL(path: valueStation+"?contract=Lyon&apiKey=\(key)") as URL)
        
    }


    
    
}
