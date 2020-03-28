//
//  ItemsRepositories.swift
//  ChallengeVOIP
//
//  Created by Ádria Sara Cardoso de Oliveira on 28/03/20.
//  Copyright © 2020 Ádria Cardoso. All rights reserved.
//

import UIKit

struct Owner: Codable {
    
    var login: String?
    var id: Int?
    var url: String?
    
    private enum CodingKeys: String, CodingKey {
        
        case login = "login"
        case id = "id"
        case url = "url"
    }
    
    init() {
        
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)

        login = try? container.decode(String.self, forKey: .login)
        id = try? container.decode(Int.self, forKey: .id)
        url = try? container.decode(String.self, forKey: .url)
    }
}

class ItemsRepositories: Codable {
    
    var login: String?
    var id: Int?
    var owner: [Owner]?
    
    private enum CodingKeys: String, CodingKey {
        
        case login = "login"
        case id = "id"
        case owner = "owner"
    }
    
    init() {

    }
    
    required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        login = try? container.decode(String.self, forKey: .login)
        id = try? container.decode(Int.self, forKey: .id)
        owner = try? container.decode([Owner].self, forKey: .owner)
    }
}

//var owner: [Owner]?
//
//private enum CodingKeys: String, CodingKey {
//
//    case owner = "owner"
//}
//
//init() {
//
//}
//
//required init(from decoder: Decoder) throws {
//
//    let container = try decoder.container(keyedBy: CodingKeys.self)
//
//    owner = try? container.decode([Owner].self, forKey: .owner)
//}
