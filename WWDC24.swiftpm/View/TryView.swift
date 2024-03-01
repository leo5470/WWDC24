//
//  TryView.swift
//
//
//  Created by Leo Cheng on 2024/2/14.
//

import SwiftUI
import PhotosUI

struct TryView: View {
    @State private var selectedItem: PhotosPickerItem?
    @State private var selectedPhotoData: Data?
    @State private var selectedImage: Image?
    @State private var isShowingAlert: Bool = false
    @State private var isRunning: Bool = false
    @State private var prediction: String?
    @State private var factor: CGFloat = 1
    
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
                Text("Try with your own photo!")
                    .font(.system(size: 50, design: .rounded))
                    .fontWeight(.bold)
                
                Text("Select one of your photos and see what YOLO has got!")
                    .fontWeight(.semibold)
                
                
                VStack (alignment: .leading){
                    if (prediction == nil) {
                        PhotosPicker(selection: $selectedItem, matching:  .images) {
                            if(selectedImage == nil) {
                                HStack {
                                    Image(systemName: "photo.badge.plus")
                                    
                                    Text("Select a photo here!")
                                        .font(.system(size: 20, design: .rounded))
                                    .fontWeight(.semibold)
                                }
                                .padding()
                                .frame(height: 50)
                                .foregroundStyle(.white)
                                .background(Color("DarkGrad1"))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            } else {
                                HStack {
                                    Image(systemName: "photo.on.rectangle.angled")
                                    
                                    Text("Change of mind? Select another photo!")
                                        .font(.system(size: 20, design: .rounded))
                                    .fontWeight(.semibold)
                                }
                                .padding()
                                .frame(height: 50)
                                .foregroundStyle(.white)
                                .background(Color("DarkGrad1"))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                    }
                    
                    selectedImage?
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(factor)
                        .animation(.easeIn, value: factor)
                        .frame(height: 450)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                        .padding(.vertical, 10)
                    
                    if (prediction == nil) {
                        Text("Make sure that the object you want YOLO to recognize is placed right in the middle of the photo!")
                            .fontWeight(.semibold)
                        Text("This way, YOLO can be a little more concentrated on the object itself!")
                            .fontWeight(.semibold)
                    } else {
                        Text(prediction!)
                            .font(.system(size: 20, design: .rounded))
                            .fontWeight(.semibold)
                    }
                }
                .onChange(of: selectedItem) {
                    item in Task {
                        if (selectedItem != nil){
                            if let loadedImage = try? await item?.loadTransferable(type: Image.self) {
                                selectedImage = loadedImage
                            } else {
                                isShowingAlert = true
                                selectedItem = nil
                            }
                            
                            if let loadedData = try? await item?.loadTransferable(type: Data.self) {
                                selectedPhotoData = loadedData
                            } else {
                                isShowingAlert = true
                                selectedItem = nil
                            }
                        }
                    }
                }
                .alert("Uh Oh.", isPresented: $isShowingAlert) {
                    Button("Okay", role: .cancel, action: {})
                } message: {
                    Text("The photo you selected cannot be used, please rechoose one!")
                }
//                .background(colorScheme == .light ? .white.opacity(0.8) : .black.opacity(0.3))
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    if (prediction == nil) {
                        Button(action: {
                            isRunning = true
                            Task {
                                factor -= 0.3
                                do {
                                    guard let uiImage = UIImage(data: selectedPhotoData!) else {
                                        print("Nil occurred on getting UIImage from Data.")
                                        throw Errors.GeneralNilError
                                    }
                                    
                                    guard let predResult = try predictor.predict(uiImage: uiImage) else {
                                        print("Nil occurred on predict().")
                                        throw Errors.GeneralNilError
                                    }
                                    
                                    prediction = "YOLO guesses the object is a kind of \(predResult.type), \nand it has a \(predResult.confidence)% confidence!"
                                } catch  {
                                    print("An error occurred: \(error)")
                                    selectedItem = nil
                                    selectedImage = nil
                                    selectedPhotoData = nil
                                    prediction = nil
                                    isShowingAlert = true
                                }
                            }
                            factor += 0.3
                            isRunning = false
                        }) {
                            Text("Start 🏁")
                                .font(.system(size: 20, design: .rounded))
                                .fontWeight(.semibold)
                        }
                        .disabled(selectedPhotoData == nil)
                        .padding()
                        .frame(height: 50)
                        .foregroundStyle(.white)
                        .background(selectedPhotoData != nil ? Color("DarkGrad1") : .gray.opacity(0.8))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    } else {
                        Button(action: {
                            selectedItem = nil
                            selectedImage = nil
                            selectedPhotoData = nil
                            prediction = nil
                        }) {
                            Text("Restart 🔁")
                                .font(.system(size: 20, design: .rounded))
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .frame(height: 50)
                        .foregroundStyle(.white)
                        .background(Color("DarkGrad1"))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                .alert("Uh Oh.", isPresented: $isShowingAlert) {
                    Button("Okay", role: .cancel, action: {})
                } message: {
                    Text("Something went wrong, please try again!\nIf retrying doesn't work, change a photo instead!")
                }
                .padding(.bottom, 30)
                .padding(.trailing, 20)
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            .padding(.leading, 50)
        }
    }
}

#Preview {
    TryView()
}
