//
//  RepTableViewController.swift
//  APIProject
//
//  Created by Michael Whiting on 12/2/22.
//

import UIKit

enum RepErrors: Error, LocalizedError {
    case badData
}

class RepTableViewController: UITableViewController {
   
    @IBOutlet weak var searchBar: UISearchBar!
    
    let reps: [Rep] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }

    
    func fetchInfo(searchText: String) async throws -> Rep {
        var urlComponents = URLComponents(string: " https://whoismyrepresentative.com/api")!
        urlComponents.queryItems = [URLQueryItem(name: "zip", value: "\(searchText)"), URLQueryItem(name: "output", value: "json")]
        let (data, response) = try await URLSession.shared.data(from: urlComponents.url!)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else { throw RepErrors.badData }
        
        let decoder = JSONDecoder()
        let searchResults = try decoder.decode(Rep.self, from: data)
        
        return searchResults
    }
    
    func fetchItems() {
        if searchBar.text != "" {
            Task {
                do {
                    let repInfo = try await fetchInfo(searchText: searchBar.text!)
                    tableView.reloadData()
                } catch {
                    print(error)
                }
            }
        }
    }
    
    func configure(cell: RepTableViewCell, forItemAt indexPath: IndexPath) {
        let rep = reps[indexPath.row]

        cell.nameLabel.text = rep.name
        cell.partyStateLabel.text = "\(rep.office), \(rep.state)"
        cell.websiteLabel.text = rep.website
    }
    

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reps.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepCell", for: indexPath) as! RepTableViewCell
        
        configure(cell: cell, forItemAt: indexPath)

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

extension RepTableViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("this worked")
        fetchItems()
        searchBar.resignFirstResponder()
    }
}
