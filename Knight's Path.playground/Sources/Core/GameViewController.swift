import SpriteKit

public class GameViewController : SKView {
    public override init (frame: CGRect) {
        super.init(frame: frame)
        
        self.showsPhysics = false
        
        let scene = InitialScene(size: frame.size)
        
        self.presentScene(scene)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

