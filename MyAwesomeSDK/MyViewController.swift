import UIKit

@MainActor
public class MyViewController: UIViewController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemYellow
        
        let label = UILabel()
        label.text = "Welcome from SDK!"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 18)
        
        let button = UIButton(type: .system)
        button.setTitle("Tap Me", for: .normal)
        button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        
        [label, button].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc private func tapAction() {
        print("Button tapped from SDK ViewController")
        
        // Example of using the SDK
        let sdk = MyAwesomeSDKCore()
        sdk.getAllUsers { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let users):
                    print("Fetched \(users.count) users")
                case .failure(let error):
                    print("Error fetching users: \(error)")
                }
            }
        }
    }
}
