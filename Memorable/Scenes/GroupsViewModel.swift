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
        let completeTrigger: Driver<Void>
    }
    struct Output {
        let complete: Driver<Void>
    }
    
    private let navigator: GroupsNavigator
    init(navigator: GroupsNavigator) {
        self.navigator = navigator
    }
    
    func transform(input: Input) -> Output {
        let complete = input.completeTrigger.do(onNext: navigator.toCreate)
        return Output(complete: complete)
    }
}
