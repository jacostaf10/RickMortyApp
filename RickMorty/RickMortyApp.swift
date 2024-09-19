//
//  RickMortyApp.swift
//  RickMorty
//
//  Created by Jorge Acosta Freire on 13/9/24.
//

import SwiftUI

@main
struct RickMortyApp: App {
    @State var vm = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(vm)
        }
    }
}
