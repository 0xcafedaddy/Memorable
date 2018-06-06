//
//  MemoryTaskViewCell.swift
//  Memorable
//
//  Created by jarvis on 2018/6/5.
//  Copyright © 2018年 JarvisWu. All rights reserved.
//

import UIKit
import FoldingCell

class MemoryTaskViewCell: FoldingCell {

    override func animationDuration(_ itemIndex:NSInteger, type:AnimationType)-> TimeInterval {
        
        // durations count equal it itemCount
        let durations = [0.33, 0.26, 0.26] // timing animation for each view
        return durations[itemIndex]
    }
}
