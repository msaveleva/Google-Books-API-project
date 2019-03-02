//
//  VolumeListResponse.swift
//  GoogleBooksAPIProject
//
//  Created by Maria Saveleva on 02/03/2019.
//  Copyright © 2019 Maria Saveleva. All rights reserved.
//

import Foundation
import ObjectMapper

class VolumeListResponse: Mappable {
    var totalItems: Int!
    var items: [Volume]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        totalItems <- map["totalItems"]
        items <- map["items"]
    }
}
