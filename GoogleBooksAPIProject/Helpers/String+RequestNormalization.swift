//
//  File.swift
//  GoogleBooksAPIProject
//
//  Created by Maria Saveleva on 02/03/2019.
//  Copyright © 2019 Maria Saveleva. All rights reserved.
//

import Foundation

extension String {
    
    public func normalizeForSearchParameter(string: String) -> String? {
        return string.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    }
    
}
