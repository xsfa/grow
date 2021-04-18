//
//  ContentView.swift
//  hiapp
//
//  Created by Tesfa Shenkute on 4/17/21.
//

import SwiftUI
import RealityKit
import ARKit

var SelectedIndex : Int = -1

struct ContentView : View {
    
    var models: [String] = ["stump2.usdz", "stump1.usdz", "deadtree.usdz", "tree3.usdz", "tree2.usdz", "tree5.usdz", "tree1.usdz"]
    
    var timers: [String] = ["10", "15", "25","45","60","120","180"]
    @State var TimerAppear : Bool = false
    
    @State var selectedModel : String?
    @ObservedObject var userTime : UserTime = UserTime()
    
    var body: some View {
        VStack(spacing: 35) {
            if TimerAppear == true {
                TimerView(time: SelectedIndex, userTime: userTime)
                    
            }
            
            else{
                Text("Welcome to Grow.io!")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(.largeTitle)
                Spacer()
            }
            
            ZStack() {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 28) {
                        ForEach(0 ..< self.timers.count) {
                            index in
                            Button(action: {
                                print("timer selected\(self.timers[index])")
                                self.selectedModel = self.models[0]
                                
                                if self.timers[index] == "10" {
                                    SelectedIndex = 10
                                } else if self.timers[index] == "15" {
                                    SelectedIndex = 15
                                } else if self.timers[index] == "25" {
                                    SelectedIndex = 25
                                }
                                else if self.timers[index] == "45" {
                                    SelectedIndex = 45
                                }
                                else if self.timers[index] == "60" {
                                    SelectedIndex = 60
                                }
                                else if self.timers[index] == "120" {
                                    SelectedIndex = 120
                                }
                                else if self.timers[index] == "180" {
                                    SelectedIndex = 180
                                }
                                TimerAppear = true
                                userTime.duration = SelectedIndex 
                                userTime.start()
                            }) {
                                Image(uiImage: UIImage(named: self.timers[index])!)
                                    .resizable()
                                    .frame(height:80)
                                    .aspectRatio(1/1,contentMode:.fit)
                            }.buttonStyle(PlainButtonStyle())
                        }.padding(4)
                    }
                }
            }
        }
        
    }
    
    func resetPlacement() {
        self.selectedModel = nil
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
     var selectedModel : String?
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 1/3))
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal]
        config.environmentTexturing = .automatic
        
        if
            ARWorldTrackingConfiguration
                .supportsSceneReconstruction(.mesh) {
            config.sceneReconstruction = .mesh
        }
        
        arView.session.run(config)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        if let modelName = self.selectedModel {
            print("Adding model\(modelName)")
            
            let modelEntity = try!
                ModelEntity.loadModel(named:modelName)
            
            let anchorEnity = AnchorEntity(plane: .any)
            anchorEnity.addChild(modelEntity)
            
            uiView.scene.addAnchor(anchorEnity)
        }
    }
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
