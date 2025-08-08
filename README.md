# Rick & Morty – Flutter

Aplicativo que lista personagens do **Rick & Morty** com scroll infinito, tela de detalhes e pull-to-refresh.

O desafio era simples: consumir a [Rick and Morty API](https://rickandmortyapi.com/) e exibir as informações solicitadas.  
Objetivo cumprido.  
Mas, em vez de seguir pelo caminho mais curto, aproveitei para testar uma stack e uma organização mais robusta, parecida com o que costumo usar em projetos de produção. O resultado acabou sendo um bom laboratório de arquitetura.

---

## Por que tanto código?

Poderia ter sido resolvido de forma bem mais enxuta, mas decidi incluir:

- **MVVM** com `ChangeNotifier` + `Provider`
- Modelos e estados imutáveis com **Freezed**
- **Injeção de dependência** via `get_it`
- Paginação, pull-to-refresh e tema Material 3
- Configuração de lints no padrão `very_good_analysis`

Foi over-engineering? Sim, mas proposital — queria experimentar padrões e boas práticas em um contexto pequeno.

---

## Arquitetura

- Estrutura de pastas: `core`, `data`, `presentation`
- **MVVM**:
  - **View** – Widgets declarativos
  - **ViewModel** – `ChangeNotifier` emitindo `BaseState<T>`
  - **Repository** – abstrai rede e data sources
- Estado imutável com **Freezed** (`BaseState`, `Paginated`, modelos)
- Injeção de dependência com `get_it`
- Camada de rede usando **Dio** com interceptor de log
- Lints no padrão VGV (`very_good_analysis`)

---

## Funcionalidades

- Scroll infinito (carrega mais ao atingir 80% da lista)
- Pull-to-refresh
- Detalhes do personagem com Hero e cache básico
- Tema Material 3 com suporte a dark mode
- Layout responsivo (lista ou grid de 2 colunas em tablets)

---

## Como executar

```bash
# Instalar dependências
flutter pub get

# Gerar código (Freezed/JSON)
flutter pub run build_runner build --delete-conflicting-outputs

# Executar o app
flutter run

# Geração automática de código
flutter pub run build_runner watch -d

# Analisar código com lints
flutter analyze
```
