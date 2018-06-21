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
//        assert(viewModel != nil)
//        let viewWillAppear = rx.sentMessage(#selector(UIViewController.viewWillAppear(_:)))
//            .mapToVoid()
//            .asDriverOnErrorJustComplete()
    }
    @IBAction func cancelBtnClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func saveBtnClicked(_ sender: Any) {
    }
    @IBAction func groupViewClicked(_ sender: UITapGestureRecognizer) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(ofType: GroupsViewController.self)
        
    }
}

