//
//  PullsModel.swift
//  ChallengeVOIP
//
//  Created by Ádria Sara Cardoso de Oliveira on 30/03/20.
//  Copyright © 2020 Ádria Cardoso. All rights reserved.
//

import UIKit

class PullsModel: Codable {
    
    var id: String?
    var url: String?
    
    private enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case url = "url"
    }
    
    init() {

    }
    
    required init(from decoder: Decoder) throws {
    
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let value = try? container.decode(Int.self, forKey: .id) {
            id = String(value)
        } else {
            id = try? container.decode(String.self, forKey: .id)
        }
        
        url = try? container.decode(String.self, forKey: .url)
    }
}
