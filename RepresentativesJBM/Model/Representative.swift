//
//  Representative.swift
//  RepresentativesJBM
//
//  Created by Jason Mandozzi on 6/27/19.
//  Copyright © 2019 Jason Mandozzi. All rights reserved.
//

import Foundation

struct Representative: Codable {
    let name: String
    let party: String
    let state: String
    let district: String
    let phone: String
    let office: String
    let link: String
}
