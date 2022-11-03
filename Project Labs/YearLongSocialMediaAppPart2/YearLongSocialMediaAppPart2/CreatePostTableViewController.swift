//
//  CreatePostTableViewController.swift
//  YearLongSocialMediaAppPart2
//
//  Created by Michael Whiting on 11/2/22.
//

import UIKit

protocol CreatePostTableViewControllerDelegate: AnyObject {
    func addPost(_ controller: CreatePostTableViewController, addPost newPost: Post)
}

class CreatePostTableViewController: UITableViewController {

    var post: Post?
    weak var delegate: CreatePostTableViewControllerDelegate?
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var postTextField: UITextField!
    
    init?(coder: NSCoder, post: Post?) {
        self.post = post
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let post = post {
            usernameTextField.text = post.username
            postTextField.text = post.text
            title = "Edit Post"
        } else {
            title = "Add Post"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "saveUnwind" else { return }
        
        let username = usernameTextField.text ?? ""
        let postText = postTextField.text ?? ""
        let date = Date()
        post = Post(username: username, text: postText, date: date)
    }

    @IBAction func saveButtonPressed(_ sender: Any) {
        
        let username = usernameTextField.text ?? ""
        let postText = postTextField.text ?? ""
        let newPost = Post(username: username, text: postText, date: Date())
        delegate?.addPost(self, addPost: newPost)
        dismiss(animated: true)
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
