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
        //        appDelagate = (RWAppDelegate *)[UIApplication sharedApplication].delegate;
    }
    return self;
}
-(void)newRagaFromRagaAndTaal:(NSString*)ragaName taal:(NSNumber*)ragataal {
    
    _raga = [[RWRaga alloc]initWithNameAndTaal:ragaName taal:ragataal];
    [_raga prepareScore];
    
}
-(NSInteger)getArrayDataForLine:(NSInteger)line {
  
    
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
