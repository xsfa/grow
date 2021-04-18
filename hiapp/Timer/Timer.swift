import Foundation
import SwiftUI
import Combine

class UserTime: ObservableObject{
    var startTime : Date = Date()
    @Published var currentTime : Date
    var models: [String] = ["stump2.usdz", "stump1.usdz", "deadtree.usdz", "tree3.usdz", "tree2.usdz", "tree5.usdz", "tree1.usdz"]
    
    
    init(){
        currentTime = self.startTime
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {
            timer in
            self.currentTime += 1
            
        }
        
        
    }
}
