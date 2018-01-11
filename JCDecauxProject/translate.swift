//
//  translate.swift
//  JCDecauxProject
//
//  Created by jeremy ballot on 11/12/2017.
//  Copyright © 2017 jeremy ballot. All rights reserved.
//

import Foundation

extension String {
    var translate: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
