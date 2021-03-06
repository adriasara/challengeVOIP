//
//  TableViewDelegate.swift
//  ChallengeVOIP
//
//  Created by Ádria Sara Cardoso de Oliveira on 27/03/20.
//  Copyright © 2020 Ádria Cardoso. All rights reserved.
//

import UIKit

protocol ShowViewDelegate {
    func chooseView(id: String, full_name: String, index: Int)
}

extension HomeView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        let result2 = setItemsResult()
        
        if tableView.tag == 1 {
            
            self.delegate?.chooseView(id: result2.items?[indexPath.row].id ?? "", full_name: result2.items?[indexPath.row].full_name ?? "", index: indexPath.row)
        }
    }
}

extension HomeView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView.tag == 1 {

            let result2 = setItemsResult()
            
            return result2.items?.count ?? 0
            
        } else if tableView.tag == 2 {
            
            return itemsResult.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView.tag == 1 {

            guard let cell = tableView.dequeueReusableCell(withIdentifier: CellRepositories.reusableIdentifier, for: indexPath) as? CellRepositories else { return UITableViewCell() }
            
            let result2 = setItemsResult().items?[indexPath.row]
            
            cell.backgroundColor = .white
            
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
        } else if tableView.tag == 2 {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CellItems.reusableIdentifier, for: indexPath) as? CellItems else { return UITableViewCell() }
            
            cell.backgroundColor = .white
            
            if let id = itemsResult[indexPath.row].id {
                cell.setItemId(id: id)
            }
            
             if let node_id = itemsResult[indexPath.row].node_id {
                cell.setItemNodeID(node_id: node_id)
             }

             if let full_name = itemsResult[indexPath.row].full_name {
                 cell.setItemFullName(fullName: full_name)
             }
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }
}

extension DetailsRepositoriesView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return pullResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellPulls.reusableIdentifier, for: indexPath) as? CellPulls else { return UITableViewCell() }

        cell.backgroundColor = .white
        
        let result = pullResult[indexPath.row]

        if let id = result.id {
            cell.setPullId(id: id)
        }

        if let url = result.url {
            cell.setPullURL(url: url)
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }
}

extension DetailsRepositoriesView: UITableViewDelegate {
    
}
