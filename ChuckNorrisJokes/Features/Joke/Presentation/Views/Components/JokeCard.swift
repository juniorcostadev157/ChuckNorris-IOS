//
//  JokeCard.swift
//  ChuckNorrisJokes
//
//  Created by MacBookPro on 27/09/26.
//

import SwiftUI

struct JokeCard: View {
    let joke: Joke

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            AsyncImage(url: joke.iconURL) { image in       // ≈ Coil AsyncImage
                image.resizable().scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 48, height: 48)

            Text(joke.text)
                .font(.title3)

            if !joke.categories.isEmpty {
                Text(joke.categories.joined(separator: ", "))
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    JokeCard(joke: .preview)
        .padding()
}
