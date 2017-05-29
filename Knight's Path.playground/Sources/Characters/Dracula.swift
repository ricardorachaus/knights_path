import SpriteKit

public class Dracula : GameObject {
    var draculaTexture = SKTexture()
    
    init(position: CGPoint) {
        let texture = SKTexture (imageNamed: "Dracula/Dracula")
        texture.filteringMode = .nearest
        draculaTexture = texture
        
        super.init(position: position, texture: draculaTexture)
        setupPhysicsBody()
        self.run(animateDracula())
        self.applyImpulse(time: 2)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupPhysicsBody() {
        self.physicsBody = SKPhysicsBody(texture: self.texture!, size: self.size)
        self.physicsBody?.affectedByGravity = true
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.mass = 1
    }
    
    func animateDracula () -> SKAction {
        let animate = SKAction.animate(with: [draculaTexture], timePerFrame: 0.1)
        let repeatAnimationForever = SKAction.repeatForever(animate)
        return repeatAnimationForever
    }
    
    func applyImpulse (time: TimeInterval) {
        let applyImpulse = SKAction.applyImpulse(CGVector(dx: self.randomValue(min: -500, max: 500), dy: self.randomValue(min: 0, max: 1000)), duration: time)
        let wait = SKAction.wait(forDuration: time)
        let sequence = SKAction.sequence([applyImpulse, wait])
        let repeatForever = SKAction.repeatForever(sequence)
        self.run(repeatForever)
    }
}
