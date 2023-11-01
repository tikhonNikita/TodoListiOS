//
//  HeaderView.swift
//  ToDoList
//
//  Created by Nikita Tikhonov on 24.10.2023.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let rotationAngle: Double
    let color: Color
    
    let height = UIScreen.main.bounds.height / 4
    let offset = (UIScreen.main.bounds.height / 4) / 2.23
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(color)
                .rotationEffect(Angle(degrees: rotationAngle))
                .frame(width: 600, height: 300)
            
            VStack {
                Text(title)
                    .foregroundColor(.white)
                    .font(.system(size: 50))
                    .bold()
                Text(subtitle)
                    .foregroundColor(.white)
                    .font(.system(size: 30))
            }
            .padding(.top, 50)
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: height)
        .offset(y: -offset)
        .onAppear {
            print(height)
            print(offset)
        }
    }
}

struct Preview: View {
    var body: some View {
        HeaderView(title: "Register", subtitle: "Start organizing you todos", rotationAngle: 15, color: .blue)
    }
}

#Preview {
    Preview()
}
