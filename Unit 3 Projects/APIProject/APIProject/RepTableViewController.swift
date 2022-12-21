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
    
    var reps: [Rep] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }

    
    func fetchInfo(searchText: String) async throws -> [Rep] {
        var urlComponents = URLComponents(string: "https://whoismyrepresentative.com/getall_mems.php")!
        urlComponents.queryItems = [URLQueryItem(name: "zip", value: "\(searchText)"), URLQueryItem(name: "output", value: "json")]
        let (data, response) = try await URLSession.shared.data(from: urlComponents.url!)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else { throw RepErrors.badData }
        
        let decoder = JSONDecoder()
        let searchResults = try decoder.decode(RepSearchResults.self, from: data)
        
        return searchResults.results
    }
    
    func fetchItems() {
        if searchBar.text != "" {
            Task {
                do {
                    reps = try await fetchInfo(searchText: searchBar.text!)
                    tableView.reloadData()
                } catch {
                    print(error)
                }
            }
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reps.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepCell", for: indexPath) as! RepTableViewCell
        
        let rep = reps[indexPath.row]
        cell.updateInfo(with: rep)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 122
    }
}

extension RepTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        fetchItems()
        searchBar.resignFirstResponder()
    }
}



