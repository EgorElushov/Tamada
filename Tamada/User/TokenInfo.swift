import Foundation

struct TokensInfo: Codable {
    let accessToken: String
    let accessTokenExpire: Int64
    let refreshToken: String
    let refreshTokenExpire: Int64
}

struct TokenInfo {
    let token: String
    let expiresAt: Int64
}
