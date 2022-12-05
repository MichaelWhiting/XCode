//
//  HomeTableViewController.swift
//  ExerciseTracker
//
//  Created by Michael Whiting on 12/1/22.
//

import UIKit

class HomeTableViewController: UITableViewController {

    var workouts: [Workout] = [Workout(name: "Workout 1", description: "Workout 1 Description", time: 30, exercises: [Exercise(name: "Push-ups")])]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return workouts.count
        }
        
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as! HomeTableViewCell
            // update cell text labels
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "WorkoutCell", for: indexPath) as! WorkoutTableViewCell
            
            let workout = workouts[indexPath.row]
            cell.updateInfo(with: workout)
            
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 175
        } else {
            return 55
        }
    }
}
