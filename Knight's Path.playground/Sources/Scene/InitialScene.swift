import UIKit
import SpriteKit

public class InitialScene : SKScene {
    let initialLayer : InitialLayer?
    
    public override init(size: CGSize) {
        self.initialLayer = InitialLayer(size: size)
        super.init(size: size)
        
        self.addChild(self.initialLayer!)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension InitialScene {
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let location = touches.first?.location(in: self)
        
        let node = self.nodes(at: location!).first
        
        if node != nil {
            let gameScene = GameScene (size: self.size)
            let transition = SKTransition.fade(withDuration: 0.5)
            gameScene.scaleMode = SKSceneScaleMode.aspectFill
            self.scene!.view?.presentScene(gameScene, transition: transition)
        }
    }
}

extension InitialScene : SKPhysicsContactDelegate {
    public func didBegin(_ contact: SKPhysicsContact) {
    }
}
