import SpriteKit

public class SpaceLayer : SKNode {
    var layer = SKSpriteNode()
    
    public init (size: CGSize) {
        super.init()
        createLayers(position: CGPoint (x: size.width / 2, y: size.height / 2))
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createLayers (position: CGPoint) {
//        let background = UIImage(named: "Space/Space")
//        let filter = CIFilter(name: "CIColorInvert")
//        
//        filter?.setValue(CIImage(image: background!), forKey: kCIInputImageKey)
//        let texture = SKTexture(image: UIImage(ciImage: (filter?.outputImage)!))
//        let newBackground = SKSpriteNode(texture: texture)

        let newBackground = SKSpriteNode(imageNamed: "Space/Space.png")
        newBackground.zPosition = 1
        layer = newBackground
        layer.setScale(0.3)
        layer.texture?.filteringMode = .nearest
        layer.position = position
        
        self.addChild(layer)
    }
}
