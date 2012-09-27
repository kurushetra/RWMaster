//
//  RWTala.h
//  RagaWriter
//
//  Created by luis sintes on 16/09/12.
//  Copyright (c) 2012 luis sintes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RWTaal : NSObject


@property(nonatomic,retain) NSNumber *taalBytes;
@property(nonatomic,retain) NSNumber *taalNeededBoxes;
@property(nonatomic,retain) NSString *taalName;


- (id)initWithTaalFromName:(NSString *)theTaalName;
- (id)initWithTaalFromBytes:(NSNumber*)theTaalBytes;

@end
