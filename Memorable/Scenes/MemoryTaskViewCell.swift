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
    
    
    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var groupLabel: UILabel!
    
    @IBOutlet var timeLabel: UILabel!
    
    @IBOutlet var checkBtn: UIButton!
    @IBOutlet var progressConstr: NSLayoutConstraint!
    func bind(_ viewModel:MemoryTaskViewModel) {
        self.titleLabel.text = viewModel.title
        self.groupLabel.text = viewModel.group
        self.timeLabel.text = viewModel.time
        self.progressConstr.constant = 50
    }
    
    override func awakeFromNib() {
        foregroundView.layer.cornerRadius = 10
        foregroundView.layer.masksToBounds = true
        super.awakeFromNib()
    }
    
    override func animationDuration(_ itemIndex: NSInteger, type _: FoldingCell.AnimationType) -> TimeInterval {
        let durations = [0.26, 0.2, 0.2]
        return durations[itemIndex]
    }
}
