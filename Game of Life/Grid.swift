//
//  Grid.swift
//  Game of Life
//
//  Created by Buka Cakrawala on 6/27/16.
//  Copyright © 2016 Buka Cakrawala. All rights reserved.
//

import SpriteKit

class Grid: SKSpriteNode {
    var gridArray = [[Creature]] ()
    //Grid array dimensions
    let rows = 8
    let columns = 10
    var population = 0
    var generation = 0
    
    //individual cell dimension, calculated in setup
    var cellWidth = 0
    var cellHeight = 0

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        //called whenever touches begin
        
        //There'll be only one touch as multi touch is not enabled by default
        for touch in touches {
            //Grab position of touch relative to the grid
            let location = touch.locationInNode(self)
            
            /* Calculate grid array position */
            let gridX = Int(location.x) / cellWidth
            let gridY = Int(location.y) / cellHeight
            
            /* Toggle creature visibility */
            let creature = gridArray[gridX][gridY]
            creature.isAlive = !creature.isAlive
        }
        
    }
    
    //We need to implement this in order for our Subclass to work
    /*
     required init?(coder aDecoder: NSCoder) {
     super.init(coder: aDecoder)
     
     /* Enable own touch implementation for this node */
     userInteractionEnabled = true
     
     /* Calculate individual cell dimensions */
     cellWidth = Int(size.width) / columns
     cellHeight = Int(size.height) / rows
     
     }
    */
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //Enable own touch implementation for this node
        userInteractionEnabled = true
        
        //Calculate individual cell dimensions
        cellWidth = Int(size.width)/columns
        cellHeight = Int(size.height)/rows
        
        populateGrid()

        
    }
    
    func populateGrid() {
        /* Populate the grid with creatures */
        
        /* Loop through columns */
        for gridX in 0..<columns {
            
            /* Initialize empty column */
            gridArray.append([])
            
            /* Loop through rows */
            for gridY in 0..<rows {
                
                /* Create a new creature at row / column position */
                addCreatureAtGrid(x:gridX, y:gridY)
            }
        }
    }
    
    func addCreatureAtGrid(x x: Int, y: Int) {
        /* Add a new creature at grid position*/
        
        /* New creature object */
        let creature = Creature()
        
        /* Calculate position on screen */
        let gridPosition = CGPoint(x: x*cellWidth, y: y*cellWidth)
        creature.position = gridPosition
        
        /* Set default isAlive */
        creature.isAlive = false
        
        /* Add creature to grid node */
        addChild(creature)
        
        /* Add creature to grid array */
        gridArray[x].append(creature)
    }
}



