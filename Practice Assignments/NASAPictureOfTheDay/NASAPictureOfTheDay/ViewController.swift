//
//  ViewController.swift
//  NASAPictureOfTheDay
//
//  Created by Michael Whiting on 11/30/22.
//

import UIKit

@MainActor
class ViewController: UIViewController {

    @IBOutlet weak var nasaImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    let controller = PhotoInfoController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = ""
        nasaImageView.image = UIImage(systemName: "photo.on.rectangle")
        descriptionLabel.text = ""
    
        Task {
            do {
                let photoInfo = try await
                   controller.fetchPhotoInfo()
                updateUI(with: photoInfo)
            } catch {
                updateUI(with: error)
            }
        }
    }
    
    func updateUI(with photoInfo: PhotoInfo) {
        Task {
            do {
                let image = try await controller.fetchImage(from:
                   photoInfo.url)
                titleLabel.text = photoInfo.title
                nasaImageView.image = image
                descriptionLabel.text = photoInfo.description
            } catch {
                updateUI(with: error)
            }
        }
    }
    
    func updateUI(with error: Error) {
        title = "Error Fetching Photo"
        nasaImageView.image = UIImage(systemName: "exclamationmark.octagon")
        descriptionLabel.text = error.localizedDescription
    }
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        super.viewDidLoad()
//
//        title = ""
//        nasaImageView.image = UIImage(systemName: "photo.on.rectangle")
//        descriptionLabel.text = ""
//        titleLabel.text = ""
//
//        Task {
//            do {
//                let photoInfo = try await controller.fetchPhotoInfo()
//
//                self.titleLabel.text = photoInfo.title
//                self.descriptionLabel.text = photoInfo.description
//            } catch {
//                self.title = "Error Fetching Photo"
//                self.nasaImageView.image = UIImage(systemName: "exclamationmark.octagon")
//                self.descriptionLabel.text = error.localizedDescription
//                self.titleLabel.text = ""
//            }
//        }
//    }
}

