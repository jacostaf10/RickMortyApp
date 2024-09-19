//
//  EpisodesView.swift
//  RickMorty
//
//  Created by Jorge Acosta Freire on 17/9/24.
//

import SwiftUI

struct EpisodesView: View {
    @Environment(ViewModel.self) var vm
    @Binding var routes: [Route]
    
    var body: some View {
        NavigationStack(path: $routes) {
            List(vm.episodes) { episode in
                Button {
                    routes.append(.episode(episode))
                } label: {
                    VStack(alignment: .leading) {
                        Text(episode.name)
                        Text(episode.episode)
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                    }
                }
                .buttonStyle(.plain)

            }
            .navigationTitle("Episodes")
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .episode(let episode):
                    EpisodeDetail(episode: episode)
                default: EmptyView()
                }
            }
        }
    }
}

#Preview {
    EpisodesView(routes: .constant([]))
        .environment(ViewModel())
}
