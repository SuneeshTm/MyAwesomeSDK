import SwiftUI

public struct CustomButton: View {
    public let title: String
    public let action: () -> Void
    
    public init(title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }
    
    public var body: some View {
        Button(action: action) {
            Text(title)
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(8)
        }
    }
}//
//  CustomButton.swift
//  MyAwesomeSDK
//
//  Created by Suneesh on 13/06/25.
//

