//
//  WelcomeView.swift
//  WWDC24
//
//  Created by Leo Cheng on 2024/2/14.
//

import SwiftUI

struct WelcomeView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @Binding var isShowingSheet: Bool
    
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Welcome to IntroYOLO!")
                .font(.system(size: 54, design: .rounded))
                .fontWeight(.bold)
            
            Spacer()
                .frame(height: 20)
            
            Text("This is a playground for exploring the magic of YOLO, \na powerful model for image classification. Let's get started!")
                .font(.system(size: 18, design: .rounded))
                .multilineTextAlignment(.center)
                
            
            Spacer()
                .frame(height: 100)
            
            HStack {
                Spacer()
                    .frame(width: 30)
                
                Image(systemName: "lightbulb")
                    .resizable()
                    .frame(width: 30, height: 45)
                    .foregroundStyle(Color.accentColor)
                
                Spacer()
                    .frame(width: 35)
                
                VStack(alignment: .leading) {
                    Text("Basics")
                        .font(.system(size: 30, design: .rounded))
                        .fontWeight(.semibold)
                    
                    if(colorScheme == .dark) {
                        Text("A little sneak peek to YOLO.")
                            .font(.system(size: 16, design: .rounded))
                            .foregroundStyle(Color.white.opacity(0.55))
                    } else {
                        Text("A little sneak peek to YOLO.")
                            .font(.system(size: 16, design: .rounded))
                            .foregroundStyle(Color.black.opacity(0.55))
                    }
                }
            }
            .frame(height: 60)
            
            Spacer()
                .frame(height: 40)
            
            HStack {
                Image(systemName: "camera")
                    .resizable()
                    .frame(width: 48, height: 40)
                    .foregroundStyle(Color.accentColor)
                
                Spacer()
                    .frame(width: 29)
                
                VStack(alignment: .leading) {
                    Text("Try")
                        .font(.system(size: 30, design: .rounded))
                        .fontWeight(.semibold)
                    
                    if(colorScheme == .dark) {
                        Text("Try out YOLO by yourself.")
                            .font(.system(size: 16, design: .rounded))
                            .foregroundStyle(Color.white.opacity(0.55))
                    } else {
                        Text("Try out YOLO by yourself.")
                            .font(.system(size: 16, design: .rounded))
                            .foregroundStyle(Color.black.opacity(0.55))
                    }
                }
            }
            .frame(height: 50)
            
            Spacer()
            
            Button(action: {
                isShowingSheet = false
            }) {
                Text("Continue")
                    .font(.system(size: 20, design: .rounded))
                    .fontWeight(.semibold)
                    .frame(width: 350, height: 50)
                    .foregroundStyle(.white)
                    .background(Color.accentColor)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 12)
                )
            }
        }
        .padding(.vertical, 80)
    }
}

#Preview {
    WelcomeView(isShowingSheet: .constant(true))
}
