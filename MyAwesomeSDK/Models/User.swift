import Foundation

public struct User: Codable, Sendable {
    public let id: Int
    public let name: String
    public let email: String
}
