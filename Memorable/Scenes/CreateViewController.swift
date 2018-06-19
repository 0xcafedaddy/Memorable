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
    private var imagePicker: ImagePicker = ImagePicker()
    
    var viewModel: CreateViewModel!
    
    @IBOutlet var imagePickCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        bindViewModel()
    }
    
    private func configureUI() {
        imagePicker.configure(with: imagePickCollectionView)
    }
    
    private func bindViewModel() {
//        assert(viewModel != nil)
//        let viewWillAppear = rx.sentMessage(#selector(UIViewController.viewWillAppear(_:)))
//            .mapToVoid()
//            .asDriverOnErrorJustComplete()
    }
}

