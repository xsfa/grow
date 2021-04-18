import Foundation
import SwiftUI
import Combine

class UserTime: ObservableObject{
    var startTime : Date = Date()
    @Published var currentTime : Date
    var models: [String] = ["stump2.usdz", "stump1.usdz", "deadtree1.usdz", "tree3.usdz", "tree2.usdz", "tree5.usdz", "tree1.usdz"]
    @Published var duration : Int
    @Published var model : String
    init(){
        self.currentTime = self.startTime
        self.duration = 0
        self.model = "stump2.usdz"
    }
    
    
   func start(){
    Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] timer in
            self.currentTime += 1
            if(self.duration * 60 / 7 >= 7){
                model = self.models[6];
            }
            
            else{
                model = self.models[self.duration*60/7];
            }
            print(model)
        }
    }
}
