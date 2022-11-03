//
//  PostTableViewCell.swift
//  YearLongSocialMediaAppPart2
//
//  Created by Michael Whiting on 11/2/22.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var usernamePostLabel: UILabel!
    @IBOutlet weak var textPostLabel: UILabel!
    @IBOutlet weak var datePostLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updatePost(with post: Post) {
        usernamePostLabel.text = post.username
        textPostLabel.text = post.text
        datePostLabel.text = post.date.formatted(date: .abbreviated, time: .omitted)
    }

}
