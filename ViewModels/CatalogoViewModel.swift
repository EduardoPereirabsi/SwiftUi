import Combine
import Foundation

@MainActor
final class CatalogoViewModel: ObservableObject {
    @Published var produtos: [ProdutoArtesanal]
    @Published var termoBusca = ""

    init(produtos: [ProdutoArtesanal] = ProdutoArtesanal.exemplos) {
        self.produtos = produtos
    }

    var produtosFiltrados: [ProdutoArtesanal] {
        let termoNormalizado = termoBusca.trimmingCharacters(in: .whitespacesAndNewlines)

        guard !termoNormalizado.isEmpty else {
            return produtos
        }

        return produtos.filter { produto in
            produto.nome.localizedCaseInsensitiveContains(termoNormalizado) ||
            produto.categoria.localizedCaseInsensitiveContains(termoNormalizado)
        }
    }

    func alternarFavorito(id: ProdutoArtesanal.ID) {
        guard let index = produtos.firstIndex(where: { $0.id == id }) else {
            return
        }

        produtos[index].isFavorito.toggle()
    }
}
