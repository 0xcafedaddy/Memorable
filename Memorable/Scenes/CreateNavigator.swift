//
//  CreateNavigator.swift
//  Memorable
//
//  Created by jarvis on 2018/6/2.
//  Copyright © 2018年 JarvisWu. All rights reserved.
//

import UIKit
import Domain

protocol CreateNavigator {
    func toMainMemo()
    func toGroups()
}

class DefaultCreateNavigator: CreateNavigator {
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
    
    func toMainMemo() {
        currentController.dismiss(animated: true, completion: nil)
    }
    
    func toGroups() {
        let vc = storyBoard.instantiateViewController(ofType: GroupsViewController.self)
        let navigator = DefaultGroupsNavigator(services: services,
                                               currentController: vc,
                                               storyBoard: storyBoard)
        let viewModel = GroupsViewModel(navigator: navigator)
        vc.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        vc.viewModel = viewModel
        currentController.present(vc, animated: true, completion: nil)
    }
}


