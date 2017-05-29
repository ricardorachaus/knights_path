import SpriteKit

public class GameScene : SKScene {
    let gameLayer : GameLayer?
    let backgroundLayer : BackgroundLayer?
    
    public override init(size: CGSize) {
        self.gameLayer = GameLayer(size: size)
        self.backgroundLayer = BackgroundLayer(size: size)
        super.init(size: size)
        
        self.physicsWorld.contactDelegate = self
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        self.addChild(self.backgroundLayer!)
        self.addChild(self.gameLayer!)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GameScene {
    public override func touchesBegan(with event: NSEvent) {
    }
    
    public override func touchesMoved(with event: NSEvent) {
        // o que eu ainda não sei
    }
    
    public override func touchesEnded(with event: NSEvent) {
        // o que eu ainda não sei
    }
}


extension GameScene : SKPhysicsContactDelegate {
    public func didBegin(_ contact: SKPhysicsContact) {
        print (contact)
    }
}

