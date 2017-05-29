import SpriteKit

public class GameLayer : SKNode {
    var knight : Knight?
    
    public init(size: CGSize) {
        super.init()
        self.zPosition = 10
        self.createKnight(position: CGPoint(x: 15, y: size.height / 2))
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GameLayer {
    func createKnight (position: CGPoint) {
        knight = Knight(position: position)
        knight?.setScale(0.3)
        knight?.xScale = -(knight?.xScale)!
        knight?.physicsBody?.categoryBitMask = 2
        knight?.physicsBody?.contactTestBitMask = 1
        self.addChild(knight!)
    }
}
