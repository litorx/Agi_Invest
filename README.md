# AgiInvests

Um aplicativo iOS para gestão de investimentos e controle financeiro, desenvolvido em SwiftUI.

##  Sobre o App

O AgiInvests é uma aplicação financeira que permite aos usuários:

- **Acompanhar investimentos** em criptomoedas, CDI e poupança
- **Visualizar estatísticas** e gráficos de performance
- **Monitorar portfólio** em tempo real

##  Arquitetura

O projeto segue uma arquitetura **MVVM** (Model-View-ViewModel) com as seguintes camadas:

###  Estrutura do Projeto

```
AgiInvests/
├── App/                          # Configuração da aplicação
│   ├── AgiInvestsApp.swift      # Entry point da aplicação
│   └── MainTabView.swift        # Navegação principal
├── Core/                        # Código compartilhado
│   ├── DesignSystem/            # Sistema de design
│   │   ├── Colors/              # Paleta de cores
│   │   ├── Typography/          # Tipografia
│   │   ├── Spacing/             # Espaçamentos
│   │   ├── Radius/              # Bordas arredondadas
│   │   └── Components/          # Componentes reutilizáveis
│   ├── Models/                  # Modelos de dados
│   ├── Networking/              # Camada de rede
│   └── Utils/                   # Utilitários
└── Features/                    # Funcionalidades específicas
    ├── InvestmentsHome/         # Tela inicial de investimentos
    └── InvestmentList/          # Lista de investimentos
```

##  Design System

O projeto utiliza um sistema de design consistente:

- **Cores**: Paleta padronizada com cores primárias, secundárias e semânticas
- **Tipografia**: Hierarquia de fontes definida
- **Espaçamentos**: Valores consistentes para margins, paddings e tamanhos
- **Componentes**: Elementos reutilizáveis como botões, cards e listas

##  APIs Integradas

- **CoinGecko**: Dados de criptomoedas em tempo real

##  Funcionalidades

###  Investimentos
- **Criptomoedas**: Top 25+ criptomoedas com dados em tempo real
- **CDI**: Investimentos com rendimento até 110% do CDI
- **Poupança**: Acompanhamento de rendimentos

###  Visualizações
- **Gráficos**: Performance dos investimentos
- **Estatísticas**: Métricas detalhadas
- **Cards interativos**: Navegação intuitiva

##  Tecnologias

- **SwiftUI**: Framework de UI declarativo
- **iOS 16+**: Versão mínima suportada
- **MVVM**: Padrão arquitetural
- **URLSession**: Networking nativo
- **AsyncImage**: Carregamento de imagens assíncrono

##  Requisitos

- Xcode 14.0+
- iOS 16.0+
- Swift 5.7+

##  Instalação

1. Clone o repositório:
```bash
git clone https://github.com/litorx/AgiInvests.git
```

2. Abra o projeto no Xcode:
```bash
open AgiInvests.xcodeproj
```

3. Execute o projeto no simulador ou dispositivo

##  Screenshots

<img width="220" height="450" alt="Captura de Tela 2025-09-19 às 10 43 08" src="https://github.com/user-attachments/assets/09c899d0-8712-40be-99f8-db6859bc0690" />  <img width="220" height="450" alt="Captura de Tela 2025-09-19 às 13 40 51" src="https://github.com/user-attachments/assets/fe539e32-0698-47de-878d-d39630d23e67" />   


##  Licença

Este projeto está sob a licença MIT. Veja o arquivo `LICENSE` para mais detalhes.

##  Autor

**Vitor** - [@litorx](https://github.com/litorx)

