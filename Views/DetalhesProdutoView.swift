import SwiftUI

struct DetalhesProdutoView: View {
    let produto: ProdutoArtesanal
    @State private var mostrandoContato = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text(produto.nome)
                    .font(.largeTitle.bold())
                    .accessibilitySortPriority(3)

                ZStack {
                    RoundedRectangle(cornerRadius: 24, style: .continuous)
                        .fill(Color(.secondarySystemBackground))

                    Image(systemName: produto.imagemNome)
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.brown, .orange)
                        .padding(40)
                        .accessibilityLabel(produto.descricaoImagemAcessivel)
                        .accessibilitySortPriority(1)
                }
                .aspectRatio(1.2, contentMode: .fit)

                VStack(alignment: .leading, spacing: 12) {
                    Label(produto.artesao, systemImage: "person.fill")
                    Label(produto.categoria, systemImage: "tag.fill")

                    Text(produto.precoFormatado)
                        .font(.title2.weight(.semibold))
                        .accessibilityLabel(produto.precoAcessivel)
                }
                .font(.body)
                .accessibilitySortPriority(2)

                Text(produto.descricao)
                    .font(.body)

                Button {
                    mostrandoContato = true
                } label: {
                    Label("Entrar em contato com o Artesão", systemImage: "message.fill")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .frame(minHeight: 44)
                .accessibilityHint("Mostra uma ação simulada de contato")
            }
            .padding()
        }
        .navigationTitle("Detalhes")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Contato fictício", isPresented: $mostrandoContato) {
            Button("OK", role: .cancel) {}
        } message: {
            Text("Em uma versão completa, aqui o usuário iniciaria o contato com \(produto.artesao).")
        }
    }
}

#Preview {
    NavigationStack {
        DetalhesProdutoView(produto: ProdutoArtesanal.exemplos[0])
    }
}
