//
//  FamilyListTableViewController.swift
//  FamilyProjectPart2
//
//  Created by Michael Whiting on 11/1/22.
//

import UIKit

class FamilyListTableViewController: UITableViewController, AddEditFamilyMemberTableViewControllerDelegate {
    
    func addEditFamilyMemberTableViewController(_ controller: AddEditFamilyMemberTableViewController, addMember newMember: FamilyMember) {
        familyList.append(newMember)
        tableView.reloadData()
    }
    
    var familyList: [FamilyMember] = [
        FamilyMember(name: "Michael", age: "18", description: "My name is Michael and I am years old"),
        FamilyMember(name: "Karl", age: "50", description: "Karl is my dad."),
        FamilyMember(name: "Jennifer", age: "49", description: "Jennifer is my mom."),
        FamilyMember(name: "Sydney", age: "23", description: "Sydney is my older sister"),
        FamilyMember(name: "Natalie", age: "14", description: "Natalie is my younger sister")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailVC = segue.destination as? DetailedViewController
        guard let selectedRow = tableView.indexPathForSelectedRow?.row else {return}
        detailVC?.nameValue = familyList[selectedRow].name
        detailVC?.ageValue = familyList[selectedRow].age
        detailVC?.descriptionValue = familyList[selectedRow].description
    }
    


    @IBSegueAction func addMember(_ coder: NSCoder, sender: Any?) -> AddEditFamilyMemberTableViewController? {
        let addVC = AddEditFamilyMemberTableViewController(coder: coder)
        addVC?.delegate = self
        return addVC
    }
    
    @IBAction func unwindToFamilyList(segue: UIStoryboardSegue) {
        tableView.reloadData()
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return familyList.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FamilyMemberCell", for: indexPath)

        let familyMember = familyList[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = familyMember.name
        cell.contentConfiguration = content
        
        return cell
    }

    

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
