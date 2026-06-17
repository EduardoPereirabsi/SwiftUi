# SwiftUi

Projeto prático em SwiftUI inspirado na Feira do Largo da Ordem, com foco em vitrine virtual de produtos artesanais e acessibilidade.

## Estrutura

- `Models/ProdutoArtesanal.swift`: modelo de dados e exemplos
- `ViewModels/CatalogoViewModel.swift`: busca e gerenciamento de favoritos
- `Views/CatalogoView.swift`: vitrine principal com `LazyVGrid`
- `Views/ProdutoCardView.swift`: card reutilizável do produto
- `Views/DetalhesProdutoView.swift`: tela de detalhes com foco em acessibilidade

## Recursos implementados

- Grid responsivo com `GridItem(.adaptive(minimum: 150))`
- Busca nativa com `.searchable`
- Favoritos com atualização imediata de estado
- Navegação com `NavigationStack` e `NavigationLink`
- Ajustes de acessibilidade para VoiceOver, leitura de preço, touch target mínimo e Dynamic Type
