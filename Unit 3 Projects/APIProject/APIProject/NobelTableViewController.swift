//
//  NobelTableViewController.swift
//  APIProject
//
//  Created by Michael Whiting on 12/2/22.
//

import UIKit

enum NobelPrizeErrors: Error, LocalizedError {
    case badStatusCode
}

class NobelTableViewController: UITableViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    var prizes: [NobelPrize] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func fetchInfo(searchText: String) async throws -> [NobelPrize] {
        print("info started")
        var urlComponents = URLComponents(string: "https://api.nobelprize.org/v1/prize.json")!
        urlComponents.queryItems = [URLQueryItem(name: "year", value: "\(searchText)")]
        
        let (data, response) = try await URLSession.shared.data(from: urlComponents.url!)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else { throw NobelPrizeErrors.badStatusCode }
        
        let decoder = JSONDecoder()
        let searchResults = try decoder.decode(SearchResults.self, from: data)
        
        return searchResults.results
    }
    
    func fetchItems() {
        if searchBar.text != "" {
            Task {
                do {
                    prizes = try await fetchInfo(searchText: searchBar.text!)
                    tableView.reloadData()
                    print("This is prizes \(prizes)")
                } catch {
                    print(error)
                }
            }
        }
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return prizes.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = prizes[section]
        
        if section.isOpened {
            return section.laureates.count + 1
        } else {
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            prizes[indexPath.section].isOpened.toggle()
            tableView.reloadSections([indexPath.section], with: .none)
        }
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PrizeType", for: indexPath) as! PrizeTypeTableViewCell

        if indexPath.row == 0 {
            let category = prizes[indexPath.section].category
            cell.prizeTypeLabel.text = "\(category.prefix(1).capitalized)\(category.dropFirst().lowercased())"
            return cell
        } else {
            let winner = prizes[indexPath.section].laureates[indexPath.row - 1]
            cell.prizeTypeLabel.text = "    \(winner.firstname) \(winner.surname)"
        }
        
        return cell
    }
    

}

extension NobelTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        fetchItems()
        searchBar.resignFirstResponder()
    }
}
