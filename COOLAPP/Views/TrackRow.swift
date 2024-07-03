//
//  TrackRow.swift
//  COOLAPP
//
//  Created by shady on 6/29/24.
//

import SwiftUI

struct TrackRow: View {
    var track: Track
    
    var body: some View {
        HStack {
            track.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(track.name)
            
            Spacer()
        }
    }
}

#Preview("FIELD TRIP") {
    Group {
        TrackRow(track: tracks[0])
        TrackRow(track: tracks[1])
    }
}
