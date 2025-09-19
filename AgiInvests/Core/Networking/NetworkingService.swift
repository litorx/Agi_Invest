import Foundation

protocol NetworkingService {
    func request<T: Codable>(_ endpoint: Endpoint, responseType: T.Type) async throws -> T
}

protocol Endpoint {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var queryItems: [URLQueryItem]? { get }
}

enum HTTPMethod: String {
    case GET = "GET"
}

enum NetworkError: Error, LocalizedError {
    case invalidURL
    case noData
    case decodingError
    case serverError(Int)
    case unknown(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "URL inválida"
        case .noData:
            return "Nenhum dado recebido"
        case .decodingError:
            return "Erro ao decodificar dados"
        case .serverError(let code):
            return "Erro do servidor: \(code)"
        case .unknown(let error):
            return "Erro desconhecido: \(error.localizedDescription)"
        }
    }
}