//
//  PostsTableViewController.swift
//  YearLongSocialMediaAppPart2
//
//  Created by Michael Whiting on 11/2/22.
//

import UIKit

class PostsTableViewController: UITableViewController, CreatePostTableViewControllerDelegate {
    
    func addPost(_ controller: CreatePostTableViewController, addPost newPost: Post) {
        posts.append(newPost)
        tableView.reloadData()
    }

    var post: Post?

    var posts: [Post] = [Post(username: "Michael", text: "This is the paragraph", date: Date()),Post(username: "John", text: "This is a text", date: Date())]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }

    @IBSegueAction func segueToCreateEdit(_ coder: NSCoder, sender: Any?) -> CreatePostTableViewController? {
        if let cell = sender as? UITableViewCell,
           let indexPath = tableView.indexPath(for: cell) {
            let postToEdit = posts[indexPath.row]
            return CreatePostTableViewController(coder: coder, post: postToEdit)
        } else {
            let createPost = CreatePostTableViewController(coder: coder, post: nil)
            createPost?.delegate = self
            return createPost
        }
    }
    
    @IBAction func unwindFromSave(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveUnwind", let sourceVC = segue.source as? CreatePostTableViewController, let post = sourceVC.post else { return }
        
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            posts[selectedIndexPath.row] = post
            tableView.reloadRows(at: [selectedIndexPath], with: .none)
        }
    }
    
    
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return posts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostTableViewCell

        let post = posts[indexPath.row]
        
        cell.updatePost(with: post)
        cell.showsReorderControl = true

        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

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
