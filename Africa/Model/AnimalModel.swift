//
//  AnimalModel.swift
//  Africa
//
//  Created by Ashish Yadav on 01/05/22.
//

import Foundation

struct Animal : Codable, Identifiable {
    var id : String
    var name : String
    var headline : String
    var description : String
    var link : String
    var image : String
    var gallery : [String]
    let fact : [String]
}
