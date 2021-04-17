//
//  ContentView.swift
//  hiapp
//
//  Created by Tesfa Shenkute on 4/17/21.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    var timers: [String] = ["10", "15", "25"]
    var body: some View {
        ZStack(alignment: .bottom) {
            ARViewContainer()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 45) {
                    ForEach(0 ..< self.timers.count) {
                        index in
                        Button(action: {
                            print("timer selected\(self.timers[index])")
                        }) {
                            Image(uiImage: UIImage(named: self.timers[index])!)
                            .resizable()
                                .frame(height:80).aspectRatio(1/1,contentMode:.fit)
                        }.buttonStyle(PlainButtonStyle())
                    }
                }
            }
        }
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
