import Foundation

struct CryptoMarketDTO: Codable {
    let id: String
    let symbol: String
    let name: String
    let image: String
    let currentPrice: Double
    let priceChangePercentage24h: Double?
    
    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case priceChangePercentage24h = "price_change_percentage_24h"
    }
}


struct Crypto {
    let id: String
    let symbol: String
    let name: String
    let imageURL: String
    let currentPrice: Double
    let priceChange24h: Double?
    
}


extension CryptoMarketDTO {
    func toDomain() -> Crypto {
        return Crypto(
            id: id,
            symbol: symbol.uppercased(),
            name: name,
            imageURL: image,
            currentPrice: currentPrice,
            priceChange24h: priceChangePercentage24h
        )
    }
}

extension NumberFormatter {
    static let currencyBRL: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.currencyCode = "BRL"
        return formatter
    }()
}