import Foundation

class HTTPClient: NetworkingService {
    static let shared = HTTPClient()
    
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func request<T: Codable>(_ endpoint: Endpoint, responseType: T.Type) async throws -> T {
        guard let url = buildURL(from: endpoint) else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        
        endpoint.headers?.forEach { key, value in
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        do {
            let (data, response) = try await session.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.unknown(URLError(.badServerResponse))
            }
            
            guard 200...299 ~= httpResponse.statusCode else {
                throw NetworkError.serverError(httpResponse.statusCode)
            }
            
            guard !data.isEmpty else {
                throw NetworkError.noData
            }
            
            do {
                let decodedData = try JSONDecoder().decode(responseType, from: data)
                return decodedData
            } catch {
                throw NetworkError.decodingError
            }
            
        } catch let error as NetworkError {
            throw error
        } catch {
            throw NetworkError.unknown(error)
        }
    }
    
    private func buildURL(from endpoint: Endpoint) -> URL? {
        var components = URLComponents(string: endpoint.baseURL + endpoint.path)
        components?.queryItems = endpoint.queryItems
        return components?.url
    }
}