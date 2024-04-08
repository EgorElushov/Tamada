import Foundation

struct User: Codable {
    let id: Int64
    let accessToken: String
    let accessTokenExpire: Int64
    let refreshToken: String
    let refreshTokenExpire: Int64
}

struct AuthBody: Codable {
    let login: String
    let password: String
}
