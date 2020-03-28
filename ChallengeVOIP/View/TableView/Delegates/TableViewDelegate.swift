//
//  TableViewDelegate.swift
//  ChallengeVOIP
//
//  Created by Ádria Sara Cardoso de Oliveira on 27/03/20.
//  Copyright © 2020 Ádria Cardoso. All rights reserved.
//

import UIKit

extension HomeView: UITableViewDelegate {
    
}

extension HomeView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let result2 = result()

        return result2.items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reusableIdentifier, for: indexPath) as? TableViewCell else { return UITableViewCell() }
        
        let result2 = result().items?[indexPath.row]
        
        if let id = result2?.id {
            
            cell.setItemId(id: id)
        }
        
        if let node_id = result2?.node_id {
            
            cell.setItemNodeID(node_id: node_id)
        }
        
        if let full_name = result2?.full_name {
            
            cell.setItemFullName(fullName: full_name)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }
}
