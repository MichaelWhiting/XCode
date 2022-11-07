//
//  PlayerTableViewCell.swift
//  ScoreKeeperApp
//
//  Created by Michael Whiting on 11/3/22.
//

import UIKit

protocol PlayerViewTableCellDelegate: AnyObject {
    func stepperChanged(_ controller: PlayerTableViewCell, sortPlayer changed: Bool, playerScore updatedValue: Int, path indexPathRow: Int)
    func updateColor(_ controller: PlayerTableViewCell, updateColor color: UIColor, path indexPath: Int)
}

class PlayerTableViewCell: UITableViewCell, UIColorPickerViewControllerDelegate {
  
    weak var delegate: PlayerViewTableCellDelegate?
    
    @IBOutlet weak var playerColorTeam: UIButton!
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var playerScoreLabel: UILabel!
    @IBOutlet weak var scoreStepper: UIStepper!
        
    func getIndexPath() -> IndexPath? {
        guard let superView = self.superview as? UITableView else {
            print("Error: The cell does not have a TableView superclass")
            return nil
        }
        let indexPath = superView.indexPath(for: self)
        return indexPath
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        playerColorTeam.layer.cornerRadius = playerColorTeam.frame.width/2
    }

    func updateCell(with player: Player) {
        playerNameLabel.text = player.name
        playerScoreLabel.text = String(player.score)
        scoreStepper.value = Double(player.score)
        playerColorTeam.backgroundColor = player.color
    }
    
    
    @IBAction func playerColorButtonPressed(_ sender: Any) {
        let colorPickerVC = UIColorPickerViewController()
        colorPickerVC.delegate = self
        self.window?.rootViewController?.present(colorPickerVC, animated: true)
    }
    
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        let color = viewController.selectedColor
        let row = getIndexPath()?.row
        delegate?.updateColor(self, updateColor: color, path: row!)
        self.playerColorTeam.backgroundColor = color
    }
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        playerScoreLabel.text = String(Int(scoreStepper.value))
        let row = getIndexPath()?.row
        delegate?.stepperChanged(self, sortPlayer: true, playerScore: Int(scoreStepper.value), path: row!)
    }
}
