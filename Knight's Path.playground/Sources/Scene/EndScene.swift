import UIKit
import SpriteKit

public class EndScene : SKScene {
    let endSceneLayer : EndSceneLayer?
    
    public override init(size: CGSize) {
        self.endSceneLayer = EndSceneLayer(size: size)
        super.init(size: size)
        
        self.addChild(self.endSceneLayer!)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EndScene : SKPhysicsContactDelegate {
    public func didBegin(_ contact: SKPhysicsContact) {
    }
}
