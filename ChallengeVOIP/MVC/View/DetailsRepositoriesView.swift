//
//  DetailsRepositoriesView.swift
//  ChallengeVOIP
//
//  Created by Ádria Sara Cardoso de Oliveira on 28/03/20.
//  Copyright © 2020 Ádria Cardoso. All rights reserved.
//

import UIKit
import Stevia

protocol BackViewDelegate {
    func backView()
    func saveOrDeleteItem(text: String)
}

class DetailsRepositoriesView: UIView {
    
    var delegate: BackViewDelegate?
    var pullResult = [PullsModel]()
    
    private lazy var whiteView: UIView = {
      let whiteView = UIView(frame: .zero)
      whiteView.backgroundColor = .white
      whiteView.layer.cornerRadius = 15.0
      return whiteView
    }()
    
    private lazy var viewTB: UIView = {
      let viewTB = UIView(frame: .zero)
      viewTB.backgroundColor = .white
      return viewTB
    }()
    
    private lazy var tableViewPulls: UITableView = {
        let tableViewPulls = UITableView(frame: .zero, style: .plain)
        tableViewPulls.register(CellPulls.self, forCellReuseIdentifier: CellPulls.reusableIdentifier)
        tableViewPulls.delegate = self
        tableViewPulls.dataSource = self
        tableViewPulls.isScrollEnabled = true
        tableViewPulls.isPagingEnabled = false
        tableViewPulls.backgroundColor = .white
        tableViewPulls.separatorStyle = .singleLine
        tableViewPulls.isUserInteractionEnabled = true
        tableViewPulls.allowsSelectionDuringEditing = true
        tableViewPulls.allowsSelection = true
        tableViewPulls.tableFooterView = UIView()
        tableViewPulls.layer.borderWidth = 1.0
        tableViewPulls.layer.borderColor = UIColor.black.cgColor
        tableViewPulls.backgroundColor = .white
        return tableViewPulls
    }()
    
    lazy var stackViewButtons: UIStackView = {
         let stackViewButtons = UIStackView(frame: .zero)
        stackViewButtons.axis = .horizontal
        stackViewButtons.alignment = .fill
        stackViewButtons.distribution = .equalSpacing
        stackViewButtons.spacing = 10
        stackViewButtons.translatesAutoresizingMaskIntoConstraints = false
         return stackViewButtons
     }()
    
    lazy var saveButton: UIButton = {
        let saveButton = UIButton(frame: .zero)
        saveButton.titleLabel?.font = UIFont(name: "Arial-Regular", size: 10.0)
        saveButton.backgroundColor = .clear
        saveButton.imageView?.contentMode = .scaleAspectFit
        saveButton.setTitleColor(.black, for: .normal)
        return saveButton
    }()
    
    lazy var backButton: UIButton = {
        let saveButton = UIButton(frame: .zero)
        saveButton.setTitle("Voltar", for: .normal)
        saveButton.titleLabel?.font = UIFont(name: "Arial-Regular", size: 10.0)
        saveButton.backgroundColor = .clear
        saveButton.imageView?.contentMode = .scaleAspectFit
        saveButton.setTitleColor(.black, for: .normal)
        return saveButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        backgroundColor = UIColor(white: 0.0, alpha: 0.5)
        subviews()
        layout()
        addActions()
    }
    
    private func subviews() {
        
        stackViewButtons.addArrangedSubview(backButton)
        stackViewButtons.addArrangedSubview(saveButton)
        
        viewTB.sv([tableViewPulls])

        whiteView.sv([viewTB, stackViewButtons])
        
        sv([whiteView])
    }
    
    private func layout() {
        
        whiteView.centerVertically().centerHorizontally().height(450).width(350)
        
        viewTB.left(10).right(10).top(10)
        
        tableViewPulls.left(0).top(0).right(0).bottom(0)
        
        stackViewButtons.Top == viewTB.Bottom + 20
        stackViewButtons.left(10).right(10).bottom(10)
    }
    
    private func addActions() {
        
        backButton.addTarget(self, action: #selector(backAction(_:)), for: .touchUpInside)
        saveButton.addTarget(self, action: #selector(saveAction(_:)), for: .touchUpInside)
    }
    
    @objc func backAction(_ sender: UIButton) {
        
        self.delegate?.backView()
    }
    
    @objc func saveAction(_ sender: UIButton) {
        
        if let text = saveButton.titleLabel?.text {
            self.delegate?.saveOrDeleteItem(text: text)
        }
    }
    
    func setButtonTitle(title: String) {
        saveButton.setTitle(title, for: .normal)
    }
    
    func getPullResult(result: [PullsModel]) {
        pullResult = result
    }
    
    func setPullResult() -> [PullsModel] {
        return pullResult
    }
}
