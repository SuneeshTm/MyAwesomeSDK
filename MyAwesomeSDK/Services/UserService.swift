import Foundation

public final class UserService: @unchecked Sendable {
    public static let shared = UserService()
    
    private init() {}
    
    public func fetchUsers(completion: @escaping @Sendable (Result<[User], Error>) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            completion(.failure(NSError(domain: "URL_ERROR", code: 1001)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "DATA_ERROR", code: 1002)))
                return
            }
            
            do {
                let users = try JSONDecoder().decode([User].self, from: data)
                completion(.success(users))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
