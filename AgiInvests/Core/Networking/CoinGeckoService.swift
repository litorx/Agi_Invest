import Foundation

struct CoinGeckoService {
    private let networkingService: NetworkingService
    
    init(networkingService: NetworkingService = HTTPClient.shared) {
        self.networkingService = networkingService
    }
    
    func fetchTop25CryptoForInvestment() async throws -> [Crypto] {
        let endpoint = CoinGeckoEndpoint.top25ForInvestment()
        
        let response: [CryptoMarketDTO] = try await networkingService.request(
            endpoint,
            responseType: [CryptoMarketDTO].self
        )
        
        let filteredCryptos = response
            .filter { crypto in
                !crypto.name.lowercased().contains("wrapped") &&
                !crypto.id.lowercased().contains("wrapped")
            }
            .prefix(25)
        
        return Array(filteredCryptos).map { $0.toDomain() }
    }
}
