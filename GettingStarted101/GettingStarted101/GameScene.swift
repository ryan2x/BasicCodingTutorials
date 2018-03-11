//
//  GameScene.swift
//  GettingStarted101
//
//  Created by Ryan Xu on 3/10/18.
//  Copyright © 2018 Ryan Xu. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
        /* Setup your scene here */
        scene?.backgroundColor = SKColor.white  //background color to white
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.location(in: self)
            makeCirlceInPosition(location: location)  // Call makeCircleInPostion, send touch location.
        }
    }
    
    
    //  Where the Magic Happens!
    func makeCirlceInPosition(location: CGPoint){
        print("location=\(location)")
        let Circle = SKShapeNode(circleOfRadius: 100 ) // Create circle
        Circle.position = location  // CGPoint(x: 0, y: 0)  // Center (given scene anchor point is 0.5 for x&y)
        Circle.strokeColor = SKColor.black
        Circle.glowWidth = 1.0
        Circle.fillColor = SKColor.orange
        self.addChild(Circle)
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
