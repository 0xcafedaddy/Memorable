//
//  MemoryTaskViewModel.swift
//  Memorable
//
//  Created by jarvis on 2018/6/7.
//  Copyright © 2018年 JarvisWu. All rights reserved.
//

import Foundation
import Domain

final class MemoryTaskViewModel   {
    let title: String
    let group: String
    let time: String
    let images: [UIImage]
    let text: String
    init (with task:Task) {
        self.time = task.time
        self.title = task.title.uppercased()
        self.group = task.group
        self.images = task.images
        self.text = task.text
    }
}
