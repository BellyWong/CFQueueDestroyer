//
//  PhysicsBodyQueueDestroyer.h
//
//  Created by Craig Fortune on 04/08/2012.
//

#import <Foundation/Foundation.h>
#import "box2d.h"
#import "CFQueueDestroyer.h"

// Objects that wish to be added to be handled by the 
// CFPhysicsQueueDestroyer should implement this protcol
@protocol CFPhysicsQueueProtocol <NSObject>
@property (assign) b2Body* body;
@end

// Inherits from CFQueueDestroyer
// Adds reference to b2World and a class initialisation
// method to be used within your setup phase.
// This queue should NOT be emptied mid physics tick!
@interface CFPhysicsBodyQueueDestroyer : CFQueueDestroyer

@property (assign) b2World* world;

+ (CFPhysicsBodyQueueDestroyer*) createWithWorld:(b2World*)world;
- (BOOL) addToQueue:(id<CFPhysicsQueueProtocol>)object;

@end
