//
//  ContentView.swift
//  RickMorty
//
//  Created by Jorge Acosta Freire on 13/9/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(ViewModel.self) var vm
    @State var routes: [Route] = []
    
    var body: some View {
        HomeView(routes: $routes)
            .environment(vm)
    }
}

#Preview {
    ContentView()
        .environment(ViewModel())
}
