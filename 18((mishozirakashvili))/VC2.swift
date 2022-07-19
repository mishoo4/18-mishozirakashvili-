//
//  VC2.swift
//  18((mishozirakashvili))
//
//  Created by misho zirakashvili on 19.07.22.
//

import UIKit

class VC2: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var infinity: UIImageView!
    
    var cases: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        casesSwitch()
    }
    
    private func casesSwitch() {
        switch cases {
        case 0:
            longPress()
        case 1:
            longPress()
        case 2:
            swipeGesture()
        case 3:
            pinchGesture()
            
        default:
            print("🤡")
        }
    }
    
    private func longPress() {
        var gesture = UILongPressGestureRecognizer()
        if cases == 0 {
            gesture = UILongPressGestureRecognizer(target: self, action: #selector(redCirclelongPressAction(_ :)))
        }
        else {
            gesture = UILongPressGestureRecognizer(target: self, action: #selector(blueCirclelongPressAction(_ :)))
        }
        gesture.minimumPressDuration = 1.0
        gesture.delaysTouchesBegan = true
        gesture.delegate = self
        infinity.addGestureRecognizer(gesture)
    }
    
    @objc func redCirclelongPressAction(_ gesture: UIGestureRecognizer) {
        navigationController?.popViewController(animated: true)
    }
    @objc func blueCirclelongPressAction(_ gesture: UIGestureRecognizer) {
        UIView.transition(with: infinity, duration: 0.25,
                          options: .transitionFlipFromTop,
                          animations: nil,
                          completion: {_ in
            self.infinity.isHidden = true
        })
    }
    
    
    func swipeGesture() {
       
        let rightSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeGestureAction))
        rightSwipeGesture.direction = .right
        
        let leftSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeGestureAction))
        leftSwipeGesture.direction = .left
        
        let downSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeGestureAction))
        downSwipeGesture.direction = .down
        
        let upSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeGestureAction))
        upSwipeGesture.direction = .up
        
        infinity.addGestureRecognizer(rightSwipeGesture)
        infinity.addGestureRecognizer(leftSwipeGesture)
        infinity.addGestureRecognizer(downSwipeGesture)
        infinity.addGestureRecognizer(upSwipeGesture)
        
    }
    
    
    private func moveInfinitySymbol(x: CGFloat, y: CGFloat) {
        UIView.animate(withDuration: 0.2, delay: 0.0, options:[], animations: {
            self.infinity.transform = CGAffineTransform(translationX: x, y: y)
            }, completion: nil)
    }
    
    @objc func swipeGestureAction(gesture: UISwipeGestureRecognizer) {
        switch gesture.direction {
        case .left:   moveInfinitySymbol(x: -50, y: 0)
        case .right:  moveInfinitySymbol(x: 50, y: 0)
        case .up:     moveInfinitySymbol(x: 0, y: -50)
        case .down:   moveInfinitySymbol(x: 0, y: 50)
        default:      print("🥱")
        }
    }
    
    func pinchGesture() {
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinched))
        infinity.addGestureRecognizer(pinchGesture)
    }
    
    @objc func pinched(gesture: UIPinchGestureRecognizer) {
        gesture.view?.transform = (gesture.view?.transform.scaledBy(x: gesture.scale, y: gesture.scale))!
        print(gesture.scale)
        gesture.scale = 1
    }
}
