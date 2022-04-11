//
//  ShapeExt.swift
//  {{cookiecutter.project_name}}
//
//  Created by {{cookiecutter.lead_dev_name}} on {% now 'local' %}.
//  Copyright © {% now 'local', '%Y' %} {{cookiecutter.company_name}} All rights reserved.
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
