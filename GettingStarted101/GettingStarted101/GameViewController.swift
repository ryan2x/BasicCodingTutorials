//
//  GameViewController.swift
//  GettingStarted101
//
//  Created by Ryan Xu on 3/10/18.
//  Copyright © 2018 Ryan Xu. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    var turn: Int = 1
    var gameScene: GameScene!
    var items: [String: Int] = [String: Int] ()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill

                if let gameScene = scene as? GameScene {
                    gameScene.viewController = self
                    self.gameScene = gameScene
                }
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
  
    }
    
    func placeItem(block: SKNode) {
        guard let name = block.name else {
            return
        }
        if let _ = items[name] {
            print("sorry, you cannot place at this block so you are scary and wierd")
            return
        }
        
        if turn == 1 {
            gameScene.makeCrossInPosition(node: block)
            items[name] = 1
            turn = 2
        }
        else if turn == 2 {
            gameScene.makeCircleInPosition(node: block)
            items[name] = 2
            turn = 1
        }
    }
    
    
}
