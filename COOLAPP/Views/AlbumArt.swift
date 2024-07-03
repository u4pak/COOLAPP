//
//  AlbumArt.swift
//  COOLAPP
//
//  Created by shady on 6/28/24.
//

import SwiftUI

struct AlbumArt: View {
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .frame(width: 300, height: 300)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .overlay {
                RoundedRectangle(cornerRadius: 25).stroke(.white, lineWidth: 2)
            }
            .shadow(radius: 7)
    }
}

#Preview {
    AlbumArt(image: Image("Vultures2"))
}
