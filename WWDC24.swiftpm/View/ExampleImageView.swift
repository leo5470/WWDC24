//
//  ExampleImageView.swift
//
//
//  Created by Leo Cheng on 2024/2/17.
//

import SwiftUI

struct ExampleImageView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @State private var isRunning: Bool = false
    @State private var isShowingAlert: Bool = false
    @State private var prediction: String?
    @State private var factor: CGFloat = 1
    
    var exampleModel: ExampleModel
    
    
    var body: some View {
        ZStack {
            if(colorScheme == .light) {
                LinearGradient(colors: [Color("LightGrad1"), Color("LightGrad2")], startPoint: .trailing, endPoint: .leading)
                    .ignoresSafeArea()
            } else {
                LinearGradient(colors: [Color("DarkGrad2"), Color("DarkGrad1")], startPoint: .trailing, endPoint: .leading)
                    .ignoresSafeArea()
            }
            
            VStack {
                Image(exampleModel.imageName)
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(factor)
                    .animation(.easeIn, value: factor)
                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                    .padding(.bottom, 0)
                    .padding(.horizontal, 100)
                
                
                if(prediction == nil) {
                    VStack {
                        Text("Click \"Start\" to run YOLO!")
                            .font(.system(size: 20, design: .rounded))
                        
                        Button(action: {
                            isRunning = true
                            Task {
                                factor -= 0.2
                                do {
                                    guard let uiImage = UIImage(named: exampleModel.imageName) else {
                                        print("Nil occurred on getting UIImage from file name.")
                                        throw Errors.GeneralNilError
                                    }
                                    
                                    guard let predResult = try predictor.predict(uiImage: uiImage) else {
                                        print("Nil occurred on predict().")
                                        throw Errors.GeneralNilError
                                    }
                                    
                                    prediction = "YOLO guesses the object is a kind of \(predResult.type), \nand it has a \(predResult.confidence)% confidence!"
                                } catch  {
                                    print("An error occurred, \(error)")
                                    isShowingAlert = true
                                }
                            }
                            factor += 0.2
                            isRunning = false
                        }) {
                            if(isRunning) {
                                Text("Running")
                            } else {
                                Text("Start 🏁")
                                    .fontWeight(.semibold)
                            }
                        }
                        .disabled(isRunning)
                        .frame(width: 400, height: 50)
                        .foregroundStyle(.white)
                        .background(Color("DarkGrad1"))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.bottom, 40)
                    .padding(.horizontal, 50)
                    }
                } else {
                    Text(prediction!)
                        .font(.system(size: 20, design: .rounded))
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 80)
                }
                
                Spacer()
            }
            .alert("Uh Oh.", isPresented: $isShowingAlert) {
                Button("Okay", role: .cancel, action: {})
            } message: {
                Text("Something went wrong, please try again!")
            }
        }
    }
}

#Preview {
    ExampleImageView(exampleModel: ExampleModel(description: "Hi", imageName:  "lufthansa"))
}
