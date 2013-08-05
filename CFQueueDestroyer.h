//
//  QueueDestroyer.h
//
//  Created by Craig Fortune on 04/08/2012.
//

#import <Foundation/Foundation.h>
#import "box2d.h"

// Base that that provides singleton management
// and simple queue management
@interface CFQueueDestroyer : NSObject

// There isn't an NSQueue class, but an NSMutableArray
// serves our needs just fine
@property (retain) NSMutableArray* destroyQueueArr;

// Singleton creation and destruction
+ (CFQueueDestroyer*) singleton;
+ (void) destroy;

// Simple default interface for adding and emptying
// the queue
- (BOOL) addToQueue:(id)object;
// emptyQueue should be done upon every simulation
// update if possible/sensible to do so
- (BOOL) emptyQueue;

@end
