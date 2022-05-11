//
//  HeroStats.swift
//  RequestApi
//
//  Created by André Levi Oliveira Silva on 07/05/22.
//

import Foundation

struct HeroStats: Decodable {
    let localized_name: String
    let primary_attr: String
    let attack_type: String
    let legs: Int
    let img: String
}
