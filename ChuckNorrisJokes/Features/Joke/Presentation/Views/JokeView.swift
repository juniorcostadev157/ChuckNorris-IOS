//
//  JokeView.swift
//  ChuckNorrisJokes
//
//  Created by MacBookPro on 27/09/26.
//

import SwiftUI

struct JokeView: View {
    @State private var viewModel: JokeViewModel

    init(viewModel: JokeViewModel) {
        _viewModel = State(initialValue: viewModel)
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                categoryPicker
                content
                Spacer()
                newJokeButton
            }
            .padding()
            .navigationTitle("Chuck Norris")
            .task { await viewModel.onAppear() }                    // ≈ LaunchedEffect(Unit)
            .onChange(of: viewModel.selectedCategory) {             // trocou a categoria → nova piada
                viewModel.newJokeTapped()
            }
        }
    }

    // MARK: - Subviews

    @ViewBuilder
    private var content: some View {
        switch viewModel.state {                                    // ≈ when (state)
        case .idle, .loading:
            ProgressView()
        case .loaded(let joke):
            JokeCard(joke: joke)
        case .failed(let message):
            ContentUnavailableView(
                "Ops!",
                systemImage: "wifi.exclamationmark",
                description: Text(message)
            )
        }
    }

    private var categoryPicker: some View {
        Picker("Categoria", selection: $viewModel.selectedCategory) {
            Text("Todas").tag(String?.none)
            ForEach(viewModel.categories, id: \.self) { category in
                Text(category.capitalized).tag(Optional(category))
            }
        }
        .pickerStyle(.menu)
    }

    private var newJokeButton: some View {
        Button("Nova piada") {
            viewModel.newJokeTapped()
        }
        .buttonStyle(.borderedProminent)
        .disabled(viewModel.state == .loading)
    }
}

// MARK: - Previews

#Preview("Sucesso") {
    let repository = PreviewJokeRepository()
    JokeView(viewModel: JokeViewModel(
        getRandomJoke: GetRandomJokeUseCase(repository: repository),
        getCategories: GetCategoriesUseCase(repository: repository)
    ))
}

#Preview("Sem internet") {
    let repository = PreviewJokeRepository(jokeResult: .failure(.network))
    JokeView(viewModel: JokeViewModel(
        getRandomJoke: GetRandomJokeUseCase(repository: repository),
        getCategories: GetCategoriesUseCase(repository: repository)
    ))
}
