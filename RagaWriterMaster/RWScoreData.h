//
//  RWScoreData.h
//  RagaWriterMaster
//
//  Created by kurushetra on 03/10/12.
//  Copyright (c) 2012 luis sintes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RWScoreData : NSObject

@property (strong,nonatomic)  NSArray *allLinesData;

- (void)prepareDataToShow:(NSInteger)taalNeededBoxes;
-(NSInteger)indexNeededForLine:(NSInteger)line;
-(UIView*)cellForRowNumberAndLine:(NSInteger)rowNumber line:(NSInteger)theLine;

@end
