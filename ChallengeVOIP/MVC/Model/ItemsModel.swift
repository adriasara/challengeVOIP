//
//  ItemsModel.swift
//  ChallengeVOIP
//
//  Created by Ádria Sara Cardoso de Oliveira on 28/03/20.
//  Copyright © 2020 Ádria Cardoso. All rights reserved.
//

import UIKit

struct Items: Codable {

    var id: String?
    var node_id: String?
    var name: String?
    var full_name: String?
    
    private enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case node_id = "node_id"
        case name = "name"
        case full_name = "full_name"
    }
    
    init() {
        
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)

        if let value = try? container.decode(Int.self, forKey: .id) {
            id = String(value)
        } else {
            id = try? container.decode(String.self, forKey: .id)
        }
        
        node_id = try? container.decode(String.self, forKey: .node_id)
        name = try? container.decode(String.self, forKey: .name)
        full_name = try? container.decode(String.self, forKey: .full_name)
    }
}

class ItemsModel: Codable {
    
    var total_count: Int?
    var incomplete_results: Bool?
    var items: [Items]?
    var forks: Int?
    var open_issues: Int?
    var watchers: Int?
    var default_branch: String?
    var score: Double?
    
    private enum CodingKeys: String, CodingKey {
        
        case total_count = "total_count"
        case incomplete_results = "incomplete_results"
        case items = "items"
        case forks = "forks"
        case open_issues = "open_issues"
        case watchers = "watchers"
        case default_branch = "default_branch"
        case score = "score"
    }
    
    init() {

    }
    
    required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        total_count = try? container.decode(Int.self, forKey: .total_count)
        incomplete_results = try? container.decode(Bool.self, forKey: .incomplete_results)
        items = try? container.decode([Items].self, forKey: .items)
        forks = try? container.decode(Int.self, forKey: .forks)
        open_issues = try? container.decode(Int.self, forKey: .open_issues)
        watchers = try? container.decode(Int.self, forKey: .watchers)
        default_branch = try? container.decode(String.self, forKey: .default_branch)
        score = try? container.decode(Double.self, forKey: .score)
    }
}

