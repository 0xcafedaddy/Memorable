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
        
    }
    struct Output {
        
    }
    
    func transform(input: Input) -> Output {
        return Output()
    }
    
    private let navigator: CreateNavigator
    init(navigator: CreateNavigator) {
        self.navigator = navigator
    }
}


