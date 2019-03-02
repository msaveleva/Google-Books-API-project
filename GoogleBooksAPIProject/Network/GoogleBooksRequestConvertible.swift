//
//  GoogleBooksRequestUtil.swift
//  GoogleBooksAPIProject
//
//  Created by Maria Saveleva on 02/03/2019.
//  Copyright © 2019 Maria Saveleva. All rights reserved.
//

import Foundation
import Alamofire

enum GoogleBooksRequestConverible: URLRequestConvertible {
    enum Constants {
        static let BaseUrlPath = "https://www.googleapis.com/books/v1"
    }
    
    //Add other cases if needed (Bookshelf, etc.).
    case volumes(String)
    
    var method: HTTPMethod {
        switch self {
        case .volumes:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .volumes:
            return "/volumes"
        }
    }
    
    var parameters: [String : Any] {
        switch self {
        case .volumes(let query):
            return [ "q" : query]
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        let url = try Constants.BaseUrlPath.asURL()
        
        var request = URLRequest(url: url.appendingPathComponent(path))
        request.httpMethod = method.rawValue
        
        return try URLEncoding.default.encode(request, with: parameters)
    }
    
}
