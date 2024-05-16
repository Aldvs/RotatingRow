//
//  Diagonal.swift
//  RotatingRow
//
//  Created by admin on 16.05.2024.
//

import SwiftUI

import Foundation
import SwiftUI

struct DiagonalLayout: Layout {
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        proposal.replacingUnspecifiedDimensions()
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let width = proposal.replacingUnspecifiedDimensions().width
        let height = proposal.replacingUnspecifiedDimensions().height
        let subviewsAmount = CGFloat(subviews.count)
        let viewHeight = height / subviewsAmount
        let viewSize = CGSize(width: viewHeight, height: viewHeight)
        var currentY = bounds.maxY
        var currentX = bounds.minX
        
        for subview in subviews {
            let position = CGPoint(x: currentX, y: currentY)
            subview.place(at: position, anchor: .bottomLeading, proposal: ProposedViewSize(viewSize))
            currentY -= viewHeight
            currentX += (width - viewHeight) / (subviewsAmount - 1)
        }
    }
}
