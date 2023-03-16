//
//  SchoolsModel.swift
//  20230315-VolodymyrNavorotskyi-NYCSchools
//
//  Created by Imac on 3/15/23.
//

import Foundation

struct Response: Codable {
    var schools: [Schools]?
}

struct Schools: Codable {
    var name: String?
    var contact_number: String?
    var city: String?
    var state: String?
    var zip: String?
}
