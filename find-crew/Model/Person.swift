//
//  Person.swift
//  find-crew
//
//  Created by Iyin Raphael on 5/5/20.
//  Copyright © 2020 Iyin Raphael. All rights reserved.
//

import Foundation

struct Person: Codable {

    let name: String
    let gender: String
    let birthYears: String
}

struct PersonSearch: Codable {
    let results: [Person]
}
