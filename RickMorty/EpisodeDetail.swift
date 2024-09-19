//
//  EpisodeDetail.swift
//  RickMorty
//
//  Created by Jorge Acosta Freire on 17/9/24.
//

import SwiftUI
import RickMortyNet

struct EpisodeDetail: View {
    let episode: Episode
    
    @State private var characters: [Character] = []
    
    private func getCharacters() async throws {
        for resident in episode.characters {
            guard let number = resident.components(separatedBy: "/").last, let index = Int(String(number)) else { continue }
            let character = try await RMNetwork.shared.getCharacter(index)
            characters.append(character)
        }
    }
    
    var body: some View {
        VStack(spacing: 20) {
                Text(episode.name)
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .fontDesign(.rounded)
            Text(episode.episode)
                    .font(.title)
                    .fontWeight(.bold)
                    .fontDesign(.rounded)
            
            Text(episode.airDate)
                    .font(.title2)
                    .fontWeight(.bold)
                    .fontDesign(.rounded)
                    .foregroundStyle(.secondary)
                
                Section {
                    List(characters) { character in
                        HStack {
                            AsyncImage(url: URL(string: character.image)) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                    .clipShape(Circle())
                            } placeholder: {
                                Image(systemName: "person")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                            }
                            
                            Text(character.name)
                        }
                    }
                } header: {
                    HStack {
                        Text("Characters")
                            .font(.title3)
                        Spacer()
                    }
                    .padding(.horizontal)
                }
                
            
        }
        .task {
            do {
                try await getCharacters()
            } catch {
                print(error)
            }
        }
    }
}

#Preview {
    EpisodeDetail(episode: .test)
}
