//
//  ContentView.swift
//  RotatingRow
//
//  Created by admin on 15.05.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        RotatingRow()
    }
}

struct RotatingRow: View {
    let numberOfSquares: Int = 7
    let spacing: CGFloat = 2
    @State var isHorizontal = true

    var body: some View {
        GeometryReader { geometry in
            let availableWidth = geometry.size.width
            let squareWidth = (availableWidth - CGFloat(numberOfSquares - 1) * spacing) / CGFloat(numberOfSquares)
            VStack {
                HStack(alignment: .center, spacing: spacing) {
                    ForEach(0..<numberOfSquares, id: \.self) { _ in
                        CustomSquareView(isHorizontal: $isHorizontal, color: .blue) {
                            // Handle tap gesture
                            print("Square tapped")
                        }
                        .frame(width: squareWidth, height: squareWidth)
                        .rotationEffect(.degrees(isHorizontal ? 0 : getRotatingAngle()), anchor: .center)
                    }
                }
                .frame(width: isHorizontal ? getDefaultWidth() : getDiagonalLength(), height: squareWidth)
                .border(.black, width: 2)
                .rotationEffect(.degrees(isHorizontal ? 0 : -getRotatingAngle()), anchor: .center)
                .animation(.easeInOut, value: isHorizontal)
            }
            .frame(width: getDefaultWidth(), height: getDefaultHeight())
            .border(.yellow, width: 2)
        }
    }
    
    func getRotatingAngle() -> Double {
        let screenSize = UIScreen.main.bounds.size
        let screenWidth = Double(screenSize.width)
        let screenHeight = Double(screenSize.height)
        
        let diagonalLength = sqrt(pow(screenWidth, 2) + pow(screenHeight, 2))
        let angle = atan(screenHeight / screenWidth)
        
        // Convert radians to degrees
        let angleInDegrees = angle * 180 / .pi
        
        return angleInDegrees
    }
    
    private func getDiagonalLength() -> CGFloat {
        let screenSize = UIScreen.main.bounds.size
        return sqrt(pow(screenSize.width, 2) + pow(screenSize.height, 2))
    }
    
    private func getDefaultWidth() -> CGFloat {
        let screenSize = UIScreen.main.bounds.size
        return screenSize.width
    }
    
    private func getDefaultHeight() -> CGFloat {
        let screenSize = UIScreen.main.bounds.size
        return screenSize.height
    }
    
}

struct CustomSquareView: View {
    @Binding var isHorizontal: Bool
    let color: Color
    let onTapGesture: () -> Void

    var body: some View {
        Rectangle()
            .fill(color)
            .onTapGesture {
                isHorizontal.toggle()
                onTapGesture()
            }
    }
}

#Preview {
    ContentView()
}
