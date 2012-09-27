//
//  RWRaga.m
//  RagaWriter
//
//  Created by luis sintes on 16/09/12.
//  Copyright (c) 2012 luis sintes. All rights reserved.
//

#import "RWRaga.h"

@implementation RWRaga



- (id)initWithRaga:(NSString*)aRaga
{
    self = [super init];
    if (self) {
        
    }
    return self;
}
-(id)initWithName:(NSString*)theName Speed:(NSString*)theSpeed Scale:(NSString*)theScale Tala:(NSString*)theTala
{
      self = [super init];
      if (self) {
            _RagaName = theName;
            _RagaSpeed = theSpeed;
            _RagaScale = theScale;
//            _taal = theTala;
          
      }
      return self;
}



- (void)playRaga {
}

@end
