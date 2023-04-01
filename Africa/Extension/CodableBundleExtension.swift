 //
//  CodableBundleExtension.swift
//  Africa
//
//  Created by Ashish Yadav on 01/05/22.
//

import Foundation

extension Bundle {
    func decode(_ file: String) -> [CoverImage] {
        //1. Locate the JSON File
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }
        
        //2. Create a property for a data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle")
        }
        //3. Create a decoder
        let decoder = JSONDecoder()
        
        //4. Create a property for the decoded data
        guard let loaded = try? decoder.decode([CoverImage].self, from: data) else {
            fatalError("Failed to decode \(file) form bundle.")
        }
        
        //5. Return the Ready-To-Use data
        return loaded
    }
}
