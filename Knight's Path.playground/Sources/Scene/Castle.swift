import UIKit
import SpriteKit

public class Castle : SKScene {
    let gameLayer : GameLayer?
    let draculaLayer : DraculaLayer?
    let backgroundLayer : CastleLayer?
    
    public override func didMove(to view: SKView) {
        
        view.addGestureRecognizer(swipeRightAnswer())
        view.addGestureRecognizer(swipeLeftAnswer())
        view.addGestureRecognizer(swipeUpAnswer())
        
    }
    
    public override init(size: CGSize) {
        self.gameLayer = GameLayer(size: size)
        self.draculaLayer = DraculaLayer(size: size)
        self.backgroundLayer = CastleLayer(size: size)
        super.init(size: size)
        
        self.physicsWorld.contactDelegate = self
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        self.addChild(self.backgroundLayer!)
        self.addChild(self.gameLayer!)
        self.addChild(self.draculaLayer!)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func changeScene (location: CGPoint) {
        if (location.x >= 220) {
            let nextScene = SecretEndingScene (size: size)
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

extension Castle {
    public override func update(_ currentTime: TimeInterval) {
        changeScene(location: (gameLayer?.knight?.position)!)
    }
}


extension Castle : SKPhysicsContactDelegate {
    public func didBegin(_ contact: SKPhysicsContact) {
        let bodyA = contact.bodyA.node
        let bodyB = contact.bodyB.node
        let player = self.gameLayer?.knight
        
        if bodyA is Dracula && bodyB is Knight {
            player!.physicsBody?.applyImpulse(CGVector(dx: -30, dy: 30))
        }
        
        if bodyB is Dracula && bodyA is Knight {
            player!.physicsBody?.applyImpulse(CGVector(dx: -30, dy: 30))
        }
    }
}

