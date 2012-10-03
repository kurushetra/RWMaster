    //
    //  RWAppSheetsController.m
    //  RagaWriterMaster
    //
    //  Created by kurushetra on 27/09/12.
    //  Copyright (c) 2012 luis sintes. All rights reserved.
    //

#import "RWRagaWriterController.h"
#import "RWSheet.h"

@implementation RWRagaWriterController

 
- (id)init
{
    self = [super init];
    if (self) {
            //TODO: puede que no haga falta inicializarlos propertyes.
        
        
        //        appDelagate = (RWAppDelegate *)[UIApplication sharedApplication].delegate;
    }
    return self;
}
-(void)newRagaFromRagaAndTaal:(NSString*)ragaName taal:(NSNumber*)ragataal {
    
    _raga = [[RWRaga alloc]initWithNameAndTaal:ragaName taal:ragataal];
    [_raga prepareScore];
    
//    RWSheet *newSheet = [[RWSheet alloc]initWithBytes:taal];
//    [_raga addSheet:newSheet];
//    _raga.RagaName = raga;
//    _raga.taal = newSheet.sheetTaal;
//    [_raga.scoreData prepareDataToShow:_raga.taal.taalNeededBoxes.intValue];//TODO: debera estar fuera de aqui.
//    
//    //---------------------------------------------------------------
//    _viewLayout = newSheet.collectionFlowLayout;
    
    
}
+(NSInteger)indexNeededForLine:(NSInteger)line {
    
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
+(UIView*)cellForRowNumberAndLine:(NSInteger)rowNumber line:(NSInteger)theLine {
    
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
- (void)createSheetWithBytes:(NSNumber*)taalBytes {
    
        //      RWSheet *newSheet = [[RWSheet alloc]initWithBytes:taalBytes];
        //      [_raga addSheet:newSheet];
        //      _raga.taal = newSheet.sheetTaal;
        //
        //      _viewLayout = newSheet.collectionFlowLayout;
        //      sheetsDataStore.sheetData = newSheet.theDataToShow;
    
    
}
@end
