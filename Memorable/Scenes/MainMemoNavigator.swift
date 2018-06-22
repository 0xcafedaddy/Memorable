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
        let vc = storyBoard.instantiateViewController(ofType: CreateViewController.self)
        let navigator = DefaultCreateNavigator(services: services,
                                               currentController: vc,
                                               storyBoard: storyBoard)
        let viewModel = CreateViewModel(navigator: navigator)
        vc.viewModel = viewModel
        navigationController.present(vc, animated: true, completion: nil)
    }
}

