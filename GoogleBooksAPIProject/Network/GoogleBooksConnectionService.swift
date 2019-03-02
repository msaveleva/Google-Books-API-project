//
//  GoogleBookService.swift
//  GoogleBooksAPIProject
//
//  Created by Maria Saveleva on 02/03/2019.
//  Copyright © 2019 Maria Saveleva. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class GoogleBooksConnectionService {
    
    static let shared = GoogleBooksConnectionService()
    
    private init() {}
    
    public func loadVolumesWithName(name: String, completion: @escaping (Any?) -> Void) {
        guard let parameterString = name.normalizeForSearchParameter(string: name) else {
            completion(nil)
            return
        }
        
        Alamofire.request(GoogleBooksRequestConverible.volumes(parameterString)).responseObject { (response: DataResponse<VolumeListResponse>) in
            guard response.result.isSuccess else {
                completion(nil)
                return
            }
            
            guard let value = response.result.value else {
                completion(nil)
                return
            }
            
            completion(value)
        }
    }
    
}
