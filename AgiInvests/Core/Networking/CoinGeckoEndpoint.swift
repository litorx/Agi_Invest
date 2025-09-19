import Foundation

struct CoinGeckoEndpoint: Endpoint {
    let baseURL: String
    let path: String
    let method: HTTPMethod
    let headers: [String: String]?
    let queryItems: [URLQueryItem]?
    
    init(baseURL: String, path: String, method: HTTPMethod = .GET, headers: [String: String]? = nil, queryItems: [URLQueryItem]? = nil) {
        self.baseURL = baseURL
        self.path = path
        self.method = method
        self.headers = headers
        self.queryItems = queryItems
    }
    
    static func top25ForInvestment() -> CoinGeckoEndpoint {
        return CoinGeckoEndpoint(
            baseURL: CoinGeckoConfig.baseURL,
            path: CoinGeckoConfig.Endpoints.markets,
            headers: [
                CoinGeckoConfig.headerKey: CoinGeckoConfig.demoAPIKey
            ],
            queryItems: [
                URLQueryItem(name: "vs_currency", value: "brl"),
                URLQueryItem(name: "order", value: "market_cap_desc"),
                URLQueryItem(name: "per_page", value: "50"),
                URLQueryItem(name: "page", value: "1"),
                URLQueryItem(name: "sparkline", value: "false"),
                URLQueryItem(name: "price_change_percentage", value: "24h,7d,30d")
            ]
        )
    }
}
