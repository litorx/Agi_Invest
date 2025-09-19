import Foundation

struct Investment {
    let id: String
    let name: String
    let symbol: String
    let category: InvestmentCategory
    let currentValue: Double
    let changePercentage: Double?
    let changeAmount: Double?
    let imageURL: String?
    
    var formattedValue: String {
        return NumberFormatter.currencyBRL.string(from: NSNumber(value: currentValue)) ?? "R$ 0,00"
    }
    
}

struct Portfolio {
    let totalValue: Double
    let totalChange: Double
    let totalChangePercentage: Double
    let investments: [Investment]
    
}

struct MockInvestmentData {
    static let cdiInvestments: [Investment] = [
        Investment(
            id: "cdi-110-1",
            name: "CDB Banco Inter 110% CDI",
            symbol: "CDB",
            category: .cdi,
            currentValue: 0.0,
            changePercentage: 1.15,
            changeAmount: 0.0,
            imageURL: nil
        ),
        Investment(
            id: "cdi-110-2",
            name: "LCI Itaú 110% CDI",
            symbol: "LCI",
            category: .cdi,
            currentValue: 0.0,
            changePercentage: 1.15,
            changeAmount: 0.0,
            imageURL: nil
        ),
        Investment(
            id: "cdi-105-1",
            name: "CDB Bradesco 105% CDI",
            symbol: "CDB",
            category: .cdi,
            currentValue: 0.0,
            changePercentage: 1.10,
            changeAmount: 0.0,
            imageURL: nil
        ),
        Investment(
            id: "cdi-108-1",
            name: "LCA Santander 108% CDI",
            symbol: "LCA",
            category: .cdi,
            currentValue: 0.0,
            changePercentage: 1.12,
            changeAmount: 0.0,
            imageURL: nil
        ),
        Investment(
            id: "cdi-112-1",
            name: "CDB BTG Pactual 112% CDI",
            symbol: "CDB",
            category: .cdi,
            currentValue: 0.0,
            changePercentage: 1.17,
            changeAmount: 0.0,
            imageURL: nil
        )
    ]
    
    static let poupancaInvestments: [Investment] = [
        Investment(
            id: "poupanca-1",
            name: "Poupança Tradicional",
            symbol: "POUPANÇA",
            category: .poupanca,
            currentValue: 0.0,
            changePercentage: 0.50,
            changeAmount: 0.0,
            imageURL: nil
        ),
        Investment(
            id: "poupanca-2",
            name: "Poupança Plus Banco do Brasil",
            symbol: "POUPANÇA+",
            category: .poupanca,
            currentValue: 0.0,
            changePercentage: 0.52,
            changeAmount: 0.0,
            imageURL: nil
        ),
        Investment(
            id: "poupanca-3",
            name: "Poupança Digital Caixa",
            symbol: "POUPANÇA",
            category: .poupanca,
            currentValue: 0.0,
            changePercentage: 0.51,
            changeAmount: 0.0,
            imageURL: nil
        ),
        Investment(
            id: "poupanca-4",
            name: "Poupança Premium Itaú",
            symbol: "POUPANÇA",
            category: .poupanca,
            currentValue: 0.0,
            changePercentage: 0.53,
            changeAmount: 0.0,
            imageURL: nil
        ),
        Investment(
            id: "poupanca-5",
            name: "Poupança Especial Bradesco",
            symbol: "POUPANÇA",
            category: .poupanca,
            currentValue: 0.0,
            changePercentage: 0.51,
            changeAmount: 0.0,
            imageURL: nil
        )
    ]
    
    static func getInvestments(for category: InvestmentCategory) -> [Investment] {
        switch category {
        case .cdi:
            return cdiInvestments
        case .poupanca:
            return poupancaInvestments
        case .crypto:
            return []
        case .tesouro, .rendaFixa, .fundos:
            return []
        }
    }
}
