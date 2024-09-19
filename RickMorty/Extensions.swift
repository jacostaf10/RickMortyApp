//
//  Extensions.swift
//  RickMorty
//
//  Created by Jorge Acosta Freire on 17/9/24.
//

import SwiftUI
import RickMortyNet

extension Character {
    static let test = Character(id: 1,
                                name: "Rick Sanchez",
                                status: .alive,
                                species: "Human",
                                type: "Normal Rick",
                                gender: .male,
                                origin: .test,
                                location: .test,
                                image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
                                episode: ["https://rickandmortyapi.com/api/episode/1"],
                                url: "https://rickandmortyapi.com/api/character/1")
}

extension Character.Location {
    static let test = Character.Location(name: "Earth",
                                         url: "https://rickandmortyapi.com/api/location/20")
}

extension Location {
    static let test = Location(id: 1,
                               name: "Earth",
                               type: "Planet",
                               dimension: "Dimension C-137",
                               residents: ["https://rickandmortyapi.com/api/character/1"],
                               url: "https://rickandmortyapi.com/api/location/1")
}

extension Episode {
    static let test = Episode(id: 1,
                              name: "Pilot",
                              airDate: "December 2, 2013",
                              episode: "S01E01",
                              characters: ["https://rickandmortyapi.com/api/character/1"],
                              url: "https://rickandmortyapi.com/api/episode/1")
}
