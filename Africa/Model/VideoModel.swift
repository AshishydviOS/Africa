//
//  VideoModel.swift
//  Africa
//
//  Created by Ashish Yadav on 05/05/22.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    // Computed Property
    var thumbnail: String {
        "video-\(id)"
    }
}
