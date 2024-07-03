//
//  Track.swift
//  COOLAPP
//
//  Created by shady on 6/29/24.
//

import Foundation
import SwiftUI

struct Track: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var album: String
    var artist: String
    
    private var imagePath: String
    var image: Image {
        Image(imagePath)
    }
    
    var mediaPath: String
}
