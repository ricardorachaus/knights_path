import SpriteKit

public class GameObject : SKSpriteNode {
    public init (position: CGPoint, texture: SKTexture) {
        super.init(texture: texture, color: .clear, size: texture.size())
        self.position = position
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func randomRange (_ range: ClosedRange<Int>) -> Int {
        return Int(arc4random()) / Int(UInt64(UINT32_MAX)) * (range.upperBound - range.lowerBound) + range.lowerBound
    }
    
    func randomValue (min: Int, max: Int) -> Int {
        return randomRange(min...max)
    }
}


