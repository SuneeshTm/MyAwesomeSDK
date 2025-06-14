import Foundation

public struct MyAwesomeSDK {
    public static let version = "1.0.0"
    
    public static func initialize(apiKey: String) {
        // SDK initialization logic
        print("MyAwesomeSDK initialized with API key: \(apiKey)")
    }
    
    public static func configure(options: [String: Any]) {
        // Configuration logic
        print("SDK configured with options: \(options)")
    }
}