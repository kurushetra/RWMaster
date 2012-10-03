//
//  RWRaga.h
//  RagaWriter
//
//  Created by luis sintes on 16/09/12.
//  Copyright (c) 2012 luis sintes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RWTaal.h"
#import "RWScoreData.h"

@interface RWRaga : NSObject


@property (nonatomic,strong) RWTaal   *taal;
@property (nonatomic,strong) RWScoreData *scoreData;
@property (nonatomic,retain) NSMutableArray *ragaSheets;
@property(nonatomic,retain) UICollectionViewFlowLayout *viewLayout;

@property (strong,nonatomic) NSString *ragaName;
@property (strong,nonatomic) NSString *ragaSpeed;
@property (strong,nonatomic) NSString *ragaScale;
 
@property (strong,nonatomic) NSString *ragaPlayTime;
@property (nonatomic,retain) NSArray *ascendent;
@property (nonatomic,retain) NSArray *descendent;
@property (nonatomic,retain) NSArray *catchNotes;
@property (nonatomic,retain) NSArray *droneNotes;


- (id)initWithNameAndTaal:(NSString *)ragaName taal:(NSNumber*)ragaTaal;
-(void)prepareScore;
//- (void)addSheet:(RWSheet*)aSheet;

 

@end
