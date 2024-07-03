//
//  ModelData.swift
//  COOLAPP
//
//  Created by shady on 6/29/24.
//

import Foundation

func loadTracksSync() -> [Track] {
    let urlString = "http://localhost:3000/json"
    guard let url = URL(string: urlString) else {
        fatalError("Invalid URL string: \(urlString)")
    }

    var result: [Track] = []
    let semaphore = DispatchSemaphore(value: 0)

    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        defer { semaphore.signal() }
        
        if let error = error {
            fatalError("Failed to load data from \(urlString):\n\(error)")
        }
        
        guard let data = data else {
            fatalError("No data received from \(urlString)")
        }
        
        do {
            let decoder = JSONDecoder()
            result = try decoder.decode([Track].self, from: data)
        } catch {
            fatalError("Couldn't parse data from \(urlString) as \([Track].self):\n\(error)")
        }
    }
    
    task.resume()
    semaphore.wait() // Wait for the network request to complete
    
    return result
}

// Initialize tracks by synchronously loading data
var tracks: [Track] = loadTracksSync()
