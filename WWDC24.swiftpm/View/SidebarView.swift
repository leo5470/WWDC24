//
//  SidebarView.swift
//
//
//  Created by Leo Cheng on 2024/2/14.
//

import SwiftUI

struct SidebarView: View {
    let sidebarContent: SidebarContent
    
    var body: some View {
        HStack {
            sidebarContent.image
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
            
            Spacer()
                .frame(width: 20)
            
            Text(sidebarContent.name)
                .font(.system(size: 24, design: .rounded))
        }
        .frame(height: 35)
    }
}

#Preview {
    SidebarView(sidebarContent: SidebarContent(id: 0, name: "Basics", image: Image(systemName: "lightbulb.fill")))
}
