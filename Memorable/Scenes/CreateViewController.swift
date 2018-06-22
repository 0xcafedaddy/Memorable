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
    
    @IBAction func groupsViewTapped(_ sender: UITapGestureRecognizer) {
    }
    @IBOutlet var groupsViewTap: UITapGestureRecognizer!
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
        
        let input = CreateViewModel.Input(mainMemoTrigger:cancelBtn.rx.tap.asDriver(),
                                          groupsTrigger:groupsViewTap.rx.event.asDriver())
        let output = viewModel.transform(input: input)
        
        output.mainMemo
            .drive()
            .disposed(by: disposeBag)
        output.mainMemo
            .drive()
            .disposed(by: disposeBag)
        
    }
}

