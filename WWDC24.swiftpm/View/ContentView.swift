import SwiftUI

struct ContentView: View {
    @State private var selection: String? = "Basics"
    @State private var functions: [SidebarContent] = getSidebarContents()
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationSplitView(sidebar: {
            List(selection: $selection) {
                ForEach(functions) { function in
                    NavigationLink(value: function.name) {
                        SidebarView(sidebarContent: function)
                        Spacer()
                            .frame(height: 40)
                    }
                }
            }
            .scrollContentBackground(.hidden)
            .background(Color(colorScheme == .light ? "LightGrad2" : "DarkGrad1"))
            .navigationTitle("IntroYOLO")
    }, detail: {
            switch selection {
            case "Basics":
                BasicView()
            case "Try":
                TryView()
            default:
                Text("Please select a function.")
            }
        })  
        .tint(colorScheme == .light ? .accentColor : Color("LightGrad1"))
            
        }
}
