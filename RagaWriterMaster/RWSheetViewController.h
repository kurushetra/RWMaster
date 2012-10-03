//
//  LSViewController.h
//  ColectionControlerConStoryBoard
//
//  Created by kurushetra on 24/09/12.
//  Copyright (c) 2012 kurushetra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RWRagaWriterController.h"

@interface RWSheetViewController : UICollectionViewController

@property (nonatomic, strong) RWRagaWriterController *ragaWriter;
@property (nonatomic, strong) NSArray *sheetsNotes;
@property (nonatomic, strong) NSString *thaatName;
@property (nonatomic, strong) NSNumber *thaatBytes;
 
 

@end
