//
//  CreateViewController.swift
//  Memorable
//
//  Created by jarvis on 2018/6/2.
//  Copyright © 2018年 JarvisWu. All rights reserved.
//

import UIKit
import Domain
import RxSwift
import RxCocoa

class CreateViewController: UIViewController{
    private let disposeBag = DisposeBag()
    
    var viewModel: CreateViewModel!
    
    @IBOutlet var tf_TaskName: UITextField!

    

    @IBOutlet var groupsBtn: UIButton!
    @IBOutlet var groupNameBtn: UIButton!
    @IBOutlet var saveBtn: UIButton!
    @IBOutlet var cancelBtn: UIButton!
    @IBOutlet var tf_TaskDescription: UITextView!
    @IBOutlet var imagePicker: ImagePickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        bindViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        imagePicker.configCollectionView()
        imagePicker.layoutCollectionView()
    }
    
    private func configureUI() {
    }
    
    private func bindViewModel() {
        assert(viewModel != nil)
        let viewWillAppear = rx.sentMessage(#selector(UIViewController.viewWillAppear(_:)))
            .mapToVoid()
            .asDriverOnErrorJustComplete()
        let groupsTrigger = Driver.of(groupsBtn.rx.tap.asDriver(),groupNameBtn.rx.tap.asDriver()).merge()
        
        let input = CreateViewModel.Input(mainMemoTrigger:cancelBtn.rx.tap.asDriver(),
                                          groupsTrigger:groupsTrigger)
        let output = viewModel.transform(input: input)
        
        output.mainMemo
            .drive()
            .disposed(by: disposeBag)
        output.groups
            .drive()
            .disposed(by: disposeBag)
        
    }
}

