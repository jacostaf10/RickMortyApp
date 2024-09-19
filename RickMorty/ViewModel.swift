//
//  ViewModel.swift
//  RickMorty
//
//  Created by Jorge Acosta Freire on 17/9/24.
//

import SwiftUI
import RickMortyNet

@Observable
final class ViewModel: ObservableObject {
    let network = RMNetwork.shared
    
    var characters: [Character] = []
    var locations: [Location] = []
    var episodes: [Episode] = []
    
    init() {
        Task { await loadData() }
    }
    
    func loadData() async {
        do {
            let characters = try await network.getCharacters()
            let locations = try await network.getLocations()
            let episodes = try await network.getEpisodes()
            
            self.characters = characters.results
            self.locations = locations.results
            self.episodes = episodes.results
            
        } catch {
            print(error)
        }
    }
}
