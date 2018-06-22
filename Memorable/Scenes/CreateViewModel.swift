//
//  CreateViewModel.swift
//  Memorable
//
//  Created by jarvis on 2018/6/2.
//  Copyright © 2018年 JarvisWu. All rights reserved.
//

import Foundation
import Domain
import RxSwift
import RxCocoa

final class CreateViewModel: ViewModelType {
    
    struct Input {
        let mainMemoTrigger: Driver<Void>
        let groupsTrigger: Driver<UITapGestureRecognizer>
    }
    struct Output {
        let mainMemo: Driver<Void>
        let groups: Driver<UITapGestureRecognizer>
    }
    
    func transform(input: Input) -> Output {
        
        let mainMemo = input.mainMemoTrigger
            .do(onNext: navigator.toMainMemo)
        
        let groups = input.groupsTrigger
            .do(onNext:{ _ in
                self.navigator.toGroups()
            })
        
        return Output(mainMemo: mainMemo, groups: groups)
    }
    
    private let navigator: CreateNavigator
    init(navigator: CreateNavigator) {
        self.navigator = navigator
    }
}


