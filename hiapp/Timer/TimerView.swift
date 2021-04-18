//
//  TimerView.swift
//  hiapp
//
//  Created by Mathew Chanda on 4/17/21.
//

import SwiftUI

struct TimerView: View {
    @State var time :Int
    @ObservedObject var userTime = UserTime()
    var body: some View {
        Text("\(format(duration: userTime.currentTime.timeIntervalSince(userTime.startTime)))")
            .font(.largeTitle)
            .fontWeight(.bold)
            
    }
}


func format(duration: TimeInterval) -> String {
    let formatter = DateComponentsFormatter()
    formatter.unitsStyle = .abbreviated
    formatter.zeroFormattingBehavior = .dropAll
    formatter.allowedUnits = [.day, .hour, .minute, .second]
    
    return formatter.string(from: duration)!
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(time:10)
    }
}
