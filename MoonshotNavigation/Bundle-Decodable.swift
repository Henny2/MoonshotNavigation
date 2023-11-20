//
//  Bundle-Decodable.swift
//  MoonshotNavigation
//
//  Created by Henrieke Baunack on 11/19/23.
//

import Foundation

extension Bundle {
    
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else{
            fatalError("Failed to locate the file in the Bundle")
        }
        // if we made it here, we know we found the file in the bundle
        // now we try to read it
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load the file from the Bundle")
        }
        
        // if we made it here, we found the file and loaded the data
        // now we try to decode the data into a dictionary
        
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode the file.")
        }
        
        // if we made it here, we found the file, read the data and decoded it successfully
        // now we can return the decoded data
        return loadedData
    }
}
