//
//  RepTableViewCell.swift
//  APIProject
//
//  Created by Michael Whiting on 12/2/22.
//

import UIKit

class RepTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var partyStateLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func updateInfo(with rep: Rep) {
        nameLabel.text = rep.name
        if rep.district != "" {
            partyStateLabel.text = "District: \(rep.district), \(rep.state)"
        } else {
            partyStateLabel.text = rep.state
        }
       
        websiteLabel.text = rep.link
    }
}
