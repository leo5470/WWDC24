import SwiftUI

var predictor: Predictor = Predictor()

@main
struct MyApp: App {
    @AppStorage("firstLaunch") var firstLaunch: Bool = true
    @State private var isShowingSheet = true
    
    var body: some Scene {
        WindowGroup {
            if(firstLaunch){
                ContentView()
                    .sheet(isPresented: $isShowingSheet, onDismiss: {
                        firstLaunch = false
                    }) {
                            WelcomeView(isShowingSheet: $isShowingSheet)
                        }
            } else {
                ContentView()
            }
        }
        .environment(\.font, Font.system(size: 14, design: .rounded))
    }
}
