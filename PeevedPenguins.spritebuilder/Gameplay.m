//
//  Gameplay.m
//  PeevedPenguins
//
//  Created by Terrance Griffith on 6/25/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Gameplay.h"

@implementation Gameplay

CCPhysicsNode *_physicsNode;
CCNode *_catapultArm;

//Called when CCB file finishes loading
-(void)didLoadFromCCB{
    //tells this scene to accept touches
    self.userInteractionEnabled = true;
}

//Called on every touch in the scene
-(void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    [self launchPenguin];
}

-(void)launchPenguin{
    //loads the Penguin.ccb we have set up in SpriteBuilder
    CCNode* penguin = [CCBReader load:@"Penguin"];
    
    //positions the penguin at the bowl of the catapult
    penguin.position = ccpAdd(_catapultArm.position, ccp(16, 50));
    
    //add the penguin to the physiceNode of this scene (because it has physics enabled)
    [_physicsNode addChild:penguin];
    
    //manually create & apply a force to launch the penguin
    CGPoint launchDirection = ccp(1, 0);
    CGPoint force = ccpMult(launchDirection, 8000);
    [penguin.physicsBody applForce:force];
}

@end
