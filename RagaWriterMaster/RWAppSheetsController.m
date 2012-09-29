      //
      //  RWAppSheetsController.m
      //  RagaWriterMaster
      //
      //  Created by kurushetra on 27/09/12.
      //  Copyright (c) 2012 luis sintes. All rights reserved.
      //

#import "RWAppSheetsController.h"
#import "RWAppDelegate.h"
#import "RWTaal.h"
#import "RWSheet.h"

@implementation RWAppSheetsController

RWAppDelegate *sheetsDataStore;

- (id)init
{
      self = [super init];
      if (self) {
            _raga = [[RWRaga alloc]init];
            _collectionFlowLayout = [UICollectionViewFlowLayout new];
            sheetsDataStore = (RWAppDelegate *)[UIApplication sharedApplication].delegate;
      }
      return self;
}
- (void)prepareSheetsDataToShow {
      
            //// se crean los datos para los cellsviewscollection...
      
      NSArray *theDataToShow = [NSArray new];
      
      NSMutableArray *taalNumbers = [NSMutableArray new];
      
      for (int i = 1; i <= _taalNeededBoxes.intValue; i++) {
            
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
      
      theDataToShow = [[NSArray alloc] initWithObjects:taalNumbers,taalSumLabels,ragaNotesData,noteStrokesType,tablaHitsData,nil];
      
      sheetsDataStore.sheetData = theDataToShow;
      
      
}
-(void)createSheetWithCossedTaal:(id)theChoosedTaal {
      
      _raga.taal = [self taalFromChossedTaal:theChoosedTaal];
      _taalNeededBoxes = _raga.taal.taalNeededBoxes;
      _collectionFlowLayout = [self collectionViewLayoutFromTaal:_raga.taal];
      
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
