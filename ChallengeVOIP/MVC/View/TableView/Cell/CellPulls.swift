//
//  CellPulls.swift
//  ChallengeVOIP
//
//  Created by Ádria Sara Cardoso de Oliveira on 30/03/20.
//  Copyright © 2020 Ádria Cardoso. All rights reserved.
//

import UIKit

class CellPulls: UITableViewCell {
    
    private let idPullLabel: UILabel = UILabel()
    private let urlPullLabel: UILabel = UILabel()
    
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
        
        stackView.addArrangedSubview(idPullLabel)
        stackView.addArrangedSubview(urlPullLabel)
        
        sv([stackView])
    }
    
    private func layout() {
        
        stackView.left(5).right(10).bottom(5)
    }
    
    private func setupComponents() {
        idPullLabel.font = UIFont(name: "Arial-Regular", size: 10.0)
        idPullLabel.textAlignment = .left
        idPullLabel.numberOfLines = 0
        idPullLabel.textColor = .black
        
        urlPullLabel.font = UIFont(name: "Arial-Regular", size: 10.0)
        urlPullLabel.textAlignment = .left
        urlPullLabel.numberOfLines = 0
        urlPullLabel.textColor = .black
    }
    
    func setPullId(id : String){
        idPullLabel.text = "ID Pull: \(id)"
    }
    
    func setPullURL(url : String){
        urlPullLabel.text = "URL Pull: \(url)"
    }
}

extension CellPulls {
    class var reusableIdentifier: String {
        return String(describing: self)
    }
}
