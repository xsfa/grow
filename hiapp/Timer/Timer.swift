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
    var step = (self.duration * 60) / 7
    var curr = 1
    var counter = 0
    
    Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] timer in
        self.currentTime += 1
        counter += 1
        if counter > (step * curr) {
            print(curr)
            print(self.duration)
            curr += 1
            self.model = self.models[min(curr - 1, self.models.count - 1)]
        }
            
            print(model)
        }
    }
}
