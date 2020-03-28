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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
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

