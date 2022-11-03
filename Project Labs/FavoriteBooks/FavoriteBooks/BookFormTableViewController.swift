//
//  BookFormTableViewController.swift
//  FavoriteBooks
//
//  Created by Michael Whiting on 10/21/22.
//

import UIKit

class BookFormTableViewController: UITableViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var genreTextField: UITextField!
    @IBOutlet weak var lengthTextField: UITextField!
    
    var book: Book?
    
    init?(coder: NSCoder, book: Book?) {
        self.book = book
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let book = book {
            titleTextField.text = book.title
            authorTextField.text = book.author
            genreTextField.text = book.genre
            lengthTextField.text = book.length
            title = "Edit Book"
        } else {
            title = "Add Book"
        }
    }
    
    @IBAction func unwindToBookTable(segue: UIStoryboardSegue) {

    }
    
}
