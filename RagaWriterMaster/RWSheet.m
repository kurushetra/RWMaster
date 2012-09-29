//
//  RWSheet.m
//  RagaWriterMaster
//
//  Created by kurushetra on 27/09/12.
//  Copyright (c) 2012 luis sintes. All rights reserved.
//

#import "RWSheet.h"
 

@implementation RWSheet

NSNumber *taalNeededBoxes;

- (id)initWithBytes:(NSNumber*)taalBytes
{
      self = [super init];
      if (self) {
            taalNeededBoxes = taalBytes;
            [self createSheetWithCossedTaal:taalBytes];
            [self prepareSheetsDataToShow];
            
      }
      return self;
}

-(void)createSheetWithCossedTaal:(id)theChoosedTaal {
      
      _sheetTaal = [self taalFromChossedTaal:theChoosedTaal];
      taalNeededBoxes = _sheetTaal.taalNeededBoxes;
      _collectionFlowLayout = [self collectionViewLayoutFromTaal:_sheetTaal];
      
}

-(RWTaal*)taalFromChossedTaal:(id)theChoosedTaal {
      
      RWTaal *choosedTaal;
      
      if ([theChoosedTaal isKindOfClass:[NSString class]]) {
            
            choosedTaal = [[RWTaal alloc]initWithTaalFromName:theChoosedTaal];
            
            
      }else if ([theChoosedTaal isKindOfClass:[NSNumber class]]) {
            
            choosedTaal = [[RWTaal alloc]initWithTaalFromBytes:theChoosedTaal];
            
      }else {
            NSLog(@"The Object passed to RWAppSheetsController-collectionViewLayoutFromTaal:choosedTaal is not ha valid Object...");
      }
      
      return  choosedTaal;
}

- (void)prepareSheetsDataToShow {
      
            //// se crean los datos para los cellsviewscollection...
      
       NSMutableArray *taalNumbers = [NSMutableArray new];
      
      for (int i = 1; i <= taalNeededBoxes.intValue; i++) {
            
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
       ,@"dha",@"tin",@"tin",@"dha",@"dha",@"ta",@"kita",@"dhum"]];
      
      _theDataToShow = [[NSArray alloc] initWithObjects:taalNumbers,taalSumLabels,ragaNotesData,noteStrokesType,tablaHitsData,nil];
      
       
      
      
}
 -(UICollectionViewFlowLayout*)collectionViewLayoutFromTaal:(RWTaal*)theTaal {
      
      CGRect screenRect = [[UIScreen mainScreen] bounds];
      CGFloat screenHeight = screenRect.size.height;
      
      int cellsHeight = 60 * theTaal.taalBytes.intValue;
      int freeSpace = screenHeight - cellsHeight;
      int resultSideSpace = (freeSpace / 2) - (theTaal.taalBytes.intValue / 2);
      
      UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
      [flowLayout setItemSize:CGSizeMake(60,60)];
      [flowLayout setMinimumInteritemSpacing:1];
      [flowLayout setMinimumLineSpacing:2];
      [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
      [flowLayout setHeaderReferenceSize: CGSizeMake(512,97)];
      [flowLayout setFooterReferenceSize:CGSizeMake(512, 117)];
      [flowLayout setSectionInset:UIEdgeInsetsMake(50.0,resultSideSpace,263.0,resultSideSpace)];
      
      return flowLayout;
      
}


@end
