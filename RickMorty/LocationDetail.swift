//
//  LocationDetail.swift
//  RickMorty
//
//  Created by Jorge Acosta Freire on 17/9/24.
//

import SwiftUI
import RickMortyNet

struct LocationDetail: View {
    let location: Location
    
    @State private var residents: [Character] = []
    
    private func getResidents() async throws {
        for resident in location.residents {
            guard let number = resident.components(separatedBy: "/").last, let index = Int(String(number)) else { continue }
            let character = try await RMNetwork.shared.getCharacter(index)
            residents.append(character)
        }
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text(location.name)
                .font(.largeTitle)
                .fontWeight(.black)
                .fontDesign(.rounded)
            Text(location.type)
                .font(.title)
                .fontWeight(.bold)
                .fontDesign(.rounded)
            
            Section {
                List(residents) { character in
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
                    Text("Residents")
                        .font(.title3)
                    Spacer()
                }
                .padding(.horizontal)
            }
            
        }
        .task {
            do {
                try await getResidents()
            } catch {
                print(error)
            }
        }
    }
}

#Preview {
    LocationDetail(location: .test)
}
