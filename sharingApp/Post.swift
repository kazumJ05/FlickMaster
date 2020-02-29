//
//  Post.swift
//  sharingApp
//
//  Created by 大原一倫 on 2020/01/19.
//  Copyright © 2020 oharakazumasa. All rights reserved.
//

import Foundation
import Firebase


struct Post: Comparable {
    
    static func < (lhs: Post, rhs: Post) -> Bool {
        return lhs.content1 < rhs.content1
    }
    
    
    let content: String
    let content1: String
    let contentName: String
    
    init(data: [String: Any], score: [String: Any], dataName: String) {
        content = data["name"] as! String
        content1 = score["score"] as! String
        contentName = dataName
    }
    
}

