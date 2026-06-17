import SwiftUI

struct ProdutoCardView: View {
    let produto: ProdutoArtesanal
    let onFavoritar: () -> Void

    var body: some View {
        ZStack(alignment: .topTrailing) {
            NavigationLink {
                DetalhesProdutoView(produto: produto)
            } label: {
                VStack(alignment: .leading, spacing: 12) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .fill(Color(.secondarySystemBackground))

                        Image(systemName: produto.imagemNome)
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(.brown, .orange)
                            .padding(28)
                            .accessibilityLabel(produto.descricaoImagemAcessivel)
                    }
                    .aspectRatio(1, contentMode: .fit)

                    VStack(alignment: .leading, spacing: 6) {
                        Text(produto.nome)
                            .font(.headline)
                            .foregroundStyle(.primary)
                            .multilineTextAlignment(.leading)

                        Text(produto.precoFormatado)
                            .font(.subheadline.weight(.semibold))
                            .foregroundStyle(.secondary)
                            .accessibilityLabel(produto.precoAcessivel)
                    }
                }
                .padding(12)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(Color(.systemBackground))
                        .shadow(color: .black.opacity(0.08), radius: 8, x: 0, y: 4)
                )
            }
            .buttonStyle(.plain)
            .accessibilityElement(children: .combine)
            .accessibilityHint("Abre os detalhes do produto")

            Button(action: onFavoritar) {
                Image(systemName: produto.isFavorito ? "heart.fill" : "heart")
                    .font(.title3)
                    .foregroundStyle(produto.isFavorito ? .red : .primary)
                    .frame(minWidth: 44, minHeight: 44)
                    .background(.ultraThinMaterial, in: Circle())
            }
            .buttonStyle(.plain)
            .padding(20)
            .accessibilityLabel(produto.isFavorito ? "Remover \(produto.nome) dos favoritos" : "Favoritar \(produto.nome)")
            .accessibilityValue(produto.isFavorito ? "Marcado como favorito" : "Ainda não favoritado")
        }
    }
}

#Preview {
    NavigationStack {
        ProdutoCardView(produto: ProdutoArtesanal.exemplos[0], onFavoritar: {})
            .padding()
    }
}
