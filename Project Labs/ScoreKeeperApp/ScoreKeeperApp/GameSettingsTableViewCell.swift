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
}

class GameSettingsTableViewCell: UITableViewCell {

    weak var delegate: GameSettingsTableViewCellDelegate?
    
    @IBOutlet weak var sortedBy: UISegmentedControl!
    @IBOutlet weak var whoWins: UISegmentedControl!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateSettings(sortedBy: Int, whoWins: Int) {
        self.sortedBy.selectedSegmentIndex = sortedBy
        self.whoWins.selectedSegmentIndex = whoWins
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
