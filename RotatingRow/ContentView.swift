//
//  ContentView.swift
//  RotatingRow
//
//  Created by admin on 15.05.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        RotatingRow(numberOfSquares: 7, spacing: 5)
    }
}

struct RotatingRow: View {
    let numberOfSquares: Int
    let spacing: CGFloat

    var body: some View {
        GeometryReader { geometry in
            let availableWidth = geometry.size.width
            let squareWidth = (availableWidth - CGFloat(numberOfSquares - 1) * spacing) / CGFloat(numberOfSquares)
            VStack {
                HStack(alignment: .center, spacing: spacing) {
                    ForEach(0..<numberOfSquares, id: \.self) { _ in
                        CustomSquareView(color: .blue) {
                            // Handle tap gesture
                            print("Square tapped")
                        }
                        .frame(width: squareWidth, height: squareWidth)
                    }
                }
                .border(.black, width: 2)
            }
            .frame(maxHeight: .infinity)
            .border(.yellow, width: 2)
        }
    }
}

struct CustomSquareView: View {
    let color: Color
    let onTapGesture: () -> Void

    var body: some View {
        Rectangle()
            .fill(color)
            .onTapGesture {
                onTapGesture()
            }
    }
}

#Preview {
    ContentView()
}
