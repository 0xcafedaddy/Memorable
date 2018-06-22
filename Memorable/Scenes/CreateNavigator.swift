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
    private let navigationController: UINavigationController
    private let services: UseCaseProvider
    
    init(services: UseCaseProvider,
         navigationController: UINavigationController,
         storyBoard: UIStoryboard) {
        self.services = services
        self.navigationController = navigationController
        self.storyBoard = storyBoard
    }
    
    func toMainMemo() {
        navigationController.dismiss(animated: true, completion: nil)
    }
    
    func toGroups() {
        let navigator = DefaultGroupsNavigator(services: services,
                                               navigationController: navigationController,
                                               storyBoard: storyBoard)
        let viewModel = GroupsViewModel(navigator: navigator)
        let vc = storyBoard.instantiateViewController(ofType: GroupsViewController.self)
        vc.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        vc.viewModel = viewModel
        let nc = UINavigationController(rootViewController: vc)
        navigationController.present(nc, animated: true, completion: nil)
    }
}


