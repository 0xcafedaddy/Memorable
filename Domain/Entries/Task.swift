//
//  Task.swift
//  Domain
//
//  Created by jarvis on 2018/6/7.
//  Copyright © 2018年 JarvisWu. All rights reserved.
//

import Foundation

public struct Task {
    public let title: String
    public let group: String
    public let time: String
    
    public init(title: String, group: String, time: String) {
        self.title = title
        self.group = group
        self.time = time
    }
    
    public init(title: String,group: String) {
        self.init(title: title, group: group, time: Date().description)
    }
}

extension Task: Equatable {
    public static func == (lhs: Task, rhs: Task) -> Bool {
        return lhs.group == rhs.group &&
            lhs.title == rhs.title &&
            lhs.time == rhs.time
    }
}
