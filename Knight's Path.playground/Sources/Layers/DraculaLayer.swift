import SpriteKit

public class DraculaLayer : SKNode {
    var dracula : Dracula?
    
    public init(size: CGSize) {
        super.init()
        self.zPosition = 10
        self.createDracula(position: CGPoint(x: 150, y: size.height / 2))
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DraculaLayer {
    func createDracula (position: CGPoint) {
        dracula = Dracula(position: position)
        dracula?.setScale(CGFloat(0.4))
        dracula?.physicsBody?.categoryBitMask = 1
        dracula?.physicsBody?.contactTestBitMask = 1
        self.addChild(dracula!)
    }
}
