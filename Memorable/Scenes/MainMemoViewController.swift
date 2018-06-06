//
//  MainMemoViewController.swift
//  Memorable
//
//  Created by jarvis on 2018/6/2.
//  Copyright © 2018年 JarvisWu. All rights reserved.
//

import UIKit
import Domain
import RxSwift
import RxCocoa

class MainMemoController: UITableViewController {
    private let disposeBag = DisposeBag()
    
    @IBOutlet var memoryTaskTableView: UITableView!
    var viewModel: MainMemoViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        bindViewModel()
    }
    
    fileprivate struct C {
        struct CellHeight {
            static let close: CGFloat = 130 // equal or greater foregroundView height
            static let open: CGFloat = 150 // equal or greater containerView height
        }
    }
    
    var cellHeights = (0..<).map { _ in C.CellHeight.close }
    
    private func bindViewModel() {
//        assert(viewModel != nil)
//        let viewWillAppear = rx.sentMessage(#selector(UIViewController.viewWillAppear(_:)))
//            .mapToVoid()
//            .asDriverOnErrorJustComplete()
    }
}

