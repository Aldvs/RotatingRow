//
//  ContentView.swift
//  RotatingRow
//
//  Created by admin on 15.05.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isTapped = false
    
    var layout: AnyLayout {
        isTapped ? AnyLayout(DiagonalLayout()) : AnyLayout(HorizontalLayout())
    }
    
    var body: some View {
        layout {
            ForEach(0 ..< 7, id: \.self) { _ in
                RoundedRectangle(cornerRadius: 15)
                    .foregroundStyle(.blue)
                    .onTapGesture {
                        withAnimation {
                            isTapped.toggle()
                        }
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}
