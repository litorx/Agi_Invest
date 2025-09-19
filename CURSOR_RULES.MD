# App: Agi Invest (SwiftUI • MVVM • iOS 16+)
Objetivo: UI idêntica às imagens (aba inferior padrão iOS • header azul • card branco com lista • grid de ações).

## Arquitetura
- MVVM + Camadas:
  - Core/
    - DesignSystem/ (tokens, estilos, helpers de UI)
    - Networking/ (HTTPClient, decoders, endpoints)
    - Utils/ (formatters, extensions)
    - Models/ (DTOs e entidades)
  - Features/
    - InvestmentsHome/ (tela 1 – grade de opções + card superior)
    - InvestmentList/ (tela 2 – lista conforme categoria: Crypto, CDI, Poupança)
    - CryptoDetail/ (detalhe da crypto: preço atual + máx/mín 90 dias)
  - App/
    - Root (TabView + NavigationStack)

## Naming & Organização
- Views: `XxxView`
- ViewModels: `XxxViewModel`
- Services: `XxxService` (conformam `NetworkingService`)
- Models de rede: `XxxDTO`; domínio simples: `Xxx`
- Componentes reutilizáveis ficam em `Core/DesignSystem/Components`
- Use `@MainActor` em VMs; `async/await` nas chamadas

## Design System (tokens)
Cores (hex):
- Primary: `#0065F5`
- Secondary: `#00CD5C` *(assumido correção do typo `#00cd5`)* 
- Red: `#E34446`
- Neutros:
  - `textPrimary = .black.opacity(0.9)`
  - `textSecondary = .black.opacity(0.6)`
  - `bg = .white`
  - `surface = .white`
  - `divider = .black.opacity(0.06)`
Gradientes (usar quando precisar):
- `gradientPrimary`: `LinearGradient([Primary, Primary.opacity(0.85)], .topLeading → .bottomTrailing)`

Spacing (pt): `4, 8, 12, 16, 20, 24, 32`
Radius (pt): `8, 12, 16, 20, 24, 30`
Sombra:
- `cardShadow`: radius 8, y 2, opacity 0.08
Tipografia:
- `headingL = .system(size: 28, weight: .bold)`
- `headingM = .system(size: 20, weight: .semibold)`
- `body = .system(size: 15, weight: .regular)`
- `caption = .system(size: 12, weight: .regular)`
Ícones: **SF Symbols** nativos.
- Tab bar: `house`, `chart.line.uptrend.xyaxis`, `dollarsign.circle`, `creditcard`, `person`

## UX / Layout alvo (igual às imagens)
1) **Tela “Investimentos” (Home da feature)**
   - Fundo azul (Primary) ocupando toda a tela.
   - Card branco superior com canto **inferior** arredondado (≈ 20).
   - Dentro dele: header de saldo “R$ 24.712,13” + badge verde “+5,2%” + botões cápsula “Investir” e “Saque”.
   - Abaixo do card, título da seção (ex.: “Criptomoedas” quando aplicável).
   - Grade 2 colunas com botões retangulares (cantos 16) para: **Criptomoedas**, **CDI até 110%**, **Poupança** (repetidos só como placeholder).
2) **Tela Lista (por categoria)**
   - Mesma cabeça azul + card branco (topo) como “container”.
   - Lista tipo “App Store/Wallet”: ícone circular à esquerda, nomes, à direita preço + variação pequena (verde/vermelho).
3) **Detalhe Crypto**
   - Ao tocar em uma crypto: mostra **preço atual**, **máximo** e **mínimo** dos **últimos 90 dias**.

## APIs
- **CoinGecko (com demo API key)**  
  Header: `x-cg-demo-api-key: CG-sU9dUwvAKsJtfFkxsguekqtv`
  - Top 25 (BRL):  
    `GET /api/v3/coins/markets?vs_currency=brl&order=market_cap_desc&per_page=25&page=1&sparkline=false&price_change_percentage=24h`
    Campos chave: `id, symbol, name, image, current_price, price_change_percentage_24h`
- **Olinda (BCB) – CDI & Poupança**  
  Implementar via serviço configurável; deixar `SERIES_ID` parametrizado. Dois caminhos aceitos:
  - **SGS REST simples** (recomendado pela simplicidade):  
    `https://api.bcb.gov.br/dados/serie/bcdata.sgs.{SERIE_ID}/dados?formato=json&dataInicial={dd/MM/yyyy}&dataFinal={dd/MM/yyyy}`
  - **OLINDA OData (SGS v2)** (se preferir OData):  
    `https://olinda.bcb.gov.br/olinda/servico/sgs/versao/v2/odata/Series('{SERIE_ID}')/Periodos?$top=30&$orderby=Data%20desc&$format=json`
  > **Observação**: preencha os `SERIE_ID` corretos de **CDI diário** e **Remuneração da Poupança** conforme SGS. Mantenha isso em `OlindaSeries.swift` para trocar fácil.
  > Para demo/offline, usar `MockNetworkClient` lendo JSON local.

## Boas práticas
- Tratamento de erro e estado: `enum ViewState { case idle, loading, loaded, error(String) }`.
- Formatting: moeda BRL com `NumberFormatter.currency` (pt_BR).
- Imagens remotas com `AsyncImage` + placeholder.
- Testes de unidade nos cálculos de min/max 90d e formatação.