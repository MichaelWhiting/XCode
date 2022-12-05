//
//  Workout.swift
//  ExerciseTracker
//
//  Created by Michael Whiting on 12/1/22.
//

import Foundation

struct Workout {
    var name: String
    var description: String
    var time: Int
    var caloriesBurned: Int?
    var exercises: [Exercise]
}
