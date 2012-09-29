//
//  RWSheet.h
//  RagaWriterMaster
//
//  Created by kurushetra on 27/09/12.
//  Copyright (c) 2012 luis sintes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RWTaal.h"

@interface RWSheet : NSObject

@property (nonatomic,retain) RWTaal *sheetTaal;
@property(nonatomic,retain) UICollectionViewFlowLayout *collectionFlowLayout;
@property(nonatomic,retain)  NSArray *theDataToShow;


- (id)initWithBytes:(NSNumber*)taalBytes;
- (void)createSheetWithCossedTaal:(id)theChoosedTaal;
- (void)prepareSheetsDataToShow;
 

@end
