//
//  API.swift
//  Velov
//
//  Created by jeremy ballot on 28/11/2017.
//  Copyright © 2017 jeremy ballot. All rights reserved.
//

import Foundation

open class API {
    
    open var router = Router()
    
    func get(_ request : URLRequest, completionHandler : @escaping (([String:AnyObject])?)->()){
        
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
            
            if (error != nil) {
               // print(error!.localizedDescription) // On indique dans la console ou est le problème dans la requête
               completionHandler(nil)
                return
            }
            if let httpStatus = response as? HTTPURLResponse , httpStatus.statusCode != 200 {
//                print("statusCode incorect \(httpStatus.statusCode)")
//                print("réponse = \(String(describing: response))")
                 completionHandler(nil)
                return
            }
            do{
                let dict = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any]
                //print(dict!)
                completionHandler( dict! as [String : AnyObject])
                
            }
            catch _ as NSError{
                
            }
        })
        task.resume()
        
    }
}
