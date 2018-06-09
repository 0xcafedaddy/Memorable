//
//  Application.swift
//  Memorable
//
//  Created by jarvis on 2018/6/1.
//  Copyright © 2018年 JarvisWu. All rights reserved.
//

import Foundation
import Domain
import NetworkPlatform
import RealmPlatform

final class Application {
    
    private let realmUseCaseProvider: Domain.UseCaseProvider
    private let networkUseCaseProvider: Domain.UseCaseProvider
    
    static let shared = Application()
    
    private init() {
        self.realmUseCaseProvider = RealmPlatform.UseCaseProvider()
        self.networkUseCaseProvider = NetworkPlatform.UseCaseProvider()
    }
    
    func configureMainInterface(in window: UIWindow) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainNavigationController = UINavigationController()
        mainNavigationController.setNavigationBarHidden(true, animated: true)
        let mainNavigator = DefaultMainMemoNavigator(services: realmUseCaseProvider,
                                                navigationController: mainNavigationController,
                                                storyBoard: storyboard)
        window.rootViewController = mainNavigationController
        
        mainNavigator.toMainMemo()
        
        
    }
}
