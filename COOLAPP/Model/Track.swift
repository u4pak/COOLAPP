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
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    var mediaName: String
}
