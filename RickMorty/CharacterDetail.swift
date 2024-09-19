//
//  CharacterDetail.swift
//  RickMorty
//
//  Created by Jorge Acosta Freire on 17/9/24.
//

import SwiftUI
import RickMortyNet

struct CharacterDetail: View {
    let character: Character
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: character.image)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
            } placeholder: {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .foregroundStyle(.gray)
            }
            
            Text(character.name)
                .font(.largeTitle)
                .fontWeight(.black)
                .fontDesign(.rounded)

        }
    }
}

#Preview {
    CharacterDetail(character: .test)
}
