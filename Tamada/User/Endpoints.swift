import Foundation

enum Endpoint {
    
    static let baseURL: String  = "92.118.169.243"

    case register
    case login
    case refreshTokens
    case getDevelopers
    
    func path() -> String {
        switch self {
        case .register:
            return "api/register"
        case .login:
            return "api/login"
        case .refreshTokens:
            return "api/refresh_tokens"
        case .getDevelopers:
            return "api/get_devs"
        }
    }
    
    var absoluteURL: URL {
        URL(string: Endpoint.baseURL + self.path())!
    }
}

enum Result<T> {
    case success(_ response: T)
    case serverError(_ err: ErrorResponse)
    case authError(_ err: ErrorResponse)
    case networkError(_ err: String)
}
