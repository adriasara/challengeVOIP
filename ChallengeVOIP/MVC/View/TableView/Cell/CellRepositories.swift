//
//  CellRepositories.swift
//  ChallengeVOIP
//
//  Created by Ádria Sara Cardoso de Oliveira on 27/03/20.
//  Copyright © 2020 Ádria Cardoso. All rights reserved.
//

import UIKit

class CellRepositories: UITableViewCell {
    
    private let itemsIdLabel: UILabel = UILabel()
    private let nodeIdLabel: UILabel = UILabel()
    private let fullNameLabel: UILabel = UILabel()
    
    lazy var stackView: UIStackView = {
         let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
         return stackView
     }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    private func commonInit() {
        subviews()
        setupComponents()
        layout()
    }
    
    private func subviews() {
        
        stackView.addArrangedSubview(itemsIdLabel)
        stackView.addArrangedSubview(nodeIdLabel)
        stackView.addArrangedSubview(fullNameLabel)
        
        sv([stackView])
    }
    
    private func layout() {
        
        stackView.centerVertically().left(10)
    }
    
    private func setupComponents() {
        itemsIdLabel.font = UIFont(name: "Arial-Regular", size: 10.0)
        itemsIdLabel.textAlignment = .left
        itemsIdLabel.numberOfLines = 0
        itemsIdLabel.textColor = .black
        
        nodeIdLabel.font = UIFont(name: "Arial-Regular", size: 10.0)
        nodeIdLabel.textAlignment = .left
        nodeIdLabel.numberOfLines = 0
        nodeIdLabel.textColor = .black
        
        fullNameLabel.font = UIFont(name: "Arial-Regular", size: 10.0)
        fullNameLabel.textAlignment = .left
        fullNameLabel.numberOfLines = 0
        fullNameLabel.textColor = .black
    }
    
    func setItemId(id : String){
        itemsIdLabel.text = "ID: \(id))"
    }
    
    func setItemNodeID(node_id : String){
        nodeIdLabel.text = "Node_ID: \(node_id)"
    }
    
    func setItemFullName(fullName : String){
        fullNameLabel.text = "Full_Name: \(fullName)"
    }
}

extension CellRepositories {
    class var reusableIdentifier: String {
        return String(describing: self)
    }
}

