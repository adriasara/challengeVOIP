//
//  DetailsRepositoriesView.swift
//  ChallengeVOIP
//
//  Created by Ádria Sara Cardoso de Oliveira on 28/03/20.
//  Copyright © 2020 Ádria Cardoso. All rights reserved.
//

import UIKit

protocol BackViewDelegate {
    func backView()
    func saveOrDeleteItem(text: String)
}

class DetailsRepositoriesView: UIView {
    
    var delegate: BackViewDelegate?
    
    private lazy var whiteView: UIView = {
      let whiteView = UIView(frame: .zero)
      whiteView.backgroundColor = .white
      whiteView.layer.cornerRadius = 15.0
      return whiteView
    }()
    
    lazy var stackView: UIStackView = {
         let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
         return stackView
     }()
    
    lazy var idLabel: UILabel = {
        let idLabel = UILabel(frame: .zero)
        idLabel.font = UIFont(name: "Arial-Regular", size: 10.0)
        idLabel.textAlignment = .left
        idLabel.numberOfLines = 0
        idLabel.textColor = .black
        return idLabel
    }()
    
    lazy var fullNameLabel: UILabel = {
        let fullNameLabel = UILabel(frame: .zero)
        fullNameLabel.font = UIFont(name: "Arial-Regular", size: 10.0)
        fullNameLabel.textAlignment = .left
        fullNameLabel.numberOfLines = 0
        fullNameLabel.textColor = .black
        return fullNameLabel
    }()
    
    lazy var nodeIdLabel: UILabel = {
        let nodeIdLabel = UILabel(frame: .zero)
        nodeIdLabel.font = UIFont(name: "Arial-Regular", size: 10.0)
        nodeIdLabel.textAlignment = .left
        nodeIdLabel.numberOfLines = 0
        nodeIdLabel.textColor = .black
        return nodeIdLabel
    }()
    
    lazy var saveButton: UIButton = {
        let saveButton = UIButton(frame: .zero)
        saveButton.setTitle("Save", for: .normal)
        saveButton.titleLabel?.font = UIFont(name: "Arial-Regular", size: 10.0)
        saveButton.backgroundColor = .clear
        saveButton.imageView?.contentMode = .scaleAspectFit
        saveButton.setTitleColor(.black, for: .normal)
        return saveButton
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
    
    lazy var backButton: UIButton = {
        let saveButton = UIButton(frame: .zero)
        saveButton.setTitle("Back", for: .normal)
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
        
        stackView.addArrangedSubview(idLabel)
        stackView.addArrangedSubview(fullNameLabel)
        stackView.addArrangedSubview(nodeIdLabel)
        
        stackViewButtons.addArrangedSubview(backButton)
        stackViewButtons.addArrangedSubview(saveButton)
        
        whiteView.sv([stackView, stackViewButtons])
        sv([whiteView])
    }
    
    private func layout() {
        
        whiteView.centerVertically().centerHorizontally().height(350).width(250)
        
        stackView.left(20).right(20).top(50)
        
        stackViewButtons.left(40).right(40).bottom(40)
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
    
    func setId(id : Int){
        idLabel.text = "ID: \(String(id))"
    }
    
    func setFullName(full_name : String){
        fullNameLabel.text = "Full Name: \(full_name)"
    }
    
    func setNodeId(node_id : String) {
        nodeIdLabel.text = "Node ID: \(node_id)"
    }
}
