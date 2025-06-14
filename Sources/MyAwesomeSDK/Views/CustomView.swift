#if canImport(UIKit)
import SwiftUI
import UIKit

public class CustomUIView: UIView {
    private let label = UILabel()
    private let button = UIButton(type: .system)
    
    public var onButtonTap: (() -> Void)?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        backgroundColor = .systemGray6
        layer.cornerRadius = 12
        
        label.text = "SDK Custom View"
        label.font = .boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        
        button.setTitle("Tap Me", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        [label, button].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 16),
            button.centerXAnchor.constraint(equalTo: centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 44),
            button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
    
    @objc private func buttonTapped() {
        onButtonTap?()
    }
    
    public func updateText(_ text: String) {
        label.text = text
    }
}

// UIViewRepresentable wrapper for SwiftUI
public struct CustomUIViewRepresentable: UIViewRepresentable {
    public let text: String
    public let onButtonTap: () -> Void
    
    public init(text: String, onButtonTap: @escaping () -> Void) {
        self.text = text
        self.onButtonTap = onButtonTap
    }
    
    public func makeUIView(context: Context) -> CustomUIView {
        let view = CustomUIView()
        view.updateText(text)
        view.onButtonTap = onButtonTap
        return view
    }
    
    public func updateUIView(_ uiView: CustomUIView, context: Context) {
        uiView.updateText(text)
        uiView.onButtonTap = onButtonTap
    }
}
#endif
