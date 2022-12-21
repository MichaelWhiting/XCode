//
//  PrizeTypeTableViewCell.swift
//  APIProject
//
//  Created by Michael Whiting on 12/5/22.
//

import UIKit

class PrizeTypeTableViewCell: UITableViewCell {

    @IBOutlet weak var prizeTypeLabel: UILabel!
    
    var isOpen: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
