//
//  DetailViewController.swift
//  GoogleBooksAPIProject
//
//  Created by Maria Saveleva on 02/03/2019.
//  Copyright © 2019 Maria Saveleva. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var volume: Volume?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureController()
    }
    
    private func configureController() {
        guard let volume = volume else {
            return
        }
        
        titleLabel.text = volume.title
        descriptionLabel.text = volume.description
        
        var authors = ""
        for (index, author) in volume.authors.enumerated() {
            authors.append(author)
            if index != volume.authors.count - 1 {
                authors.append(", ")
            }
        }
        authorLabel.text = authors
    }
    
}
