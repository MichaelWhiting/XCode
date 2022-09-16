/*:
## App Exercise - Workout Functions
 
 >These exercises reinforce Swift concepts in the context of a fitness tracking app.
 
 A `RunningWorkout` struct has been created for you below. Add a method on `RunningWorkout` called `postWorkoutStats` that prints out the details of the run. Then create an instance of `RunningWorkout` and call `postWorkoutStats()`.
 */
import Foundation

struct RunningWorkout {
    var distance: Double
    var time: Double
    var elevation: Double
    
    init(distance: Double, time: Double, elevation: Double) {
        self.distance = distance
        self.time = time
        self.elevation = elevation
    }
    
    func postWorkoutStats() {
        print("Distance: \(distance), Time: \(time), Elevation: \(elevation)")
    }
}

var showStats = RunningWorkout(distance: 1200, time: 180, elevation: 1000)

showStats.postWorkoutStats()
//:  A `Steps` struct has been created for you below, representing the day's step-tracking data. It has the goal number of steps for the day and the number of steps taken so far. Create a method on `Steps` called `takeStep` that increments the value of `steps` by one. Then create an instance of `Steps` and call `takeStep()`. Print the value of the instance's `steps` property before and after the method call.

struct Steps {
    var steps: Int
    var goal: Int
    
    init(steps: Int, goal: Int) {
        self.steps = steps
        self.goal = goal
    }

    mutating func takeStep() {
        steps += 1
    }
}

var step = Steps(steps: 1000, goal: 2000)
print(step.steps)
step.takeStep()
print(step.steps)
/*:
[Previous](@previous)  |  page 6 of 10  |  [Next: Exercise - Computed Properties and Property Observers](@next)
 */
