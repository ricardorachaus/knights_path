import SpriteKit

public class Knight : GameObject {
    
    var knightTextures = [SKTexture]()
    
    init (position: CGPoint) {
        for index in 1...5 {
            let texture = SKTexture(imageNamed: "Knight/\(index).png")
            texture.filteringMode = .nearest
            knightTextures.append(texture)
        }
        
        super.init(position: position, texture: knightTextures.first!)
        setupPhysicsBody()
        self.name = "knight"
        self.run(animateKnight())
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupPhysicsBody() {
        self.physicsBody = SKPhysicsBody(texture: self.texture!, size: self.size)
        self.physicsBody?.affectedByGravity = true
        self.physicsBody?.allowsRotation = false
    }
    
    func animateKnight () -> SKAction {
        let animate = SKAction.animate(with: knightTextures, timePerFrame: 0.1)
        let repeatAnimationForever = SKAction.repeatForever(animate)
        return repeatAnimationForever
    }
}
