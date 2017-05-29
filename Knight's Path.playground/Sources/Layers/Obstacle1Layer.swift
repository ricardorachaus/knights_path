import SpriteKit

public class Obstacle1Layer : SKNode {
    var obstacle = SKSpriteNode()
    
    public init (size: CGSize) {
        super.init()
        createLayers(position: CGPoint(x: 100, y: 30))
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createLayers (position: CGPoint) {
        let newObstacle = SKSpriteNode(imageNamed: "Obstacles/Spike.png")
        
        obstacle = newObstacle
        obstacle.zPosition = 5
        obstacle.texture?.filteringMode = .nearest
        obstacle.position = position
        obstacle.physicsBody = SKPhysicsBody(rectangleOf: obstacle.size)
        obstacle.physicsBody?.mass = 10000
        obstacle.physicsBody?.categoryBitMask = 1
        obstacle.physicsBody?.contactTestBitMask = 1
        self.addChild(obstacle)
    }
}
