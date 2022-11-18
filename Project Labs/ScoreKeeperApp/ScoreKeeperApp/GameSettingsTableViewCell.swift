//
//  GameSettingsTableViewCell.swift
//  ScoreKeeperApp
//
//  Created by Michael Whiting on 11/10/22.
//

import UIKit

protocol GameSettingsTableViewCellDelegate: AnyObject {
    func sortedByChanged(_ controller: GameSettingsTableViewCell, selected: Int, row: Int)
    func whoWinsChanged(_ controller: GameSettingsTableViewCell, selected: Int, row: Int)
    func stepperChanged(_ controller: GameSettingsTableViewCell, value: Int, row: Int)
}

class GameSettingsTableViewCell: UITableViewCell {

    weak var delegate: GameSettingsTableViewCellDelegate?
    
    @IBOutlet weak var sortedBy: UISegmentedControl!
    @IBOutlet weak var whoWins: UISegmentedControl!
    @IBOutlet weak var roundStepper: UIStepper!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        guard let text = Int(roundLabel.text!) else { return }
        roundStepper.value = Double(text)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateSettings(sortedBy: Int, whoWins: Int, currentRound: Int) {
        self.sortedBy.selectedSegmentIndex = sortedBy
        self.whoWins.selectedSegmentIndex = whoWins
        self.roundLabel.text = String(currentRound)
        self.roundStepper.value = Double(currentRound)
        print("updated settings")
    }
    
    func getIndexPath() -> IndexPath? {
        guard let superView = self.superview as? UITableView else {
            print("Error: The cell does not have a TableView superclass")
            return nil
        }
        let indexPath = superView.indexPath(for: self)
        return indexPath
    }
    
    
    @IBAction func stepperChanged(_ sender: Any) {
        let row = getIndexPath()?.row
        roundLabel.text = String(Int(roundStepper.value))
        delegate?.stepperChanged(self, value: Int(roundLabel.text!)!, row: row!)
    }
    
    @IBAction func sortedByChanged(_ sender: UISegmentedControl) {
        let selected = sender.selectedSegmentIndex
        let row = getIndexPath()?.row
        delegate?.sortedByChanged(self, selected: selected, row: row!)
    }
    
    
    @IBAction func whoWinsChanged(_ sender: UISegmentedControl) {
        let selected = sender.selectedSegmentIndex
        let row = getIndexPath()?.row
        delegate?.whoWinsChanged(self, selected: selected, row: row!)
    }
}
