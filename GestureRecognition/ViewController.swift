//
//  ViewController.swift
//  GestureRecognition
//
//  Created by Егор Глезденёв on 08.09.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        swipesObserver()
        tapsObserver()
    }

    func swipesObserver() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeUp.direction = .up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)
    }
    
    func tapsObserver() {
        let tripleTap = UITapGestureRecognizer(target: self, action: #selector(handleTripleTap))
        tripleTap.numberOfTapsRequired = 3
        self.view.addGestureRecognizer(tripleTap)
        
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap))
        doubleTap.require(toFail: tripleTap)
        doubleTap.numberOfTapsRequired = 2
        self.view.addGestureRecognizer(doubleTap)
        
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(handleSingleTap))
        singleTap.require(toFail: doubleTap)
        singleTap.numberOfTapsRequired = 1
        self.view.addGestureRecognizer(singleTap)
    }
    
    @objc func handleSwipes(gesture: UISwipeGestureRecognizer) {
        switch gesture.direction {
        case .right:
            label.text = "Right swipe was recognized"
        case .left:
            label.text = "Left swipe was recognized"
        case .up:
            label.text = "Up swipe was recognized"
        case .down:
            label.text = "Down swipe was recognized"
        default:
            break
        }
    }
    
    @objc func handleTripleTap() {
        label.text = "Triple tap was recognized"
    }
    
    @objc func handleDoubleTap() {
        label.text = "Double tap was recognized"
    }
    
    @objc func handleSingleTap() {
        label.text = "Single tap was recognized"
    }

}

