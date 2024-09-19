//
//  HomeView.swift
//  RickMorty
//
//  Created by Jorge Acosta Freire on 17/9/24.
//

import SwiftUI

struct HomeView: View {
    @Environment(ViewModel.self) var vm
    @Binding var routes: [Route]
    
    @State var tab: Tab = .characters
    
    var body: some View {
        TabView(selection: $tab) {
            CharactersView(routes: $routes)
                .tag(Tab.characters)
                .tabItem { Tab.characters.label }
            
            LocationsView(routes: $routes)
                .tag(Tab.locations)
                .tabItem { Tab.locations.label }
            
            EpisodesView(routes: $routes)
                .tag(Tab.episodes)
                .tabItem { Tab.episodes.label }
        }
    }
}

#Preview {
    HomeView(routes: .constant([]))
        .environment(ViewModel())
}
