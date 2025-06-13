import Foundation

public class DataManager {
    public static let shared = DataManager()
    
    private init() {}
    
    public func fetchData(completion: @escaping (Result<[String], Error>) -> Void) {
        // Simulate network call
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            let mockData = ["Item 1", "Item 2", "Item 3"]
            DispatchQueue.main.async {
                completion(.success(mockData))
            }
        }
    }
    
    public func processData(_ input: String) -> String {
        return "Processed: \(input)"
    }
}
