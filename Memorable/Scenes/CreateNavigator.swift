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
    
}

class DefaultCreateNavigator: CreateNavigator {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func toMainMemo() {
        navigationController.dismiss(animated: true, completion: nil)
    }
}


