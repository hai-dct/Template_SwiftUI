//
//  ViewExt.swift
//  {{cookiecutter.project_name}}
//
//  Created by {{cookiecutter.lead_dev_name}} on {% now 'local' %}.
//  Copyright © {% now 'local', '%Y' %} {{cookiecutter.company_name}} All rights reserved.
//

import SwiftUI

extension View {
    
    /// Show Toast
    func toast(isShowing: Binding<Bool>, text: Text, completion: (() -> Void)? = nil) -> some View {
        ToastView(isShowing: isShowing, presenting: { self }, text: text, completion: completion)
    }
    
    /// Loading
    func loading(isShowing: Binding<Bool>, completion: (() -> Void)? = nil) -> some View {
        LoadingView(isShowing: isShowing, presenting: { self }, completion: completion)
    }
    
    /// Convert to UIImage
    func snapshot() -> UIImage {
        let controller = UIHostingController(rootView: self)
        let view = controller.view
        let targetSize = controller.view.intrinsicContentSize
        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = .clear
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        
        return renderer.image { _ in
            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }
    
    /// Determined View is hidden or not
    /// - Parameter hidden: Set to `false` to show the view. Set to `true` to hide the view.
    @ViewBuilder func isHidden(_ hidden: Bool) -> some View {
        if hidden {
            self.hidden()
        } else {
            self
        }
    }
        
    func myFont(_ textStyle: FontModifier.TextStyle) -> some View {
        self.modifier(FontModifier(textStyle: textStyle))
    }

    func onRotate(perform action: @escaping (UIDeviceOrientation) -> Void) -> some View {
        self.modifier(DeviceRotationViewModifier(action: action))
    }
}

extension View {
    
    /// This function changes our View to UIView, then calls another function
    /// to convert the newly-made UIView to a UIImage.
    public func asUIImage() -> UIImage {
        let controller = UIHostingController(rootView: self)
        
        controller.view.frame = CGRect(x: 0, y: CGFloat(Int.max), width: 1, height: 1)
        UIApplication.shared.windows.first!.rootViewController?.view.addSubview(controller.view)
        
        let size = controller.sizeThatFits(in: UIScreen.main.bounds.size)
        controller.view.bounds = CGRect(origin: .zero, size: size)
        controller.view.sizeToFit()
        
        // here is the call to the function that converts UIView to UIImage: `.asUIImage()`
        let image = controller.view.asUIImage()
        controller.view.removeFromSuperview()
        return image
    }
}
