//
//  TryView.swift
//
//
//  Created by Leo Cheng on 2024/2/14.
//

import SwiftUI

struct BasicView: View {
    @State private var sheetItem: ExampleModel?
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationStack {
            ZStack {
                if(colorScheme == .light) {
                    LinearGradient(colors: [Color("LightGrad1"), Color("LightGrad2")], startPoint: .trailing, endPoint: .leading)
                        .ignoresSafeArea()
                } else {
                    LinearGradient(colors: [Color("DarkGrad2"), Color("DarkGrad1")], startPoint: .trailing, endPoint: .leading)
                        .ignoresSafeArea()
                }
                
                VStack (alignment: .leading) {
                    Text("What is YOLO?")
                        .font(.system(size: 50, design: .rounded))
                        .fontWeight(.bold)
                    
                    Spacer()
                        .frame(height: 10)
                    
                    Text("YOLO stands for \"You Only Look Once\". \nIt is like a superpowered AI assistant that helps you spotting different objects!")
                        .font(.system(size: 24, design: .rounded))
                        .padding(.bottom, 25)

                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(getExamples()) {
                                example in
                                VStack(alignment: .center) {
                                    Image(example.imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 300)
                                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                                        
                                    
                                    Text(example.description)
                                        .padding(.bottom, 10)
                                }
                                .background(
                                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                        .inset(by: 0.5)
                                        .foregroundColor(colorScheme == .light ? .white.opacity(0.8) : .black.opacity(0.3))
                                        .shadow(color: .black.opacity(0.5), radius: 2, x: 0, y: 2)
                                        .shadow(color: .black.opacity(0.2), radius: 1.5, x: 0, y: 0)
                                )
                                .onTapGesture {
                                    sheetItem = example
                                }
                                .padding(.trailing, 30)
                            }
                            .sheet(item: $sheetItem) { item in
                                ExampleImageView(exampleModel: item)
                            }
                        }
                    }
                    .padding(.bottom, 20)
                    
                    Text("Click on one of the photos above to try it out!")
                        .font(.system(size: 24, design: .rounded))
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        NavigationLink(value: BasicDestinations.explain) {
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
            }
            .navigationDestination(for: BasicDestinations.self) {
                basicDest in switch basicDest{
                case .base:
                    BasicView()
                case .explain:
                    ExplainView()
                case .tryingOut:
                    ExampleTryView()
                }
            }
        }
    }
}

#Preview {
    BasicView()
}
