//
//  Routes.swift
//  RickMorty
//
//  Created by Jorge Acosta Freire on 17/9/24.
//

import SwiftUI
import RickMortyNet

enum Route: Hashable, Identifiable, Equatable {
    case character(Character)
    case location(Location)
    case episode(Episode)
    
    var id: UUID { UUID() }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Route, rhs: Route) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
    
}

enum Tab: Hashable {
    case characters, locations, episodes
    
    @ViewBuilder
    var label: some View {
        switch self {
        case .characters: Label("Characters", systemImage: "person")
        case .locations: Label("Locations", systemImage: "mappin.and.ellipse")
        case .episodes: Label("Episodes", systemImage: "film.stack")
        }
    }
}
