import Foundation

struct InvestmentItem: Identifiable {
    let id = UUID()
    let name: String
    let symbol: String
    let value: String
    let change: String
    let icon: String
    
}