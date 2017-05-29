import SpriteKit

public class BackgroundLayer : SKNode {
    var layers = [SKSpriteNode]()
    
    public init(size: CGSize) {
        super.init()
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createLayers (position: CGPoint) {
        let background = SKSpriteNode(imageNamed: "Forest/background.png")
        let frontGrass = SKSpriteNode(imageNamed: "Forest/frontGrass.png")
        let frontTrees = SKSpriteNode(imageNamed: "Forest/frontTrees.png")
        
        background.zPosition = 1
        frontGrass.zPosition = 2
        frontTrees.zPosition = 3
        
        layers.append(contentsOf: [background, frontGrass, frontTrees])
        
        for layer in layers {
            layer.texture?.filteringMode = .nearest
            layer.position = position
            self.addChild(layer)
        }
    }
}
