//
//  ViewController.swift
//  AnimateBallDrop
//
//  Created by James and Ray Berry on 15/10/2018.
//  Copyright © 2018 JARBerry. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollisionBehaviorDelegate{

    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    var collision: UICollisionBehavior!
    var square: UIView!
    var circle: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
// create circle
        let circle = UIView(
            frame: CGRect(x: 200.0, y: 150.0, width: 64.0, height: 64.0)
        )
       // circle.center = view.center
        circle.backgroundColor = UIColor.white
        circle.layer.borderColor = UIColor.blue.cgColor
        circle.layer.cornerRadius = 32.0
        circle.layer.borderWidth = 2.0
        view.addSubview(circle)
        
        
// Create Square
        
//        square = UIView(frame: CGRect(x: 200, y: 100, width: 30, height: 30))
//        square.backgroundColor = UIColor.white
//        view.addSubview(square)
        
        
// Create the barriers
        let barrier1 = UIView(frame: CGRect(x: 0, y: 300, width: 250, height: 20))
        barrier1.backgroundColor = UIColor.red
        view.addSubview(barrier1)
        
        
        let barrier2 = UIView(frame: CGRect(x: 100, y: 500, width: 250, height: 20))
        barrier2.backgroundColor = UIColor.red
        view.addSubview(barrier2)
        
        let barrier3 = UIView(frame: CGRect(x: 0, y: 700, width: 250, height: 20))
        barrier3.backgroundColor = UIColor.red
        view.addSubview(barrier3)
        
// Initialise gravity reference
        
        animator = UIDynamicAnimator(referenceView: view)
                  gravity = UIGravityBehavior(items: [circle])


        
// add collision factors
        
        collision = UICollisionBehavior(items: [circle, barrier1, barrier2, barrier3])
        
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
        
        

    }


    @IBAction func startPressed(_ sender: UIButton) {
        
        runAnimation()
    }
    
    func runAnimation(){
        
// drop the circle

           animator.addBehavior(gravity)

       
        
    }

}

