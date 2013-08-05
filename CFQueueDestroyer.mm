//
//  QueueDestroyer.m
//
//  Created by Craig Fortune on 04/08/2012.
//

#import "CFQueueDestroyer.h"

@implementation CFQueueDestroyer

// singleton stuff
static CFQueueDestroyer* _singleton = nil;

+ (id) singleton
{
	if (!_singleton)
	{
		_singleton = [[self alloc] init];
	}
	
	return _singleton;
}

+ (id) alloc
{
	NSAssert(_singleton == nil, @"Attempted to allocate a second instance of a singleton.");
	return [super alloc];
}


+ (void) destroy
{
	[_singleton release];
	_singleton = nil;
}

//

- (id) init
{
	if((self = [super init]))
	{
		// Capacity of 5 should be fine in most circumstances
		self.destroyQueueArr = [NSMutableArray arrayWithCapacity:5];
	}
	
	return self;
}

// Nothing fancy required
- (BOOL) emptyQueue
{
	[self.destroyQueueArr removeAllObjects];
	return true;
}

//
- (void) dealloc
{
	[self setDestroyQueueArr:nil];
	[super dealloc];
}

@end
