//
//  PersonSearchTableViewController.swift
//  find-crew
//
//  Created by Iyin Raphael on 5/5/20.
//  Copyright © 2020 Iyin Raphael. All rights reserved.
//

import UIKit

let reuseId = "Cell"

class PersonSearchTableViewController: UIViewController {
    
    //MARK: - Properties
    var tableView: UITableView!
    
    
    
    //MARK: - View
    override func loadView() {
        super.loadView()
        
        tableView = UITableView(frame: .zero, style: .plain)
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(PersonTableViewCell.self, forCellReuseIdentifier: reuseId)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 50), 
            tableView.widthAnchor.constraint(equalTo: view.widthAnchor),
            tableView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
    }
    
        
    
}



extension PersonSearchTableViewController: UITableViewDataSource, UITableViewDelegate {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseId, for: indexPath) as! PersonTableViewCell
        
        return cell
    }
    
    
    
    
}
