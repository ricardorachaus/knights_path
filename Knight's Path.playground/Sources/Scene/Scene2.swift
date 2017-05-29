import UIKit
import SpriteKit

public class Scene2 : SKScene {
    let gameLayer : GameLayer?
    let backgroundLayer : BackgroundLayer?
    let obstacle1Layer : Obstacle1Layer?
    let obstacle2Layer : Obstacle2Layer?
    
    public override func didMove(to view: SKView) {
        
        view.addGestureRecognizer(swipeRightAnswer())
        view.addGestureRecognizer(swipeLeftAnswer())
        view.addGestureRecognizer(swipeUpAnswer())
        
    }
    
    public override init(size: CGSize) {
        self.gameLayer = GameLayer(size: size)
        self.backgroundLayer = BackgroundLayer(size: size)
        self.obstacle1Layer = Obstacle1Layer(size: size)
        self.obstacle2Layer = Obstacle2Layer(size: size)
        super.init(size: size)
        
        self.physicsWorld.contactDelegate = self
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        self.addChild(self.backgroundLayer!)
        self.addChild(self.gameLayer!)
        self.addChild(self.obstacle1Layer!)
        self.addChild(self.obstacle2Layer!)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func changeScene (location: CGPoint) {
        if (location.x >= 220) {
            let nextScene = Scene3 (size: size)
            let transition = SKTransition.fade(withDuration: 0.5)
            nextScene.scaleMode = SKSceneScaleMode.aspectFill
            self.scene!.view?.presentScene(nextScene, transition: transition)
        }
    }
    
    func swipeRightAnswer () -> UISwipeGestureRecognizer{
        let swipe = UISwipeGestureRecognizer (target: self, action: #selector(respondToSwipeGesture(gesture:)))
        swipe.direction = [.right]
        
        return swipe
    }
    
    func swipeLeftAnswer () -> UISwipeGestureRecognizer{
        let swipe = UISwipeGestureRecognizer (target: self, action: #selector(respondToSwipeGesture(gesture:)))
        swipe.direction = [.left]
        
        return swipe
    }
    
    func swipeUpAnswer () -> UISwipeGestureRecognizer {
        let swipe = UISwipeGestureRecognizer (target: self, action: #selector(respondToSwipeGesture(gesture:)))
        swipe.direction = [.up]
        
        return swipe
    }
    
    func respondToSwipeGesture (gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.right:
                self.gameLayer?.knight?.physicsBody?.applyImpulse(CGVector(dx: 30, dy: 0))
            case UISwipeGestureRecognizerDirection.left:
                self.gameLayer?.knight?.physicsBody?.applyImpulse(CGVector(dx: -30, dy: 0))
            case UISwipeGestureRecognizerDirection.up:
                self.gameLayer?.knight?.physicsBody?.applyImpulse(CGVector(dx: 30, dy: 80))
            default:
                break
            }
        }
    }
}

extension Scene2 {
    public override func update(_ currentTime: TimeInterval) {
        changeScene(location: (gameLayer?.knight?.position)!)
    }
}


extension Scene2 : SKPhysicsContactDelegate {
    public func didBegin(_ contact: SKPhysicsContact) {
        let allBodies = contact.bodyB.allContactedBodies()
        
        for body in allBodies {
            if (body.categoryBitMask == 2) {
                let nextScene = GameOver (size: size)
                let transition = SKTransition.fade(withDuration: 0.5)
                nextScene.scaleMode = SKSceneScaleMode.aspectFill
                self.scene!.view?.presentScene(nextScene, transition: transition)
            }
        }
    }
}

