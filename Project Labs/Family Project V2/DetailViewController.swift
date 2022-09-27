//
//  DetailViewController.swift
//  Family Project V2
//
//  Created by Michael Whiting on 9/26/22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailText: UILabel!
    var textData: String?
    var person: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailText.text = textData
        detailImageView.image = UIImage(named: person!)
        detailText.layer.masksToBounds = true
        detailText.layer.cornerRadius = 10
        switch person {
            case "Jennifer":
                detailImageView.backgroundColor = .cyan
                detailText.backgroundColor = .cyan
            case "Karl":
                detailImageView.backgroundColor = .orange
                detailText.backgroundColor = .orange
            case "Sydney":
                detailImageView.backgroundColor = .green
                detailText.backgroundColor = .green
            case "Natalie":
                detailImageView.backgroundColor = .systemPink
                detailText.backgroundColor = .systemPink
            case "Michael":
                detailImageView.backgroundColor = .red
                detailText.backgroundColor = .red
            default:
                detailImageView.backgroundColor = .gray
                detailText.backgroundColor = .gray
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
