import SpriteKit

public class SecretEndingLayer : SKNode {
    var layer = SKSpriteNode()
    
    public init (size: CGSize) {
        super.init()
        createLayers(position: CGPoint (x: size.width / 2, y: size.height / 2))
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createLayers (position: CGPoint) {
        let background = SKSpriteNode(imageNamed: "Endings/SecretEnding.png")
        
        background.zPosition = 1
        layer = background
        layer.texture?.filteringMode = .nearest
        layer.position = position
        self.addChild(layer)
    }
}
