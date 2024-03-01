//
//  ExampleTryView.swift
//
//
//  Created by Leo Cheng on 2024/2/25.
//

import SwiftUI

struct ExampleTryView: View {
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
                Text("More on YOLO :)")
                    .font(.system(size: 50, design: .rounded))
                    .fontWeight(.bold)
                
                HStack {
                    Image(systemName:  "ipad.gen2.landscape")
                        .resizable()
                        .frame(width: 48, height: 40)
                        .padding(.trailing, 10)
                    
                    VStack(alignment: .leading) {
                        Text("So how does it work on my iPad?")
                            .font(.system(size: 36, design: .rounded))
                            .fontWeight(.semibold)
                        
                        Text("Take YOLO as a foreign detective that cannot speak human language as you do. As you may know, your iPad is extremely smart and able to do almost everything, and coincidentally that includes the capability of chatting with YOLO!")
                    }
                }
                .padding(.bottom, 10)
                
                HStack {
                    Image(systemName: "bolt.horizontal.fill")
                        .resizable()
                        .frame(width: 48, height: 25)
                        .padding(.trailing, 10)
                    
                    VStack(alignment: .leading) {
                        Text("Is that all?")
                            .font(.system(size: 36, design: .rounded))
                            .fontWeight(.semibold)
                        
                        Text("As we dive a little bit deeper, we may know that our iPad cooperates with its little assistant-- CoreML, to get the job done.\nCoreML is a tool released by Apple, the manufacturer of iPad, to help us interact with AI models, including YOLO.")
                    }
                }
                .padding(.bottom, 10)
                
                HStack {
                    Image(systemName: "person.wave.2.fill")
                        .resizable()
                        .frame(width: 48, height: 56)
                        .padding(.trailing, 10)
                    
                    VStack(alignment: .leading) {
                        Text("Psst...")
                            .font(.system(size: 36, design: .rounded))
                            .fontWeight(.semibold)
                        
                        Text("Just like us humans, YOLO also has its limits on remembering objects.\nIn this playground, the model used is YOLOv8s, which is released in January 2023 by Ultralyics. The model itself can predict about 80 types of objects and it is waiting for you to discover!")
                    }
                }
                .padding(.bottom, 10)
                
                HStack {
                    Image(systemName: "party.popper.fill")
                        .resizable()
                        .frame(width: 48, height: 40)
                        .padding(.trailing, 10)
                    
                    VStack(alignment: .leading) {
                        Text("Conclusion")
                            .font(.system(size: 36, design: .rounded))
                            .fontWeight(.semibold)
                        
                        Text("That's all, folks! Now why don’t you use some of the photos of yours, and let YOLO perform its magic!")
                    }
                }
                .padding(.bottom, 10)
                
                Spacer()
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            .padding(.leading, 50)
            .padding(.trailing, 30)
        }
    }
}

#Preview {
    ExampleTryView()
}
