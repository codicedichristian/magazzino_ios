//
//  ConnectionManager.h
//  TCP_SAMPLE
//
//  Created by christian scorza on 06/04/16.
//  Copyright © 2016 christian scorza. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConnectionManagerDelegate.h"

@interface ConnectionManager : NSObject

@property (weak) id<ConnectionManagerDelegate> delegate;

+(ConnectionManager*)sharedInstance;
- (void)initNetworkCommunication;
-(void)closeStreams;
-(void)closeAllSocketsOnMainThread;
- (void)sendCommand:(NSString*)cmd withDelegate:(id<ConnectionManagerDelegate>) delegate;

@end
