import Foundation
import SwiftUI
import Combine

class UserTime: ObservableObject{
    var startTime : Date = Date()
    @Published var currentTime : Date
    
    init(){
        currentTime = self.startTime
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {
            timer in
            self.currentTime += 1
            //self.differenceTime = self.currentTime.timeIntervalSince(self.startTime)
        }
    }
}
