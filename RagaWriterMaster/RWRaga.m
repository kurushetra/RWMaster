      //
      //  RWRaga.m
      //  RagaWriter
      //
      //  Created by luis sintes on 16/09/12.
      //  Copyright (c) 2012 luis sintes. All rights reserved.
      //

#import "RWRaga.h"
#import "RWSheet.h"

@implementation RWRaga

- (id)initWithNameAndTaal:(NSString *)ragaName taal:(NSNumber*)ragaTaal 
{
      self = [super init];
      if (self) {
          
          _ragaSheets = [NSMutableArray new];
          _scoreData = [[RWScoreData alloc]init];
          _taal = [[RWTaal alloc]init];
          
          _ragaName = ragaName;
          _taal.taalBytes = ragaTaal;
            
      }
      return self;
}
-(void)prepareScore {
    
    RWSheet *newSheet = [[RWSheet alloc]initWithBytes:_taal.taalBytes];
    [self addSheet:newSheet];
    
    [_scoreData prepareDataToShow:_taal.taalNeededBoxes.intValue];     
    _viewLayout = newSheet.collectionFlowLayout;

}
- (void)addSheet:(RWSheet*)aSheet  {
      
      [_ragaSheets addObject:aSheet];
      
}

@end
