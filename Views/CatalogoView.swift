import SwiftUI

struct CatalogoView: View {
    @StateObject private var viewModel = CatalogoViewModel()

    private let colunas = [
        GridItem(.adaptive(minimum: 150), spacing: 16, alignment: .top)
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: colunas, spacing: 16) {
                    ForEach(viewModel.produtosFiltrados) { produto in
                        ProdutoCardView(
                            produto: produto,
                            onFavoritar: {
                                viewModel.alternarFavorito(id: produto.id)
                            }
                        )
                    }
                }
                .padding()
            }
            .navigationTitle("Feira do Largo")
            .searchable(text: $viewModel.termoBusca, prompt: "Buscar por nome ou categoria")
            .overlay {
                if viewModel.produtosFiltrados.isEmpty {
                    VStack(spacing: 12) {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 36))
                            .foregroundStyle(.secondary)

                        Text("Nenhum produto encontrado")
                            .font(.headline)

                        Text("Tente buscar por outro nome ou categoria da feira.")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .padding(24)
                }
            }
        }
    }
}

#Preview {
    CatalogoView()
}
