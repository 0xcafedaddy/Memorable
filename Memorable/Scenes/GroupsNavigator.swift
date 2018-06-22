//
//  GroupsNavigator.swift
//  Memorable
//
//  Created by jarvis on 2018/6/21.
//  Copyright © 2018年 JarvisWu. All rights reserved.
//

import UIKit
import Domain

protocol GroupsNavigator {
    
}

final class DefaultGroupsNavigator: GroupsNavigator {
    private let storyBoard: UIStoryboard
    private let currentController: UIViewController
    private let services: UseCaseProvider
    
    init(services: UseCaseProvider,
         currentController: UIViewController,
         storyBoard: UIStoryboard) {
        self.services = services
        self.currentController = currentController
        self.storyBoard = storyBoard
    }
    
    func toCreate() {
        currentController.dismiss(animated: true, completion: nil)
    }
    
}
