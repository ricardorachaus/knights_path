import SpriteKit

public class GameLayer : SKNode {
    var knight : Knight?
    
    public init(size: CGSize) {
        super.init()
        self.zPosition = 10
        self.createKnight(position: CGPoint(x: size.width / 2,y: size.height / 2))
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GameLayer {
    func createKnight (position: CGPoint) {
        knight = Knight(position: position)
        self.addChild(knight!)
    }
}
