    //
    //  RWTala.m
    //  RagaWriter
    //
    //  Created by luis sintes on 16/09/12.
    //  Copyright (c) 2012 luis sintes. All rights reserved.
    //

#import "RWTaal.h"

@implementation RWTaal

NSDictionary *taalsListDict;

- (id)initWithTaalFromName:(NSString *)theTaalName
{
    self = [super init];
    if (self) {
        
        _taalName = theTaalName;
        taalsListDict = [[NSDictionary alloc]init];
        taalsListDict = @{ @"teenTaal":@16 ,@"ekTaal":@12,@"jhap":@10,@"keharwa":@8,@"roopak":@7,@"dadraTaal":@6};
        
        [self createNewTaalFromName:_taalName];
        
    }
    return self;
}
- (id)initWithTaalFromBytes:(NSNumber*)theTaalBytes
{
    self = [super init];
    if (self) {
        
        _taalBytes = theTaalBytes;
        taalsListDict = [[NSDictionary alloc]init];
        taalsListDict = @{ @"16":@"teenTaal" ,@"12":@"ekTaal",@"10":@"jhap",@"8":@"keharwa",@"7":@"roopak",@"6":@"dadraTaal"};
        
        [self createNewTaalFromBytes:theTaalBytes];
        
    }
    return self;
}

-(void)createNewTaalFromName:(NSString*)aTaalName {
    
    _taalBytes = [taalsListDict objectForKey:aTaalName];
    _taalNeededBoxes = [NSNumber numberWithInt:_taalBytes.intValue * 7];
    
}
-(void)createNewTaalFromBytes:(NSNumber*)theTaalBytes {
    
    _taalName = [taalsListDict objectForKey:theTaalBytes];
    _taalNeededBoxes = [NSNumber numberWithInt:_taalBytes.intValue * 7];
    
}














@end
