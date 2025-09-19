import Foundation
import SwiftUI

@MainActor
class InvestmentListViewModel: ObservableObject {
    @Published var investments: [Investment] = []
    
    private let coinGeckoService: CoinGeckoService
    
    init(networkingService: NetworkingService = HTTPClient.shared) {
        coinGeckoService = CoinGeckoService(networkingService: networkingService)
    }
    
    func loadData(for category: InvestmentCategory) {
        Task {
            do {
                let fetchedInvestments = try await fetchInvestments(for: category)
                investments = fetchedInvestments
            } catch {
                print("Error loading investments: \(error.localizedDescription)")
            }
        }
    }
    
    private func fetchInvestments(for category: InvestmentCategory) async throws -> [Investment] {
        switch category {
        case .crypto:
            return try await fetchCryptoInvestments()
        case .cdi, .poupanca, .tesouro, .rendaFixa, .fundos:
            return MockInvestmentData.getInvestments(for: category)
        }
    }
    
    private func fetchCryptoInvestments() async throws -> [Investment] {
        let cryptoInvestments = try await coinGeckoService.fetchTop25CryptoForInvestment()
        return cryptoInvestments.map { crypto in
            Investment(
                id: crypto.id,
                name: crypto.name,
                symbol: crypto.symbol,
                category: .crypto,
                currentValue: crypto.currentPrice,
                changePercentage: crypto.priceChange24h ?? 0,
                changeAmount: crypto.currentPrice * ((crypto.priceChange24h ?? 0) / 100),
                imageURL: crypto.imageURL
            )
        }
    }
    
    func getInvestmentItems() -> [InvestmentItem] {
        investments.map { investment in
            InvestmentItem(
                name: investment.name,
                symbol: getSymbolForInvestment(investment),
                value: investment.formattedValue,
                change: formatPercentage(investment.changePercentage ?? 0),
                icon: getIconForInvestment(investment)
            )
        }
    }
    
    private func getSymbolForInvestment(_ investment: Investment) -> String {
        investment.symbol
    }
    
    private func formatPercentage(_ percentage: Double) -> String {
        let sign = percentage >= 0 ? "+" : ""
        return String(format: "%@%.2f%%", sign, percentage)
    }
    
    private func getIconForInvestment(_ investment: Investment) -> String {
        switch investment.category {
        case .crypto:
            return investment.imageURL ?? "https://assets.coingecko.com/coins/images/1/large/bitcoin.png"
        case .cdi:
            return "percent"
        case .poupanca:
            return "piggybank"
        case .tesouro:
            return "building.columns"
        case .rendaFixa:
            return "chart.line.uptrend.xyaxis"
        case .fundos:
            return "briefcase.fill"
        }
    }
}