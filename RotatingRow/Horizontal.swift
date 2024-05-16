//
//  Horizontal.swift
//  RotatingRow
//
//  Created by admin on 16.05.2024.
//

import Foundation
import SwiftUI

struct HorizontalLayout: Layout {
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        proposal.replacingUnspecifiedDimensions()
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let width = proposal.replacingUnspecifiedDimensions().width
        let subviewsAmount = CGFloat(subviews.count)
        let spacing = 8.0 * (subviewsAmount - 1)
        let viewWidth = (width - spacing) / subviewsAmount
        let viewSize = CGSize(width: viewWidth, height: viewWidth)
        var currentX = bounds.minX + viewWidth / 2
        
        for subview in subviews {
            let position = CGPoint(x: currentX, y: bounds.midY)
            subview.place(at: position, anchor: .center,proposal: ProposedViewSize(viewSize))
            currentX += viewWidth + spacing / (subviewsAmount - 1)
        }
    }
}
