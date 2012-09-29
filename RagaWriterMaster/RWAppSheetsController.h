//
//  RWAppSheetsController.h
//  RagaWriterMaster
//
//  Created by kurushetra on 27/09/12.
//  Copyright (c) 2012 luis sintes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RWRaga.h"

@interface RWAppSheetsController : NSObject


@property(nonatomic,retain) RWRaga *raga;
@property(nonatomic,retain) UICollectionViewFlowLayout *viewLayout;

- (void)createSheetWithBytes:(NSNumber*)taalBytes;

@end
