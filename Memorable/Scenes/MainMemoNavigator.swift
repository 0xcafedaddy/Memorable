//
//  MainMemoNavigator.swift
//  Memorable
//
//  Created by jarvis on 2018/6/2.
//  Copyright © 2018年 JarvisWu. All rights reserved.
//

import UIKit
import Domain

protocol MainMemoNavigator {
    func toMainMemo()
    func toCreate()
}

class DefaultMainMemoNavigator: MainMemoNavigator {
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
        let vc = storyBoard.instantiateViewController(ofType: MainMemoController.self)
        vc.viewModel = MainMemoViewModel(navigator: self)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func toCreate() {
        let navigator = DefaultCreateNavigator(navigationController: navigationController)
        let viewModel = CreateViewModel(navigator: navigator)
        let vc = storyBoard.instantiateViewController(ofType: CreateViewController.self)
        vc.viewModel = viewModel
        let nc = UINavigationController(rootViewController: vc)
        navigationController.present(nc, animated: true, completion: nil)
    }
}

