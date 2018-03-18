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
    var viewController: GameViewController!
    
    override func didMove(to view: SKView) {
        /* Setup your scene here */
        scene?.backgroundColor = SKColor.white  //background color to white
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.location(in: self)
            if let node = findBlock(at: location) {
                print ("touched \(String(describing: node.name))")
//                let center: CGPoint = CGPoint(x: node.frame.midX, y: node.frame.midY)
//                makeCrossInPosition(location: center)
//                makeCirlceInPosition(location: center)
                self.viewController.placeItem(block: node)
            }
        }
    }
    
    func findBlock(at location: CGPoint) -> SKNode? {
        for node in self.children {
            if node.contains(location) {
                // print ("touched... \(node.name)")
                if node.name == "reset" {
                    resetGame()
                    return nil
                }
                return node
            }
        }
        return nil
    }
    
    func resetGame ()
    {
        print (" resetGame ")
    }
    
    func makeCircleInPosition(node: SKNode) {
//        let center: CGPoint = CGPoint(x: node.frame.midX, y: node.frame.midY)
        let center: CGPoint = CGPoint(x: 0, y: 0)
        let Circle = SKShapeNode(circleOfRadius: 40 ) // Create circle
        Circle.position = center  // CGPoint(x: 0, y: 0)  // Center (given scene anchor point is 0.5 for x&y)
        Circle.strokeColor = SKColor.black
        Circle.glowWidth = 1.0
        Circle.fillColor = SKColor.orange
        node.addChild(Circle)
        
//        makeCirlceInPosition(location: center)
    }
    
    func makeCrossInPosition(node: SKNode) {
//        let center: CGPoint = CGPoint(x: node.frame.midX, y: node.frame.midY)
        let center: CGPoint = CGPoint(x: 0, y: 0)
//        makeCrossInPosition(location: center)
        let cross = SKLabelNode()
        cross.text = "X"
        cross.fontName = "Chalkduster"
        cross.fontSize = 65
        cross.fontColor = SKColor.black
        cross.position = center
        cross.verticalAlignmentMode = .center
        cross.horizontalAlignmentMode = .center

        node.addChild(cross)
    }
    
    //  Where the Magic Happens!
    func makeCirlceInPosition(location: CGPoint){
        print("location=\(location)")
        let Circle = SKShapeNode(circleOfRadius: 40 ) // Create circle
        Circle.position = location  // CGPoint(x: 0, y: 0)  // Center (given scene anchor point is 0.5 for x&y)
        Circle.strokeColor = SKColor.black
        Circle.glowWidth = 1.0
        Circle.fillColor = SKColor.orange
        self.addChild(Circle)
        
    }
    
    func makeCrossInPosition(location: CGPoint) {
        let cross = SKLabelNode()
        cross.text = "X"
        cross.fontName = "Chalkduster"
        cross.fontSize = 65
        cross.fontColor = SKColor.black
        cross.position = location
        cross.verticalAlignmentMode = .center
        cross.horizontalAlignmentMode = .center
        self.addChild(cross)
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
