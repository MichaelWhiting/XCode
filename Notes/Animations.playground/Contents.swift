import UIKit
import PlaygroundSupport

let liveViewFrame = CGRect(x: 0, y: 0, width: 500, height: 500)
let liveView = UIView(frame: liveViewFrame)

liveView.backgroundColor = .white

PlaygroundPage.current.liveView = liveView

let smallFrame = CGRect(x: 0, y: 0, width: 100, height: 100)
let square = UIView(frame: smallFrame)
square.backgroundColor = .purple

liveView.addSubview(square)

UIView.animate(withDuration: 1.5) {
    square.backgroundColor = .green
    let scale = CGAffineTransform(scaleX: 2, y: 2)
    let rotate = CGAffineTransform(rotationAngle: .pi)
    let translate = CGAffineTransform(translationX: 100, y: 200)
    let combined = scale.concatenating(rotate).concatenating(translate)

    square.transform = combined
    
} completion: { _ in
    UIView.animate(withDuration: 1.5) {
        square.transform = .identity
    }
}

