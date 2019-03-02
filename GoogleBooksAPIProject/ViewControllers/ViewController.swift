//
//  ViewController.swift
//  GoogleBooksAPIProject
//
//  Created by Maria Saveleva on 02/03/2019.
//  Copyright © 2019 Maria Saveleva. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tappedSearchButton(_ sender: Any) {
        let alert = UIAlertController(title: "Searching for a book", message:"What book are you looking for?" , preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Enter book name"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        let searchAction = UIAlertAction(title: "Search", style: .default) { [weak self] action in
            guard let textField = alert.textFields?.first,
                let searchText = textField.text else {
                    return
            }

            self?.fetchBooksWithName(name: searchText, completion: { result in
                guard let serverData = result else {
                    return
                }
                
                print(serverData)
            });
        }
        
        alert.addAction(cancelAction)
        alert.addAction(searchAction)
        
        present(alert, animated: true)
    }
    
    private func fetchBooksWithName(name: String, completion: @escaping (Any?) -> Void) {
        guard let parameterString = name.normalizeForSearchParameter(string: name) else {
            completion(nil)
            return
        }
        
        let urlString = "https://www.googleapis.com/books/v1/volumes?q=\(parameterString)"
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        Alamofire.request(url).responseObject { (response: DataResponse<VolumeListResponse>) in
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

