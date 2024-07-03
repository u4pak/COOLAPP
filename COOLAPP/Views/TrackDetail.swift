//
//  TrackDetail.swift
//  COOLAPP
//
//  Created by shady on 6/29/24.
//

import SwiftUI
import AVKit
import UIKit

struct TrackDetail: View {
    var track: Track
    
    @State private var player: AVAudioPlayer?
    @State private var isPlaying = false
    @State private var totalTime: TimeInterval = 0.0
    @State private var currentTime: TimeInterval = 0.0
    
    var body: some View {
        VStack {
            AlbumArt(image: track.image)
            VStack(alignment: .leading) {
                Text(track.name)
                    .font(.title)
                HStack {
                    Text(track.artist)
                    Spacer()
                    Text(track.album)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                Slider(value: Binding(get: {
                    currentTime
                }, set: { newValue in
                    seekAudio(to: newValue)
                    
                }), in: 0...totalTime)
                HStack{
                    Text(timeString(time: currentTime))
                    Spacer()
                    Text(timeString(time: totalTime))
                }
                HStack{
                    Button{
                        
                    } label: {
                        Image(systemName: "backward.fill")
                            .font(.title3)
                    }
                    
                    Button{
                        
                    } label: {
                        Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                            .font(.largeTitle)
                            .onTapGesture {
                                isPlaying ? stopAudio() : playAudio()
                            }
                    }
                    Button{
                        
                    } label: {
                        Image(systemName: "forward.fill")
                            .font(.title3)
                    }
                }
                .frame(maxWidth: .infinity)
                .foregroundColor(.primary)
                /*
                HStack(spacing: 15) {
                    Image(systemName: "speaker.fill")
                    
                    Capsule()
                        .fill(.ultraThinMaterial)
                        .environment(\.colorScheme, .dark)
                        .frame(height: 5)
                    Image(systemName: "speaker.wave.3.fill")
                }
                 */
            }
            .padding()
        }
        .navigationTitle(track.name)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear(perform: setupAudio)
        .onReceive(Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()) { _ in
            updateProgress()
        }
    }
    
    private func setupAudio(){
        guard let url = Bundle.main.url(forResource: track.mediaName, withExtension: "mp3")
        else {
            return
        }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.prepareToPlay()
            totalTime = player?.duration ?? 0.0
        } catch {
            fatalError("Error loading audio:\n\(error)")
        }
    }
    
    private func playAudio(){
        player?.play()
        isPlaying = true
    }
    
    private func stopAudio(){
        player?.pause()
        isPlaying = false
    }
    
    private func updateProgress() {
        guard let player = player else { return }
        currentTime = player.currentTime
    }
    
    private func seekAudio(to time: TimeInterval) {
        player?.currentTime = time
    }
    
    private func timeString(time: TimeInterval) -> String {
        let minute = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minute, seconds)
    }
}

#Preview {
    TrackDetail(track: tracks[0])
}
