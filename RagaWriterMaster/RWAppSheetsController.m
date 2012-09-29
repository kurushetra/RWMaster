      //
      //  RWAppSheetsController.m
      //  RagaWriterMaster
      //
      //  Created by kurushetra on 27/09/12.
      //  Copyright (c) 2012 luis sintes. All rights reserved.
      //

#import "RWAppSheetsController.h"
#import "RWAppDelegate.h"
#import "RWSheet.h"

@implementation RWAppSheetsController

RWAppDelegate *sheetsDataStore;

- (id)init 
{
      self = [super init];
      if (self) {
            _raga = [[RWRaga alloc]init];
            sheetsDataStore = (RWAppDelegate *)[UIApplication sharedApplication].delegate;
            
      }
      return self;
}
 
- (void)createSheetWithBytes:(NSNumber*)taalBytes {
      
      RWSheet *newSheet = [[RWSheet alloc]initWithBytes:taalBytes];
      [_raga addSheet:newSheet];
      _raga.taal = newSheet.sheetTaal;
      
      _viewLayout = newSheet.collectionFlowLayout;
      sheetsDataStore.sheetData = newSheet.theDataToShow;
      
}




@end
