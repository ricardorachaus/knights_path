import UIKit
import SpriteKit

public class GameOver : SKScene {
    
    public override init(size: CGSize) {
        super.init(size: size)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func changeScene () {
        let nextScene = GameScene (size: size)
        let transition = SKTransition.fade(withDuration: 0.5)
        nextScene.scaleMode = SKSceneScaleMode.aspectFill
        self.scene!.view?.presentScene(nextScene, transition: transition)
    }
}

extension GameOver {
    public override func update(_ currentTime: TimeInterval) {
        changeScene()
    }
}


