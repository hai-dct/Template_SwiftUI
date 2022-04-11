//
//  UIViewExt.swift
//  SwiftUITemplate
//
//  Created by Hai Nguyen H.P.[3] VN.Danang on 5/27/21.
//

import UIKit.UIView

extension UIView {

    /// This is the function to convert UIView to UIImage
    public func asUIImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}
