import Foundation

public struct MyAwesomeSDKCore: Sendable {
    
    public init() {}
    
    public func getAllUsers(completion: @escaping @Sendable (Result<[User], Error>) -> Void) {
        UserService.shared.fetchUsers(completion: completion)
    }
}
