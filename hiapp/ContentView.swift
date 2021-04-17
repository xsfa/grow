//
//  ContentView.swift
//  hiapp
//
//  Created by Tesfa Shenkute on 4/17/21.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    var models: [String] = ["newtree", "mediumtree", "largetree"]
    var body: some View {
        ARViewContainer()
        Text("Hello")
        Text("It's a great day to grow")
        
    }
    
   
}

func TimerMaker() {
    Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
           //     self.value += 1
    }
}


struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
