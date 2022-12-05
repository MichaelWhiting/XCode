//
//  DogViewController.swift
//  APIProject
//
//  Created by Michael Whiting on 12/2/22.
//

import UIKit

class DogViewController: UIViewController {

    @IBOutlet weak var dogImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
        
    @IBAction func newImageButtonTapped(_ sender: UIButton) {
        Task {
            do {
                 let dog = try await fetchItems()
                let image = try await fetchImage(from: URL(string: "\(dog.message)")!)

                dogImageView.image = image
            } catch {
                print(error)
            }
        }
    }
    
    func fetchItems() async throws -> Dog {
        let urlComponents = URLComponents(string: "https://dog.ceo/api/breeds/image/random")!
        let (data, response) = try await URLSession.shared.data(from: urlComponents.url!)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else { throw DogErrors.imageIssue }
        
        let decoder = JSONDecoder()
        let searchResponse = try decoder.decode(Dog.self, from: data)

        return searchResponse
    }

    func fetchImage(from url: URL) async throws -> UIImage {
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else { throw DogErrors.imageIssue }
        guard let image = UIImage(data: data) else { throw DogErrors.imageIssue }
        
        return image
    }
}
