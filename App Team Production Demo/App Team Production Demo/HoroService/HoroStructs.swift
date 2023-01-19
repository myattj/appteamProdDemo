//
//  HoroStructs.swift
//  App Team Production Demo
//
//  Created by Josh Myatt on 1/18/23.
//

import Foundation


public struct HoroResponse: Decodable {
    let date_range: String
    let current_date: String
    let description: String
    let compatibility: String
    let mood: String
    let color: String
    let lucky_number: String
    let lucky_time: String
}


