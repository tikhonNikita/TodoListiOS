//
//  TLButton.swift
//  ToDoList
//
//  Created by Nikita Tikhonov on 25.10.2023.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    
    
    var body: some View {
        Button {
            action()
        }
        label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                Text(title)
                    .foregroundStyle(.white)
                    .bold()
            }
        }
        .padding()
    }
}

struct TLButtonPreview: View {
    var body: some View {
        TLButton(title: "Register", background: .blue) {
            
        }
    }
}

#Preview {
    TLButtonPreview()
}
