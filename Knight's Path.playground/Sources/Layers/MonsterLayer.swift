import SpriteKit

public class MonsterLayer : SKNode {
    var monster : Monster?
    
    public init(size: CGSize) {
        super.init()
        self.zPosition = 10
        self.createMonster(position: CGPoint(x: 150, y: size.height / 2))
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MonsterLayer {
    func createMonster(position: CGPoint) {
        monster = Monster(position: position)
        monster?.setScale(CGFloat(0.6))
        monster?.physicsBody?.categoryBitMask = 1
        monster?.physicsBody?.contactTestBitMask = 1
        self.addChild(monster!)
    }
}
