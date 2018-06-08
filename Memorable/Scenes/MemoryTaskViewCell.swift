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

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var groupLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    func bind(_ viewModel:MemoryTaskViewModel) {
        self.titleLabel.text = viewModel.title
        self.groupLabel.text = viewModel.group
        self.timeLabel.text = viewModel.time
    }
    
    
    override func animationDuration(_ itemIndex: NSInteger, type _: FoldingCell.AnimationType) -> TimeInterval {
        let durations = [0.26, 0.2, 0.2]
        return durations[itemIndex]
    }
}
