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
    
    private lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.layer.cornerRadius = 5.0  // Don't let background bleed
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
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.reusableIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = true
        tableView.isPagingEnabled = false
        tableView.backgroundColor = .white
        tableView.separatorStyle = .singleLine
        tableView.isUserInteractionEnabled = true
        tableView.allowsSelectionDuringEditing = true
        tableView.allowsSelection = true
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    private lazy var viewDetails: UIView = {
        let viewDetails = UIView(frame: .zero)
        viewDetails.backgroundColor = .systemPink
        viewDetails.isHidden = true
        return viewDetails
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
        
        viewTableView.sv([tableView])
        whiteView.sv([viewTableView, viewDetails])
        sv([segmentedControl, whiteView])
    }
    
    private func layout() {
        
        segmentedControl.top(50).left(10).right(10)
        
        whiteView.Top == segmentedControl.Bottom + 20
        whiteView.left(10).right(10).bottom(10)
    
        viewTableView.top(0).left(0).right(0).bottom(0)
        
        tableView.top(10).left(10).right(10).bottom(10)
        
        viewDetails.top(0).left(0).right(0).bottom(0)
    }
    
    private func addActions() {
        
        segmentedControl.addTarget(self, action: #selector(changeSegmentedAction), for: .valueChanged)
    }
    
    @objc func changeSegmentedAction() {
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            viewTableView.isHidden = false
            viewDetails.isHidden = true
        case 1:
            viewTableView.isHidden = true
            viewDetails.isHidden = false
        default:
            break
        }
    }
    
    func setJSONResult(result : ItemsModel){
        jsonResult = result
    }
    
    func result() -> ItemsModel {
        
        return jsonResult
    }
}
