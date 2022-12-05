//
//  ViewController.swift
//  MusicWireFrame
//
//  Created by Michael Whiting on 11/22/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var albumImageView: UIImageView!
    
    @IBOutlet weak var reverseButton: UIButton!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var fowardbutton: UIButton!
    
    @IBOutlet weak var reverseBackground: UIView!
    @IBOutlet weak var playPauseBackground: UIView!
    @IBOutlet weak var fowardBackground: UIView!
    
    var isPlaying = true {
        didSet {
            playPauseButton.isSelected = isPlaying
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playPauseButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        playPauseButton.setImage(UIImage(systemName: "pause.fill"), for: .selected)
        [reverseBackground, playPauseBackground,fowardBackground].forEach { bgView in
            bgView.layer.cornerRadius = bgView.frame.width / 2
            bgView.clipsToBounds = true
            bgView.alpha = 0
        }
    }

    @IBAction func playPauseButtonTapped(_ sender: UIButton) {
        isPlaying.toggle()
        
        // Album Art Animation
        if isPlaying {
            UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.1) {
                self.albumImageView.transform = .identity
            }
        } else {
            UIView.animate(withDuration: 0.5) {
                self.albumImageView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }
        }
    }
    
    @IBAction func controlTouchUpInside(_ sender: UIButton) {
        let buttonBackground: UIView
        
        switch sender {
        case reverseButton:
            buttonBackground = reverseBackground
        case playPauseButton:
            buttonBackground = playPauseBackground
        case fowardbutton:
            buttonBackground = fowardBackground
        default:
            return
        }
        
        UIView.animate(withDuration: 0.25) {
            buttonBackground.alpha = 0
            buttonBackground.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            sender.transform = .identity
        } completion: { _ in
            buttonBackground.transform = .identity
        }

    }
    
    @IBAction func controlTouchDown(_ sender: UIButton) {
        let buttonBackground: UIView
        
        switch sender {
        case reverseButton:
            buttonBackground = reverseBackground
        case playPauseButton:
            buttonBackground = playPauseBackground
        case fowardbutton:
            buttonBackground = fowardBackground
        default:
            return
        }
        
        UIView.animate(withDuration: 0.25) {
            buttonBackground.alpha = 0.3
            sender.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }
    }
}

