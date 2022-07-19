//
//  ViewController.swift
//  18((mishozirakashvili))
//
//  Created by misho zirakashvili on 19.07.22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redCircle: UIImageView!
    @IBOutlet weak var blueCircle: UIImageView!
    @IBOutlet weak var purpleTriangle: UIImageView!
    @IBOutlet weak var blackTriangle: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tapGesture()
        
        NotificationCenter.default.addObserver(self, selector: #selector(changeBackgroundColor), name: Notification.Name(".backgroundColorChange"), object: nil)
       
    }
    
    private func tapGesture() {

        var recognizer: UITapGestureRecognizer {
            get {
                return UITapGestureRecognizer(target: self, action: #selector(tapGetureAction(_ :)))
            }
        }

        redCircle.addGestureRecognizer(recognizer)
        blueCircle.addGestureRecognizer(recognizer)
        purpleTriangle.addGestureRecognizer(recognizer)
        blackTriangle.addGestureRecognizer(recognizer)
    }
    
        
    @objc func tapGetureAction(_ sender: UITapGestureRecognizer) {
    
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "VC2") as? VC2 else { return }
        
        if let cases = sender.view?.cases {
            vc.case = cases
            print(cases)
        }
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func changeBackgroundColor(notification: Notification) {
        if let color = notification.userInfo?["backgroundColor"] as? UIColor {
            view.backgroundColor = color
        }
        
    }
    
}
