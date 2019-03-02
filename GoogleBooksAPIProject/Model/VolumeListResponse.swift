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
    var kind: String!
    var totalItems: Int!
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        kind <- map["kind"]
        totalItems <- map["totalItems"]
    }
}
