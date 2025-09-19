	import Foundation
import SwiftUI

@MainActor
class InvestmentsHomeViewModel: ObservableObject {
    @Published var portfolio: Portfolio?
    
    private let coinGeckoService: CoinGeckoService
    
    init(networkingService: NetworkingService = HTTPClient.shared) {
        coinGeckoService = CoinGeckoService(networkingService: networkingService)
    }
    
    func loadData() {
        Task {
            do {
                let cryptoInvestments = try await self.coinGeckoService.fetchTop25CryptoForInvestment()
                    let allInvestments = cryptoInvestments.map { crypto in
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
                
                let totalValue = allInvestments.reduce(0) { $0 + $1.currentValue }
                let totalChange = allInvestments.compactMap { $0.changeAmount }.reduce(0, +)
                let totalChangePercentage = totalValue > 0 ? (totalChange / totalValue) * 100 : 0
                
                let portfolio = Portfolio(
                    totalValue: totalValue,
                    totalChange: totalChange,
                    totalChangePercentage: totalChangePercentage,
                    investments: allInvestments
                )
                self.portfolio = portfolio
            } catch {
                print("Error loading data: \(error.localizedDescription)")
            }
        }
    }
    
}
