//
//  TasksUserCase.swift
//  Domain
//
//  Created by jarvis on 2018/6/8.
//  Copyright © 2018年 JarvisWu. All rights reserved.
//

import Foundation
import RxSwift

public protocol TasksUseCase {
    func tasks() -> Observable<[Task]>
    func save(post: Task) -> Observable<Void>
    func delete(post: Task) -> Observable<Void>
}
