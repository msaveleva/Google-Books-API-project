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

    @IBOutlet weak var tableView: UITableView!
    
    var volumes = [Volume]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
    }
    
    @IBAction func tappedSearchButton(_ sender: Any) {
        let alert = UIAlertController(title: "Searching for a book",
                                      message:"What book are you looking for?" ,
                                      preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Enter book name"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        let searchAction = UIAlertAction(title: "Search", style: .default) { [weak self] action in
            guard let textField = alert.textFields?.first,
                let searchText = textField.text else {
                    return
            }

            GoogleBooksConnectionService.shared.loadVolumesWithName(name: searchText, completion: { result in
                guard let volumeListResponse = result as? VolumeListResponse,
                        let volumes = volumeListResponse.items else {
                    return
                }
                
                self?.volumes = volumes
                self?.tableView.reloadData()
            });
        }
        
        alert.addAction(cancelAction)
        alert.addAction(searchAction)
        
        present(alert, animated: true)
    }
    
    // MARK: - Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow,
                let controller = segue.destination as? DetailViewController {
                let volume = volumes[indexPath.row]
                controller.volume = volume
            }
        }
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return volumes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath) as! VolumeTableViewCell
        cell.volumeTitleLabel.text = volumes[indexPath.row].title
        
        return cell
    }
}
