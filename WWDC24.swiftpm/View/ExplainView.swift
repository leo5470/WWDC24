//
//  ExplainView.swift
//
//
//  Created by Leo Cheng on 2024/2/25.
//

import SwiftUI

struct ExplainView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            if(colorScheme == .light) {
                LinearGradient(colors: [Color("LightGrad1"), Color("LightGrad2")], startPoint: .trailing, endPoint: .leading)
                    .ignoresSafeArea()
            } else {
                LinearGradient(colors: [Color("DarkGrad2"), Color("DarkGrad1")], startPoint: .trailing, endPoint: .leading)
                    .ignoresSafeArea()
            }
            
            VStack(alignment: .leading) {
                Text("So you might be wondering...")
                    .font(.system(size: 50, design: .rounded))
                    .fontWeight(.bold)
                
                Text("how does it work actually?")
                    .fontWeight(.semibold)
                    .font(.system(size: 24, design: .rounded))
                
                HStack {
                    Image(systemName:  "figure.strengthtraining.traditional")
                        .resizable()
                        .frame(width: 48, height: 48)
                        .padding(.trailing, 10)
                    
                    VStack(alignment: .leading) {
                        Text("Training")
                            .font(.system(size: 36, design: .rounded))
                            .fontWeight(.semibold)
                        
                        Text("First, YOLO is shown thousands of pictures, just like how you learn things by seeing them. But instead of your brain, it uses a special program to remember what different objects look like in different situations.")
                    }
                }
                .padding(.bottom, 10)
                
                HStack {
                    Image(systemName: "eyes")
                        .resizable()
                        .frame(width: 48, height: 40)
                        .padding(.trailing, 10)
                    
                    VStack(alignment: .leading) {
                        Text("Looking for Clues")
                            .font(.system(size: 36, design: .rounded))
                            .fontWeight(.semibold)
                        
                        Text("When you show YOLO a new picture, it's like giving it a puzzle. It breaks the picture down into tiny squares, like a detective searching for clues.")
                    }
                }
                .padding(.bottom, 10)
                
                HStack {
                    Image(systemName: "lightbulb.max.fill")
                        .resizable()
                        .frame(width: 48, height: 56)
                        .padding(.trailing, 10)
                    
                    VStack(alignment: .leading) {
                        Text("Making Predictions")
                            .font(.system(size: 36, design: .rounded))
                            .fontWeight(.semibold)
                        
                        Text("For each square, YOLO asks itself, \"What am I most likely seeing here?\" based on all the pictures it saw before. It doesn't just guess one thing, but gives a few possibilities like \"car,\" \"person,\" or \"dog,\" along with how sure it is about each guess.")
                    }
                }
                .padding(.bottom, 10)
                
                HStack {
                    Image(systemName: "brain.fill")
                        .resizable()
                        .frame(width: 48, height: 40)
                        .padding(.trailing, 10)
                    
                    VStack(alignment: .leading) {
                        Text("But exactly how?")
                            .font(.system(size: 36, design: .rounded))
                            .fontWeight(.semibold)
                        
                        Text("That's where the magic happens! It uses something called a \"neural network,\" which is like a super-complex web of connections inspired by the human brain. This web helps YOLO learn patterns and relationships between things in the pictures, allowing it to make increasingly accurate guesses.")
                    }
                }
                .padding(.bottom, 10)
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    NavigationLink(value: BasicDestinations.tryingOut) {
                        Text("Next >")
                        .font(.system(size: 20, design: .rounded))
                        .fontWeight(.semibold)
                        .padding()
                        .frame(height: 50)
                        .foregroundStyle(.white)
                        .background(Color("DarkGrad1"))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                .padding(.bottom, 30)
                .padding(.trailing, 20)
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            .padding(.leading, 50)
            .padding(.trailing, 30)
        }
    }
}

#Preview {
    ExplainView()
}
