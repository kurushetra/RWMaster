//
//  RWRaga.h
//  RagaWriter
//
//  Created by luis sintes on 16/09/12.
//  Copyright (c) 2012 luis sintes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RWTaal.h"
#import "RWSheet.h"

@interface RWRaga : NSObject

@property (strong,nonatomic) NSString *RagaName;
@property (strong,nonatomic) NSString *RagaSpeed;
@property (strong,nonatomic) NSString *RagaScale;
@property (strong,nonatomic) RWTaal   *taal;

@property (strong,nonatomic) NSString *RagaPlayTime;
@property (nonatomic,retain) NSArray *Ascendent;
@property (nonatomic,retain) NSArray *Descendent;
@property (nonatomic,retain) NSArray *CatchNotes;
@property (nonatomic,retain) NSArray *DroneNotes;

@property (nonatomic,retain) NSMutableArray *ragaSheets;

- (void)addSheet:(RWSheet*)aSheet;
//- (id)initWithRaga:(NSString*)aRaga;
//- (void)playRaga;

@end
