//
//  PhysicsBodyQueueDestroyer.m
//
//  Created by Craig Fortune on 04/08/2012.
//

#import "CFPhysicsBodyQueueDestroyer.h"

@implementation CFPhysicsBodyQueueDestroyer

+ (id) createWithWorld:(b2World*)world
{
	id object = [CFPhysicsBodyQueueDestroyer singleton];
	[object setWorld:world];
	
	return object;
}

// Only allow objects that follow the CFPhysicsQueueProtocol to
// be added to the queue
- (BOOL) addToQueue:(id<CFPhysicsQueueProtocol>)object
{
	// No b2World set? Refuse to accept the object
    if(!self.world)
        return NO;
    
    // Stability
	b2Body* body = object.body;
	if(!self.world->IsLocked())
		body->SetActive(false);
	
	// Is the object already in our queue? If so,
	// don't add it to the queue again
	if(![self.destroyQueueArr containsObject:object])
	{
		[self.destroyQueueArr addObject:object];
	}
	
	// object now in queue
	return YES;
}

// Overriding the CFQueueDestroyer emptyQueue to destroy the
// b2Body* object using the b2World* object
- (BOOL) emptyQueue
{
	NSAssert([self world], @"No b2World reference set in PhysicsBodyDestroyer");
    
	for(id<CFPhysicsQueueProtocol> obj in self.destroyQueueArr)
	{
		b2Body* body = obj.body;
        self.world->DestroyBody(body);
	}
    
    [self.destroyQueueArr removeAllObjects];
	
	return true;
}

//
- (void) dealloc
{
	// For the sake of tidiness
	[self setWorld:nil];
	[super dealloc];
}

@end
