//
//  Book.swift
//  GoogleBooksAPIProject
//
//  Created by Maria Saveleva on 02/03/2019.
//  Copyright © 2019 Maria Saveleva. All rights reserved.
//

import Foundation
import ObjectMapper

class Volume: Mappable {
    var identifier: String!
    
    var title: String!
    var authors: [String]?
    var description: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        identifier <- map["id"]
        
        title <- map["volumeInfo.title"]
        authors <- map["volumeInfo.authors"]
        description <- map["volumeInfo.description"]
    }
    
}
