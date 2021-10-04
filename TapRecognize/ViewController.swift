//
//  ViewController.swift
//  TapRecognize
//
//  Created by Никита Симаков on 25.09.2021.
//

import UIKit

class ViewController: UIViewController {

    let myView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tapOnView()
    }

    func createCircle() -> CGRect {
        let radius: Int = 50
        myView.frame = CGRect(x: view.center.x - (myView.frame.width / 2), y: view.center.y - (myView.frame.width / 2), width: CGFloat(radius * 2), height: CGFloat(radius * 2))
        myView.backgroundColor = .init(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
        myView.isHidden = true
        view.addSubview(myView)
        return .init(x: view.center.x - (myView.frame.width / 2), y: view.center.y - (myView.frame.width / 2), width: CGFloat(radius * 2), height: CGFloat(radius * 2))
    }

    func tapOnView() {
        let recognize = UITapGestureRecognizer(target: self, action: #selector(gestureRecognize))
        recognize.numberOfTapsRequired = 1
        view.addGestureRecognizer(recognize)
    }
    
    func isAvailableToPlace(rect: CGRect) -> Bool {
        let isInSuperView = true
        var isIntersects = false
        view.subviews.forEach({ subview in
            if subview.frame.intersects(rect) {
                isIntersects = true
            }
        })
        return !isIntersects && isInSuperView
    }

    @IBAction func gestureRecognize(_ sender: UITapGestureRecognizer) {
        let circle = createCircle()
        let isAvailable = isAvailableToPlace(rect: circle)
        if isAvailable {
            let circle = UIView()
            circle.center = sender.location(in: view)
            self.view.addSubview(circle)
        }
    }
}

