//
//  ContentView.swift
//  SwiftUI-Rotate-Layout
//
//  Created by Yohei Okawa on 2024/10/17.
//

import SwiftUI

struct RadialView: View {
    
    var offset: Angle
    
    var body: some View {
        RadialLayout(offset: offset) {
            Avatar("🐶")
            Avatar("🐱")
            Avatar("🐭")
        }
        .background {
            Circle()
                .strokeBorder(.gray, style: StrokeStyle(lineWidth: 4, dash: [10, 10]))
        }
    }
}

extension RadialView: Animatable {
    
    var animatableData: Angle.AnimatableData {
        get { offset.animatableData }
        set { offset.animatableData = newValue}
    }
    
}

struct RadialLayout: Layout {
    
    private let offset: Angle
    
    init(offset: Angle = Angle(degrees: 0.0)) {
        self.offset = offset
    }
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        proposal.replacingUnspecifiedDimensions()
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        for (index, subview) in subviews.enumerated() {
            let radius = bounds.width / 3.0
            let angle = (Angle.degrees(360.0 / Double(subviews.count) * Double(index)) + offset).radians
            
            var point = CGPoint(x: 0, y: radius)
                .applying(CGAffineTransform(rotationAngle: angle))
            
            point.x += bounds.midX
            point.y += bounds.midY
            
            subview.place(at: point, anchor: .center, proposal: .unspecified)
        }
    }
    
}
