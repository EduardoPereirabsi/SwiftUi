import Foundation

struct ProdutoArtesanal: Identifiable {
    let id: UUID
    let nome: String
    let artesao: String
    let preco: Double
    let categoria: String
    let imagemNome: String
    let descricao: String
    var isFavorito: Bool = false
}

extension ProdutoArtesanal {
    var precoFormatado: String {
        Self.currencyFormatter.string(from: NSNumber(value: preco)) ?? "R$ \(preco)"
    }

    var precoAcessivel: String {
        "Preço: \(precoFormatado)"
    }

    var descricaoImagemAcessivel: String {
        "\(nome), produto da categoria \(categoria)"
    }

    static let exemplos: [ProdutoArtesanal] = [
        ProdutoArtesanal(
            id: UUID(),
            nome: "Capivara em Madeira",
            artesao: "Ana Clara Ribas",
            preco: 145.0,
            categoria: "Madeira",
            imagemNome: "tortoise.fill",
            descricao: "Escultura talhada manualmente em madeira de reflorestamento, inspirada na fauna urbana de Curitiba. Cada peça recebe acabamento com cera natural para destacar os veios da madeira."
        ),
        ProdutoArtesanal(
            id: UUID(),
            nome: "Echarpe de Lã Colorida",
            artesao: "Marta de Oliveira",
            preco: 89.9,
            categoria: "Vestuário",
            imagemNome: "sparkles",
            descricao: "Echarpe tecida em tear manual com mistura de lã e algodão. A combinação de cores remete às barracas vibrantes da feira e valoriza o trabalho têxtil artesanal."
        ),
        ProdutoArtesanal(
            id: UUID(),
            nome: "Quadro do Centro Histórico",
            artesao: "João Varella",
            preco: 220.0,
            categoria: "Arte",
            imagemNome: "paintpalette.fill",
            descricao: "Pintura em acrílico sobre tela retratando o Largo da Ordem em um domingo de feira. A obra destaca arquitetura colonial e o movimento cultural da região."
        ),
        ProdutoArtesanal(
            id: UUID(),
            nome: "Caneca de Cerâmica",
            artesao: "Rita Sakamoto",
            preco: 56.5,
            categoria: "Cerâmica",
            imagemNome: "cup.and.saucer.fill",
            descricao: "Caneca modelada e esmaltada à mão, com textura suave e ilustração inspirada nos mosaicos da cidade. Ideal para cafés e chás em dias frios."
        ),
        ProdutoArtesanal(
            id: UUID(),
            nome: "Compota de Goiaba",
            artesao: "Família Camargo",
            preco: 28.0,
            categoria: "Gastronomia",
            imagemNome: "takeoutbag.and.cup.and.straw.fill",
            descricao: "Compota artesanal produzida em pequenos lotes com goiabas selecionadas. Receita tradicional servida em potes reutilizáveis e ótima para presentear."
        ),
        ProdutoArtesanal(
            id: UUID(),
            nome: "Broche Retrô",
            artesao: "Carlos Hauer",
            preco: 72.0,
            categoria: "Antiguidades",
            imagemNome: "seal.fill",
            descricao: "Broche metálico restaurado, com desenho floral e pátina preservada. Uma peça única para colecionadores e amantes de acessórios vintage."
        )
    ]

    private static let currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt_BR")
        return formatter
    }()
}
