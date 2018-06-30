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
    public let images: [UIImage]
    public let text: String
    
    public init(title: String, group: String, time: String, images: [UIImage], text: String) {
        self.title = title
        self.group = group
        self.time = time
        self.images = images
        self.text = text
    }
    
    public init(title: String,group: String, images: [UIImage], text: String) {
        self.init(title: title, group: group, time: Date().description, images: images, text: text)
    }
}

extension Task: Equatable {
    public static func == (lhs: Task, rhs: Task) -> Bool {
        return lhs.group == rhs.group &&
            lhs.title == rhs.title &&
            lhs.time == rhs.time &&
            lhs.images == rhs.images &&
            lhs.text == rhs.text
    }
}
