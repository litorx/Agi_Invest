import Foundation

struct CoinGeckoConfig {
    static let baseURL = "https://api.coingecko.com"
    static let demoAPIKey = "CG-sU9dUwvAKsJtfFkxsguekqtv"
    static let headerKey = "x-cg-demo-api-key"
    
    enum Endpoints {
        static let markets = "/api/v3/coins/markets"
    }
}