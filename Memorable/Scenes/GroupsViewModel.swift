//
//  GroupsViewModel.swift
//  Memorable
//
//  Created by jarvis on 2018/6/21.
//  Copyright © 2018年 JarvisWu. All rights reserved.
//

import Foundation
import Domain
import RxSwift
import RxCocoa

final class GroupsViewModel: ViewModelType {
    
    struct Input {
        
    }
    struct Output {
        
    }
    
    func transform(input: Input) -> Output {
        return Output()
    }
    
    private let navigator: GroupsNavigator
    init(navigator: GroupsNavigator) {
        self.navigator = navigator
    }
}
