//
//  RectangleView.swift
//  ToDoList
//
//  Created by Nikita Tikhonov on 29.10.2023.
//

import SwiftUI

enum RectangleStyle {
    case filled
    case halfTopLeftToBottomRight
    case halfTopRightToBottomLeft
    case outlined
}

struct CustomRectangle: View {
    var style: RectangleStyle
    var color: Color = .black
    var size: CGSize = CGSize(width: 100, height: 100)

    var body: some View {
        ZStack {
            switch style {
            case .filled:
                Rectangle().fill(color)
            case .halfTopLeftToBottomRight:
                Rectangle().fill(color).mask(TriangleTopLeftToBottomRight().scaleEffect(size))
            case .halfTopRightToBottomLeft:
                Rectangle().fill(color).mask(TriangleTopRightToBottomLeft().scaleEffect(size))
            case .outlined:
                Rectangle().stroke(color, lineWidth: 2)
            }
        }
        .frame(width: size.width, height: size.height)
    }
}

struct TriangleTopLeftToBottomRight: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

struct TriangleTopRightToBottomLeft: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

struct CustomRectangle_Previews: PreviewProvider {
    static var previews: some View {
        HStack(spacing: 20) {
            CustomRectangle(style: .filled)
            CustomRectangle(style: .halfTopLeftToBottomRight)
            CustomRectangle(style: .halfTopRightToBottomLeft)
            CustomRectangle(style: .outlined)
        }
    }
}

struct MyPreview: View {
    var body: some View {
        HStack(spacing: 20) {
            CustomRectangle(style: .filled)
            CustomRectangle(style: .halfTopLeftToBottomRight)
            CustomRectangle(style: .halfTopRightToBottomLeft)
            CustomRectangle(style: .outlined)
        }
    }
}

#Preview {
    MyPreview()
}
