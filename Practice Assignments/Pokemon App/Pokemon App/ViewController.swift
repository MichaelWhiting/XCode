//
//  ViewController.swift
//  Pokemon App
//
//  Created by Michael Whiting on 9/21/22.
//

import UIKit
import RyansPokemonPackage

class ViewController: UIViewController {
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonButton: UIButton!
    @IBOutlet weak var typesStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonButton.layer.cornerRadius = pokemonButton.frame.height / 2.4
    }
    
    @IBAction func newPokemon(_ sender: Any) {
        // get a new pokmeon
        // assign the name to the name label
        // assign the photo to the imageview
        Task {
            let pokemon = await getRandomPokemon(gen: .all)
            pokemonNameLabel.text = pokemon.name.capitalized
            pokemonImageView.setPokemon(pokemon: pokemon)
            // create a label for each type that the pokemon has.
            // add those labels to the stackview
            for view in typesStackView.arrangedSubviews {
                view.removeFromSuperview()
            }
            for pType in pokemon.types {
                let label = UILabel()
                label.text = pType.capitalized
                typesStackView.addArrangedSubview(label)
            }
            
        }
    }
}

