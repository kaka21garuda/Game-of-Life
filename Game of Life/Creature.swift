//
//  Creature.swift
//  Game of Life
//
//  Created by Buka Cakrawala on 6/27/16.
//  Copyright © 2016 Buka Cakrawala. All rights reserved.
//

import SpriteKit

class Creature: SKSpriteNode {
    //character side
    var isAlive: Bool = false {
        didSet {
            //visibility
            hidden != isAlive
        }
    }
    
    //Living neighbor counter
    var neighborCount = 0
    
    init() {
        /* Initialize with 'bubble' asset */
        let texture = SKTexture(imageNamed: "bubble")
        super.init(texture: texture, color: UIColor.clearColor(), size: texture.size())
        
        /* Set Z-Position, ensure it's on top of grid */
        zPosition = 1
        
        /* Set anchor point to bottom-left */
        anchorPoint = CGPoint(x: 0, y: 0)
    }
    
    /* You are required to implement this for your subclass to work */
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
