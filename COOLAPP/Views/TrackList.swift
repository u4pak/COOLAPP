//
//  TrackList.swift
//  COOLAPP
//
//  Created by shady on 6/29/24.
//

import SwiftUI

struct TrackList: View {
    var body: some View {
        NavigationSplitView {
            List(tracks) { track in
                NavigationLink {
                    TrackDetail(track: track)
                } label: {
                    TrackRow(track: track)
                }
            }
            .navigationTitle("Tracks")
        } detail: {
            Text("Select a Track")
        }
    }
}

#Preview {
    TrackList()
}
