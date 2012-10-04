//
//  RWAppSheetsController.h
//  RagaWriterMaster
//
//  Created by kurushetra on 27/09/12.
//  Copyright (c) 2012 luis sintes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RWSheetBoxView.h"
#import "RWRaga.h"
#import "RWScoreData.h"

@interface RWRagaWriterController : NSObject

    ////_Propertys
@property(nonatomic,strong) RWRaga *raga;

     ////_Class Methods
+(RWSheetBoxView*)cellForRowNumberAndLine:(NSInteger)rowNumber line:(NSInteger)theLine;
    ////_Instance Methods
-(NSInteger)getArrayDataForLine:(NSInteger)line;
-(void)newRagaFromRagaAndTaal:(NSString*)raga taal:(NSNumber*)taal;
- (void)createSheetWithBytes:(NSNumber*)taalBytes;

@end
