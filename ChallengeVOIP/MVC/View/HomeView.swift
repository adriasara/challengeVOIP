//
//  HomeView.swift
//  ChallengeVOIP
//
//  Created by Ádria Sara Cardoso de Oliveira on 28/03/20.
//  Copyright © 2020 Ádria Cardoso. All rights reserved.
//

import UIKit
import Stevia

class HomeView: UIView {
    
    private let items = ["First", "Second"]
    private var jsonResult = ItemsModel()
    var delegate: ShowViewDelegate?
    var itemsResult = [Item]()
    
    private lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.layer.cornerRadius = 5.0
        segmentedControl.backgroundColor = .gray
        segmentedControl.tintColor = .systemBlue
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()
    
    private lazy var whiteView: UIView = {
        let whiteView = UIView(frame: .zero)
        whiteView.backgroundColor = .blue
        return whiteView
    }()
    
    private lazy var viewTableView: UIView = {
        let viewTableView = UIView(frame: .zero)
        viewTableView.backgroundColor = .red
        return viewTableView
    }()
    
    private lazy var tableViewRepositories: UITableView = {
        let tableViewRepositories = UITableView(frame: .zero, style: .plain)
        tableViewRepositories.register(CellRepositories.self, forCellReuseIdentifier: CellRepositories.reusableIdentifier)
        tableViewRepositories.delegate = self
        tableViewRepositories.dataSource = self
        tableViewRepositories.isScrollEnabled = true
        tableViewRepositories.isPagingEnabled = false
        tableViewRepositories.backgroundColor = .white
        tableViewRepositories.separatorStyle = .singleLine
        tableViewRepositories.isUserInteractionEnabled = true
        tableViewRepositories.allowsSelectionDuringEditing = true
        tableViewRepositories.allowsSelection = true
        tableViewRepositories.tableFooterView = UIView()
        tableViewRepositories.tag = 1
        return tableViewRepositories
    }()
    
    private lazy var viewCoreData: UIView = {
        let viewCoreData = UIView(frame: .zero)
        viewCoreData.backgroundColor = .systemPink
        viewCoreData.isHidden = true
        return viewCoreData
    }()
    
    private lazy var tableViewCoreData: UITableView = {
        let tableViewCoreData = UITableView(frame: .zero, style: .plain)
        tableViewCoreData.register(CellItems.self, forCellReuseIdentifier: CellItems.reusableIdentifier)
        tableViewCoreData.delegate = self
        tableViewCoreData.dataSource = self
        tableViewCoreData.isScrollEnabled = true
        tableViewCoreData.isPagingEnabled = false
        tableViewCoreData.backgroundColor = .white
        tableViewCoreData.separatorStyle = .singleLine
        tableViewCoreData.isUserInteractionEnabled = true
        tableViewCoreData.allowsSelectionDuringEditing = true
        tableViewCoreData.allowsSelection = true
        tableViewCoreData.tableFooterView = UIView()
        tableViewCoreData.tag = 2
        return tableViewCoreData
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        subviews()
        layout()
        addActions()
    }
    
    private func subviews() {
        
        viewTableView.sv([tableViewRepositories])
        viewCoreData.sv([tableViewCoreData])
        whiteView.sv([viewTableView, viewCoreData])
        sv([segmentedControl, whiteView])
    }
    
    private func layout() {
        
        segmentedControl.top(50).left(10).right(10)
        
        whiteView.Top == segmentedControl.Bottom + 20
        whiteView.left(10).right(10).bottom(10)
    
        viewTableView.top(0).left(0).right(0).bottom(0)
        
        tableViewRepositories.top(10).left(10).right(10).bottom(10)
                
        viewCoreData.top(0).left(0).right(0).bottom(0)
        
        tableViewCoreData.top(10).left(10).right(10).bottom(10)
    }
    
    private func addActions() {
        
        segmentedControl.addTarget(self, action: #selector(changeSegmentedAction), for: .valueChanged)
    }
    
    @objc func changeSegmentedAction() {
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            viewTableView.isHidden = false
            viewCoreData.isHidden = true
        case 1:
            viewTableView.isHidden = true
            viewCoreData.isHidden = false
        default:
            break
        }
    }
    
    func saveItem(item: [Item]) {
        
        self.itemsResult = item
        self.tableViewCoreData.reloadData()
    }
    
    func reloadCDTableView(item: Item) {
        
        self.tableViewCoreData.reloadData()
        self.itemsResult.append(item)
    }
    
    func setJSONResult(result : ItemsModel){
        jsonResult = result
    }
    
    func result() -> ItemsModel {
        
        return jsonResult
    }
}
