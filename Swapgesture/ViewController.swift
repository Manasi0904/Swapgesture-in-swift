//
//  ViewController.swift
//  Swapgesture
//
//  Created by Kumari Mansi on 15/01/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var swipeLabel: UILabel!
    @IBOutlet var tapImage: UIImageView!
    var tapGesture = UITapGestureRecognizer()
    var panGesture = UIPanGestureRecognizer()
    var pinchGesture = UIPinchGestureRecognizer()
    var rotateGesture = UIRotationGestureRecognizer()
    var lastRotation = CGFloat()
    
    var longGesture = UILongPressGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      //  addBlurView()
        
        // FOR TAPPING
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.myviewTapped(_:)))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        tapImage.addGestureRecognizer(tapGesture)
        tapImage.isUserInteractionEnabled = true
        
        
        // FOR PAN GESTURE(WE CAN EASILY MOVE THE IMAGE ON THE SCREEN)
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(ViewController.draggedView(_:)))
        tapImage.isUserInteractionEnabled = true
        tapImage.addGestureRecognizer(panGesture)
        
        // TO PINCH GESTURE(WE CAN EXPAND OR REDUCE THE IMAGE EASILY ONLY BY FINGER)
        pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.pinchedView(_:)))
        tapImage.isUserInteractionEnabled = true
        tapImage.addGestureRecognizer(pinchGesture)
        
        
        
        // TO ROTATE
        rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(ViewController.rotatedView(_:)))
        tapImage.addGestureRecognizer(rotateGesture)
        tapImage.isUserInteractionEnabled = true
        tapImage.isMultipleTouchEnabled = true
        
        
        // TO PRESS FOR LONG TIME
        longGesture = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longPress(_:)))
        longGesture.minimumPressDuration = 1
        tapImage.addGestureRecognizer(longGesture)
        
        
        
        // FOR LEFT SWIPE
        let leftSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(leftSwipedByUser(_:)))
        leftSwipeGesture.direction = .left
        self.view.addGestureRecognizer(leftSwipeGesture)
        
        // FOR RIGHT SWIPE
        let rightSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(rightSwipedByUser(_:)))
        rightSwipeGesture.direction = .right
        self.view.addGestureRecognizer(rightSwipeGesture)
        
        
        // FOR UP SWIPE
        let upSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(upSwipedByUser(_:)))
        upSwipeGesture.direction = .up
        self.view.addGestureRecognizer(upSwipeGesture)
        
        //FOR DOWN SWIPE
        let downSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(downSwipedByUser(_:)))
        downSwipeGesture.direction = .down
        self.view.addGestureRecognizer(downSwipeGesture)
    }
    
    // OBJC FUNC FOR TAPPING
    @objc func myviewTapped(_ sender: UITapGestureRecognizer){
        if self.tapImage.backgroundColor == UIColor.systemYellow {
            self.tapImage.backgroundColor = UIColor.green
        } else {
            self.tapImage.backgroundColor = UIColor.systemYellow
        }
    }

    // OBJC FUNVC FOR LEFT SWIPE
    @objc func leftSwipedByUser(_ gesture:UISwipeGestureRecognizer) {
        self.swipeLabel.text = "Left Swipe"
    }

    // OBJC FUNC FOR RIGHT SWIPE
    @objc func rightSwipedByUser(_ gesture:UISwipeGestureRecognizer) {
        self.swipeLabel.text = "Right Swipe"
    }
    
    // OBJC FUNC FOR UP SWIPE
    @objc func upSwipedByUser(_ gesture:UISwipeGestureRecognizer) {
        self.swipeLabel.text = "Up Swipe"
    }
    
    // OBJC FUNC FOR DOWN SWIPE
    @objc func downSwipedByUser(_ gesture:UISwipeGestureRecognizer) {
        self.swipeLabel.text = "Down Swipe"
    }
    
    
    // FOR PAN GESTURE
    @objc func draggedView(_ sender: UIPanGestureRecognizer)
    {
        self.view.bringSubviewToFront(tapImage)
        let translation = sender.translation(in: self.view)
        tapImage.center = CGPoint(x: tapImage.center.x + translation.x , y: tapImage.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: self.view)
    }
    
    
    // OBJC FUNC FOR PINCH GESTURE
    @objc func pinchedView(_ sender: UIPinchGestureRecognizer)
    {
        self.view.bringSubviewToFront(tapImage)
        sender.view?.transform = (sender.view?.transform)!.scaledBy(x: sender.scale, y: sender.scale)
        sender.scale = 1.0
    }
    
    
    // OBJC FUNC TO ROTATE
    @objc func rotatedView(_ sender : UIRotationGestureRecognizer) {
        var lastRotation = CGFloat()
        self.view.bringSubviewToFront(tapImage)
        if(sender.state == UIGestureRecognizer.State.ended) {
            lastRotation = 0.0;
        }
        let rotation = 0.0 - (lastRotation - sender.rotation)
        let currentTrans = sender.view?.transform
        let newTrans = currentTrans!.rotated(by: rotation)
        sender.view?.transform = newTrans
        lastRotation = sender.rotation
    }
    
    
    // OBJC FUNC FOR LONG PRESS
    @objc func longPress(_ sender: UILongPressGestureRecognizer) {
        let alertC = UIAlertController(title: "Long Press", message: "Long press gesture called when you press on view for 1 second.", preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
            (alert) in
        }
        alertC.addAction(ok)
        self.present(alertC, animated: true, completion:  nil)
    }
    @IBAction func navigateButton(_ sender: Any) {
       
    let Storyboard = self.storyboard?.instantiateViewController(identifier: "WebKitViewViewController") as! WebKitViewViewController
    self.navigationController?.pushViewController(Storyboard, animated: true)
}
    
    
//    func addBlurView()
//    {
//        let blur = UIBlurEffect(style: .extraLight)
//        let visualEffect = UIVisualEffectView(effect: blur)
//        visualEffect.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(visualEffect)
//        NSLayoutConstraint.activate([
//            visualEffect.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
//            visualEffect.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
//            visualEffect.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
//            visualEffect.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
//            
//        ])
//        
//    }
}

