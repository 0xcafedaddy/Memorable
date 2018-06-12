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

class MainMemoController: UIViewController , UITableViewDelegate{
    private let disposeBag = DisposeBag()
    
    @IBOutlet var memoryTaskTableView: UITableView!
    var viewModel: MainMemoViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        bindViewModel()
    }
    
    private func bindViewModel() {
        assert(viewModel != nil)
        let viewWillAppear = rx.sentMessage(#selector(UIViewController.viewWillAppear(_:)))
            .mapToVoid()
            .asDriverOnErrorJustComplete()
        let pull = memoryTaskTableView.refreshControl!.rx
            .controlEvent(.valueChanged)
            .asDriver()
        
        let input = MainMemoViewModel.Input(trigger: Driver.merge(viewWillAppear, pull),
                                         selection: memoryTaskTableView.rx.itemSelected.asDriver())
        
        let output = viewModel.transform(input: input)
        //Bind Posts to UITableView
        output.taskCell.drive(memoryTaskTableView.rx.items(cellIdentifier: MemoryTaskViewCell.reuseID, cellType: MemoryTaskViewCell.self)) { tv, viewModel, cell in
            cell.bind(viewModel)
            
        }.disposed(by: disposeBag)
    }
    
    
    // MARK: UI
    
    let kCloseCellHeight: CGFloat = 100
    let kOpenCellHeight: CGFloat = 410
    let kRowsCount = 10
    var cellHeights: [CGFloat] = [100,48,106,219]
    
    private func configureTableView() {
        cellHeights = Array(repeating: kCloseCellHeight, count: kRowsCount)
        memoryTaskTableView.estimatedRowHeight = kCloseCellHeight
        memoryTaskTableView.rowHeight = UITableViewAutomaticDimension
        
        memoryTaskTableView.refreshControl = UIRefreshControl()
        memoryTaskTableView.refreshControl?.addTarget(self, action: #selector(refreshHandler), for: .valueChanged)
        
        memoryTaskTableView.delegate = self
    }
    
    @objc func refreshHandler() {
        let deadlineTime = DispatchTime.now() + .seconds(1)
        DispatchQueue.main.asyncAfter(deadline: deadlineTime, execute: { [weak self] in
            if #available(iOS 10.0, *) {
                self?.memoryTaskTableView.refreshControl?.endRefreshing()
            }
            self?.memoryTaskTableView.reloadData()
        })
    }
    
    internal func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeights[indexPath.row]
    }
    
    internal func tableView(_: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard case let cell as MemoryTaskViewCell = cell else {
            return
        }
        
        cell.backgroundColor = .clear
        
        if cellHeights[indexPath.row] == kCloseCellHeight {
            cell.unfold(false, animated: false, completion: nil)
        } else {
            cell.unfold(true, animated: false, completion: nil)
        }
    }
    
    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! MemoryTaskViewCell
        
        if cell.isAnimating() {
            return
        }
        
        var duration = 0.0
        let cellIsCollapsed = cellHeights[indexPath.row] == kCloseCellHeight
        if cellIsCollapsed {
            cellHeights[indexPath.row] = kOpenCellHeight
            cell.unfold(true, animated: true, completion: nil)
            duration = 0.5
        } else {
            cellHeights[indexPath.row] = kCloseCellHeight
            cell.unfold(false, animated: true, completion: nil)
            duration = 0.8
        }
        
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut, animations: { () -> Void in
            tableView.beginUpdates()
            tableView.endUpdates()
        }, completion: nil)
    }
}

