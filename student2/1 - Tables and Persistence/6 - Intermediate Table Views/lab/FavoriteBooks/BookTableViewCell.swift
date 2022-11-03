//
//  BookTableViewCell.swift
//  FavoriteBooks
//
//  Created by Michael Whiting on 10/21/22.
//

import UIKit

class BookTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var lengthLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 15.0)
        authorLabel?.font = UIFont.systemFont(ofSize: 12.0)
        genreLabel?.font = UIFont.systemFont(ofSize: 12.0)
        lengthLabel?.font = UIFont.systemFont(ofSize: 12.0)

    }

    func update(with book: Book) {
        titleLabel.text = book.title
        authorLabel.text = book.author
        genreLabel.text = book.genre
        lengthLabel.text = book.length
    }
}
