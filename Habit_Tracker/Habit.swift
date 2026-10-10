import Foundation
import SwiftData

@Model
class Habit{
    var name:String
    var timesCompleted: Int
    
    init(name: String, timesCompleted: Int=0){
        self.name = name
        self.timesCompleted = timesCompleted
    }
}
