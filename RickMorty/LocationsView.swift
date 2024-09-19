//
//  LocationsView.swift
//  RickMorty
//
//  Created by Jorge Acosta Freire on 17/9/24.
//

import SwiftUI

struct LocationsView: View {
    @Environment(ViewModel.self) var vm
    @Binding var routes: [Route]
    
    var body: some View {
        NavigationStack(path: $routes) {
            List(vm.locations) { location in
                Button {
                    routes.append(.location(location))
                } label: {
                    VStack(alignment: .leading) {
                        Text(location.name)
                        Text(location.type)
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                    }
                }
                .buttonStyle(.plain)

            }
            .navigationTitle("Locations")
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .location(let location):
                    LocationDetail(location: location)
                default: EmptyView()
                }
            }
        }
    }
}

#Preview {
    LocationsView(routes: .constant([]))
        .environment(ViewModel())
}
