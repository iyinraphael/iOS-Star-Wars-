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
    var people = [Person]()
    let personController = PersonController()
    
    //MARK: - View
    override func loadView() {
        super.loadView()
        
        tableView = UITableView(frame: .zero, style: .plain)
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(PersonTableViewCell.self, forCellReuseIdentifier: reuseId)
        view.addSubview(tableView)
    
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.delegate = self
        view.addSubview(searchBar)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 50), 
            tableView.widthAnchor.constraint(equalTo: view.widthAnchor),
            tableView.heightAnchor.constraint(equalTo: view.heightAnchor),
            
            searchBar.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 10),
            searchBar.bottomAnchor.constraint(equalTo: tableView.topAnchor),
            searchBar.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }
    
        
    
}



extension PersonSearchTableViewController: UITableViewDataSource, UITableViewDelegate {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personController.people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseId, for: indexPath) as! PersonTableViewCell
        let person = personController.people[indexPath.row]
        cell.nameLabel.text = person.name
        cell.genderLabel.text = person.gender
        cell.birthLabel.text = person.birthYear
        
        return cell
    }
    
    
    
    
}

extension PersonSearchTableViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else {
            return
        }
        personController.searchForPeopleWith(searchTerm: searchTerm) {
            DispatchQueue.main.async {
                 self.tableView.reloadData()
            }
        }
    }
}
