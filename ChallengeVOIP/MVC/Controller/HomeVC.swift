//
//  HomeVC.swift
//  ChallengeVOIP
//
//  Created by Ádria Sara Cardoso de Oliveira on 27/03/20.
//  Copyright © 2020 Ádria Cardoso. All rights reserved.
//

import UIKit
import Alamofire
import CoreData

class HomeVC: UIViewController {
    
    var homeView: HomeView = HomeView(frame: .zero)
    var detailRepositoryView: DetailsRepositoriesView = DetailsRepositoriesView(frame: .zero)
    var result = Items()
    var fullName = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        homeView.delegate = self
        detailRepositoryView.delegate = self
        
        let fetchRequest: NSFetchRequest<Item> = Item.fetchRequest()
        
        do {
            
            let item = try PersistenceService.context.fetch(fetchRequest)
            self.homeView.saveItem(item: item)
            
        } catch {
            print("Error")
        }
        
        request()
    }
    
    func request() {
        
        appDelegate.dataRequest = Alamofire.request("http://api.github.com/search/repositories?q=language:Swift&sort=stars", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseData { (response) in
            
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
        
        appDelegate.dataRequest = Alamofire.request("http://api.github.com/repos/\(full_name)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseData { (response) in

            if let jResult = try? JSONDecoder().decode(Items.self, from: response.data!) {

                self.result = jResult
                self.fullName = full_name

                self.detailRepositoryView.setId(id: jResult.id ?? "ID: ")
                self.detailRepositoryView.setFullName(full_name: jResult.full_name ?? "Full Name: ")
                self.detailRepositoryView.setNodeId(node_id: jResult.node_id ?? "URL : ")

                self.view.sv(self.detailRepositoryView)
                self.detailRepositoryView.fillContainer()
                
                if self.homeView.resultItems().count > 0 {

                    for i in 0..<self.homeView.resultItems().count {
                        
                        if full_name == self.homeView.resultItems()[i].full_name {
                            
                            self.detailRepositoryView.setButtonTitle(title: "Delete")
                            return
                            
                        } else {
                            
                            self.detailRepositoryView.setButtonTitle(title: "Save")
                        }
                    }
                } else {
                    
                    self.detailRepositoryView.setButtonTitle(title: "Save")
                }
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
        
        if text == "Save" {

            self.detailRepositoryView.setButtonTitle(title: "Delete")
            items.buttonText = "Delete"

            if let id = result.id {

                items.id = id
            }

            if let full_name = result.full_name {

                items.full_name = String(full_name)
            }

            if let node_id = result.node_id {

                items.node_id = node_id
            }

            PersistenceService.saveContext()
            self.homeView.appendItemsTB(item: items)
            
        } else {
            
            for i in 0..<homeView.itemsResult.count {
            
                if homeView.itemsResult[i].full_name == fullName {

                    PersistenceService.context.delete(homeView.itemsResult[i])
                    self.homeView.deleteItemsTB(index: i)

                    do {
                        try PersistenceService.context.save()
                        
                    } catch let error as NSError {
                        print("Error While Deleting Note: \(error.userInfo)")
                    }
                    
                    PersistenceService.saveContext()
                    self.detailRepositoryView.setButtonTitle(title: "Save")
                    
                    return
                }
            }
        }
    }
}

