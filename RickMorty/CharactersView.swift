//
//  CharactersView.swift
//  RickMorty
//
//  Created by Jorge Acosta Freire on 17/9/24.
//

import SwiftUI

struct CharactersView: View {
    @Environment(ViewModel.self) var vm
    @Binding var routes: [Route]
    
    var body: some View {
        NavigationStack(path: $routes) {
            List(vm.characters) { character in
                Button {
                    routes.append(.character(character))
                } label: {
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
                .buttonStyle(.plain)

            }
            .navigationTitle("Characters")
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .character(let character):
                    CharacterDetail(character: character)
                default: EmptyView()
                }
            }
        }
    }
}

#Preview {
    CharactersView(routes: .constant([]))
        .environment(ViewModel())
}
