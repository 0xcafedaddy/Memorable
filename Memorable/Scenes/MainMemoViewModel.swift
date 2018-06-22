//
//  MainMemoViewModel.swift
//  Memorable
//
//  Created by jarvis on 2018/6/2.
//  Copyright © 2018年 JarvisWu. All rights reserved.
//

import Foundation
import Domain
import RxSwift
import RxCocoa

final class MainMemoViewModel: ViewModelType {
    
    struct Input {
        let trigger: Driver<Void>
        let CreateTaskTrigger: Driver<Void>
        let selection: Driver<IndexPath>
        
    }
    struct Output {
        let taskCell: Driver<[MemoryTaskViewModel]>
        let createTask: Driver<Void>
    }
    
    private let navigator: MainMemoNavigator
    init(navigator: MainMemoNavigator) {
        self.navigator = navigator
    }
    
    func transform(input: Input) -> Output {
        
        let taskCell = input.trigger.flatMapLatest {
            return Driver.just([MemoryTaskViewModel(with: Task(title: "长恨歌-白居易",group: "诗歌")),MemoryTaskViewModel(with: Task(title: "沁园春长沙",group: "毛泽东诗词"))])
        }
        
        let createTask = input.CreateTaskTrigger
            .do(onNext: navigator.toCreate)
        
        return Output(taskCell: taskCell,
                      createTask: createTask)
    }
}


