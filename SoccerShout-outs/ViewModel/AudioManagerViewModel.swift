//
//  AudioManagerViewModel.swift
//  SoccerShout-outs
//
//  Created by Алексей Гайдуков on 04.09.2022.
//

import Foundation
import AVKit

class AudioManagerViewModel {
    
    private var chanAudioPlayer: AVAudioPlayer?
    func playback(_ team: Team) {
        if team.isPlaing {
            chanAudioPlayer?.stop()
        } else {
            guard let path = Bundle.main.path(forResource: "\(team.id.chantFile).mp3", ofType: nil) else { return }
            let url = URL(fileURLWithPath: path)
            do {
                chanAudioPlayer = try AVAudioPlayer(contentsOf: url)
                chanAudioPlayer?.numberOfLoops = -1
                chanAudioPlayer?.play()
            } catch {
                print(error)
            }
        }
    }
}
