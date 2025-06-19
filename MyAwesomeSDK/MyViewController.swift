//
//  MyViewController.swift
//  MyAwesomeSDK
//
//  Created by Suneesh on 19/06/25.
//

import UIKit

public class MyViewController: UIViewController {
    public override func viewDidLoad() {
        super.viewDidLoad()
        
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
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    @objc private func tapAction() {
        print("Button tapped from SDK ViewController")
    }
}
