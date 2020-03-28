//
//  HomeVC.swift
//  ChallengeVOIP
//
//  Created by Ádria Sara Cardoso de Oliveira on 27/03/20.
//  Copyright © 2020 Ádria Cardoso. All rights reserved.
//

import UIKit
import Alamofire

class HomeVC: UIViewController {
    
    var homeView: HomeView = HomeView(frame: .zero)
    var detailRepositoryView: DetailsRepositoriesView = DetailsRepositoriesView(frame: .zero)
    var result = Items()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        homeView.delegate = self
        detailRepositoryView.delegate = self
        
        request()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        request()
    }
    
    func request() {
        
        Alamofire.request("http://api.github.com/search/repositories?q=language:Swift&sort=stars", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseData { (response) in
            
            if let jResult = try? JSONDecoder().decode(ItemsModel.self, from: response.data!) {
                
                self.homeView.setJSONResult(result: jResult)
                self.view.sv(self.homeView)
                
                self.homeView.fillContainer()
            }
        }
    }
}

extension HomeVC: ShowViewDelegate {
    
    func chooseView(full_name: String, index: Int) {
        
        print("http://api.github.com/repos/\(full_name)")
        
        Alamofire.request("http://api.github.com/repos/\(full_name)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseData { (response) in
            
            if let jResult = try? JSONDecoder().decode(Items.self, from: response.data!) {
                
                self.result = jResult
                
                self.detailRepositoryView.setId(id: jResult.id ?? 0)
                self.detailRepositoryView.setFullName(full_name: jResult.full_name ?? "Full Name: ")
                self.detailRepositoryView.setNodeId(node_id: jResult.node_id ?? "URL : ")
                
                self.view.sv(self.detailRepositoryView)
                
                self.detailRepositoryView.fillContainer()
            }
        }
    }
}

extension HomeVC: BackViewDelegate {
    
    func backView() {
        
        detailRepositoryView.removeFromSuperview()
    }
    
    func saveOrDeleteItem(text: String) {
        
        let items = Item(context: PersistenceService.context)

        items.buttonText = text
        
        if text == "Save" {
            
            if let id = result.id {
                
                items.id = Int32(id)
            }
            
            if let full_name = result.full_name {

                items.full_name = String(full_name)
            }
            
            if let node_id = result.node_id {
                
                items.node_id = node_id
            }
            
            PersistenceService.saveContext()
            
        } else {
            
        }
    }
}

