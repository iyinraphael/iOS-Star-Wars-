//
//  PersonTableViewCell.swift
//  find-crew
//
//  Created by Iyin Raphael on 5/5/20.
//  Copyright © 2020 Iyin Raphael. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {

    //MARK: - Properties
    var nameLabel: UILabel!
    var genderLabel: UILabel!
    var birthLabel: UILabel!
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        self.addSubview(stackView)
        
        nameLabel = UILabel()
        nameLabel.font = .systemFont(ofSize: 24, weight: .bold)
        stackView.addArrangedSubview(nameLabel)
        
        genderLabel = UILabel()
        stackView.addArrangedSubview(genderLabel)
        
        birthLabel = UILabel()
        stackView.addArrangedSubview(birthLabel)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: 5.0),
            stackView.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -5.0),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
