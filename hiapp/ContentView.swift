//
//  ContentView.swift
//  hiapp
//
//  Created by Tesfa Shenkute on 4/17/21.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    
    var models: [String] = ["stump2.usdz", "stump1.usdz", "deadtree.usdz", "tree3.usdz", "tree2.usdz", "tree5.usdz", "tree1.usdz"]
    
    var timers: [String] = ["10", "15", "25"]
    @State var TimerAppear : Bool = false
    @State var SelectedIndex : Int = -1;
    
    
    var body: some View {
        VStack(spacing: 60) {
            if TimerAppear == true {
                TimerView(time: SelectedIndex)
            }
            
            ZStack(alignment: .bottom) {
                ARViewContainer()
               
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 45) {
                        
                        ForEach(0 ..< self.timers.count) {
                            index in
                            Button(action: {
                                print("timer selected\(self.timers[index])")
                                if self.timers[index] == "10" {
                                    SelectedIndex = 10
                                } else if self.timers[index] == "15" {
                                    SelectedIndex = 15
                                } else if self.timers[index] == "25" {
                                    SelectedIndex = 25
                                }
                                TimerAppear = true
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
    
   
}

func TimerMaker() {
    Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
           //     self.value += 1
    }
}

func TimeListener(countdown :Int) {
    
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
