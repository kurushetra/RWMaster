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
-(NSInteger)indexNeededForLine:(NSInteger)line  {
    
    NSInteger dataArrayPosition;
    
    if ((line == 2) | (line == 4 )) {
        dataArrayPosition = 2;
    }
    if ((line == 3) | (line == 5 )) {
        dataArrayPosition = 3;
    }
    if (line == 6) {
        dataArrayPosition = 4;
    }
    if ((line == 0) | (line == 1 )) {
        dataArrayPosition = line;
    }
    
    return dataArrayPosition;
}
-(UIView*)cellForRowNumberAndLine:(NSInteger)rowNumber line:(NSInteger)theLine {
    
    UIView *cellChoosed = [UIView new];
    
        //// elije las celdas con borde grueso
    if ((rowNumber % 4) == 0 ) {
            // cellChoosed.backgroundView = View con Borde Izquierdo
    }
    else{
            //             nada si borde
    }
    if (theLine == 0)  {
        if (rowNumber == 0) {
                //    cell.backgroundView = View con Borde top Izquierdo
        }
        if (rowNumber == 15) {
                //    cell.backgroundView = View con Borde top derecho
            
        }
    }
    if (theLine == 6)  {
        
        if (rowNumber == 0) {
                //    cell.backgroundView = View con Borde botom Izquierdo
        }
        if (rowNumber == 15) {
                //    cell.backgroundView = View con Borde botom derecho
        }
    }
    
    return cellChoosed;
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
