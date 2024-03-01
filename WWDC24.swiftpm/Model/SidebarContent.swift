//
//  File.swift
//  
//
//  Created by Leo Cheng on 2024/2/14.
//

import Foundation
import SwiftUI

struct SidebarContent: Hashable, Identifiable {
    var id: Int
    var name: String
    var image: Image
    
    static func == (lhs: SidebarContent, rhs: SidebarContent) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(name)
    }
}

func getSidebarContents() -> [SidebarContent] {
    let basics: SidebarContent = SidebarContent(id: 0, name: "Basics", image: Image(systemName: "lightbulb"))
    let tryYOLO: SidebarContent = SidebarContent(id: 1, name: "Try", image: Image(systemName: "camera"))
    let arr = [basics, tryYOLO]
    
    return arr
}
