//
//  WorkoutTableViewCell.swift
//  ExerciseTracker
//
//  Created by Michael Whiting on 12/1/22.
//

import UIKit

class WorkoutTableViewCell: UITableViewCell {

    @IBOutlet weak var workoutNameLabel: UILabel!
    @IBOutlet weak var shortDescriptionLabel: UILabel!
    @IBOutlet weak var isCompletedButton: UIButton!
    
    var isCompleted = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func updateInfo(with workout: Workout) {
        workoutNameLabel.text = workout.name
        shortDescriptionLabel.text = workout.description
    }
    
    @IBAction func IsCompletedButtonTapped(_ sender: UIButton) {
        isCompleted.toggle()
        isCompletedButton.isEnabled = isCompleted
    }
}
