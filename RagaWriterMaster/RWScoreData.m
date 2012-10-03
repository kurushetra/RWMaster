//
//  RWScoreData.m
//  RagaWriterMaster
//
//  Created by kurushetra on 03/10/12.
//  Copyright (c) 2012 luis sintes. All rights reserved.
//

#import "RWScoreData.h"
#import "RWAppDelegate.h"

@implementation RWScoreData

RWAppDelegate *appDelegate;

- (id)init
{
    self = [super init];
    if (self) {
         appDelegate = (RWAppDelegate *)[UIApplication sharedApplication].delegate;
         
    }
    return self;
}
- (void)prepareDataToShow:(NSInteger)taalNeededBoxes {
    
         //// se crean los datos para los cellsviewscollection...
    
    NSMutableArray *taalNumbers = [NSMutableArray new];
    
    NSLog(@"taalNeededBoxes = %i ",taalNeededBoxes);
    for (int i = 1; i <= taalNeededBoxes; i++) {
        
        [taalNumbers addObject:[NSString stringWithFormat:@"%d",i]];
    }
    
    NSMutableArray *taalSumLabels = [NSMutableArray new];
    [taalSumLabels addObjectsFromArray:@[@1,@3,@"+",@0,@1,@3,@"+",@0,@1,@3,@"+",@0,@1,@3,@"+",@0]];
    
    NSMutableArray *ragaNotesData = [NSMutableArray new];
    [ragaNotesData addObjectsFromArray:@[@"Sa",@"Re",@"--",@"Sa",@"Sa",@"Re",@"--",@"Sa"
     ,@"Sa",@"Re",@"--",@"Sa",@"Sa",@"Re",@"--",@"Sa"]];
    
    NSMutableArray *noteStrokesType = [NSMutableArray new];
    [noteStrokesType addObjectsFromArray:@[@"dir",@"ra",@"dir",@"ra",@"dir",@"dara",@"ra",@"da"
     ,@"da",@"da",@"diri",@"dara",@"dir",@"dir",@"ra",@"dir"]];
    
    NSMutableArray *tablaHitsData = [NSMutableArray new];
    [tablaHitsData addObjectsFromArray:@[@"dha",@"din",@"din",@"dha",@"dha",@"din",@"din",@"dha"
     ,@"dha",@"tin",@"tin",@"dha",@"dha",@"ta",@"kita",@"dh"]];
    
     _allLinesData = [[NSArray alloc] initWithObjects:taalNumbers,taalSumLabels,ragaNotesData,noteStrokesType,tablaHitsData,nil];
     
}

@end
