import UIKit
import SpriteKit

public class SecretEndingScene : SKScene {
    let secretEndingLayer : SecretEndingLayer?
    
    public override init(size: CGSize) {
        self.secretEndingLayer = SecretEndingLayer(size: size)
        super.init(size: size)
        
        self.addChild(self.secretEndingLayer!)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SecretEndingScene : SKPhysicsContactDelegate {
    public func didBegin(_ contact: SKPhysicsContact) {
    }
}
