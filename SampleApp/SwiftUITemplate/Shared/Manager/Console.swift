//
//  Console.swift
//  SwiftUITemplate
//
//  Created by Hai Nguyen H.P.[3] VN.Danang on 5/29/21.
//

import Foundation
import os

extension Logger {
    private static var subsystem = Bundle.main.bundleIdentifier!
    
    /// Logs the notification like enable or disable.
    static let notification = Logger(subsystem: subsystem, category: "lg_notification")
}

final class Console {
    
    enum Category {
        case `default`
        case notification
    }
    
    static func log(_ msg: Any, category: Category, level: OSLogType = .default) {
        #if DEBUG
        switch category {
        case .notification:
            let message = String(describing: msg)
            Logger.notification.log(level: level, "\(message)")
        default:
            let message = String(describing: msg)
            Logger().log(level: level, "\(message)")
        }
        #endif
    }
}
