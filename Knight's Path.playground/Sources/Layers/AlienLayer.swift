import SpriteKit

public class AlienLayer : SKNode {
    var alien : Alien?
    
    public init(size: CGSize) {
        super.init()
        self.zPosition = 10
        self.createAlien(position: CGPoint(x: 150, y: size.height / 2))
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AlienLayer {
    func createAlien (position: CGPoint) {
        alien = Alien(position: position)
        alien?.setScale(CGFloat(0.4))
        alien?.physicsBody?.categoryBitMask = 1
        alien?.physicsBody?.contactTestBitMask = 1
        self.addChild(alien!)
    }
}
