//
//  GroupsViewController.swift
//  Memorable
//
//  Created by jarvis on 2018/6/21.
//  Copyright © 2018年 JarvisWu. All rights reserved.
//

import UIKit
import Domain
import RxSwift
import RxCocoa

class GroupsViewController: UIViewController {
    private let disposeBag = DisposeBag()
    
    @IBOutlet var quitBtn: UIButton!
    var viewModel: GroupsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        bindViewModel()
    }
    
    func configureUI() {
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0)
    }
    
    private func bindViewModel() {
        assert(viewModel != nil)
        let viewWillAppear = rx.sentMessage(#selector(UIViewController.viewWillAppear(_:)))
            .mapToVoid()
            .asDriverOnErrorJustComplete()
        let input = GroupsViewModel.Input(completeTrigger: quitBtn.rx.tap.asDriver())
        let output = viewModel.transform(input: input)
        output.complete
            .drive()
            .disposed(by: disposeBag)
    }
}
