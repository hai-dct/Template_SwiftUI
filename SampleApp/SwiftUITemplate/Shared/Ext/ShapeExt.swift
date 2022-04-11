//
//  ShapeExt.swift
//  Shared
//
//  Created by Hai Nguyen H.P.[3] VN.Danang on 5/12/21.
//

import SwiftUI

extension Shape {
    /// fills and strokes a shape
    public func fill<S: ShapeStyle>(_ fillContent: S, stroke: StrokeStyle) -> some View {
        ZStack {
            self.fill(fillContent)
            self.stroke(style:stroke)
        }
    }
}
