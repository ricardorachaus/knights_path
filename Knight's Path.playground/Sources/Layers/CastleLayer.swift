import SpriteKit

public class CastleLayer : SKNode {
    var layer = SKSpriteNode()
    
    public init (size: CGSize) {
        super.init()
        createLayers(position: CGPoint (x: size.width / 2, y: size.height / 2))
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createLayers (position: CGPoint) {
        let background = SKSpriteNode(imageNamed: "Castle/Castle.png")
        
        background.zPosition = 1
        layer = background
        layer.setScale(0.3)
        layer.texture?.filteringMode = .nearest
        layer.position = position
        self.addChild(layer)
    }
}
