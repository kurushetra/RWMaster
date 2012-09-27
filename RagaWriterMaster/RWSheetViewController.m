      //
      //  LSViewController.m
      //  ColectionControlerConStoryBoard
      //
      //  Created by kurushetra on 24/09/12.
      //  Copyright (c) 2012 kurushetra. All rights reserved.
      //

#import "RWSheetViewController.h"
#import "RWAppSheetsController.h"
#import "RWTaal.h"

@interface RWSheetViewController ()

@end

@implementation RWSheetViewController
int taalChosed;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
      self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
      if (self) {
                   
      }
      return self;
}


- (void)viewDidLoad
{
      [super viewDidLoad];
    
    RWAppSheetsController *sheetController = [[RWAppSheetsController alloc]init];
    [sheetController createSheetWithCossedTaal:_thaatBytes];
    [self.collectionView setCollectionViewLayout:sheetController.collectionFlowLayout];
    
    
            //// SE CREAN LOS DATOS PARA LOS CELLSVIEWSCOLLECTION...
      
      NSMutableArray *TimeSection = [[NSMutableArray alloc] init];
      //    RWTaal *choosedTaal = [[RWTaal alloc]initWithTaalFromName:_thaatName];
//     RWTaal *choosedTaal = sheetController.taalNeededBoxes;
    
      
      for (int i=0; i < sheetController.taalNeededBoxes.intValue; i++) {
            
            [TimeSection addObject:[NSString stringWithFormat:@"%d",i]];
       }
      
      _sheetsNotes = [[NSArray alloc] initWithObjects:TimeSection,nil];
//      taalChosed = choosedTaal.taalBytes.integerValue;
    
//      [self.collectionView setCollectionViewLayout:[self flowLayoutForTaal:choosedTaal.taalBytes.integerValue]];
      [self activateGesturesReconizers];
      
      
}
//-(UICollectionViewFlowLayout*)flowLayoutForTaal:(NSInteger)taalbytes {
//      
//      CGRect screenRect = [[UIScreen mainScreen] bounds];
//      CGFloat screenHeight = screenRect.size.height;
//      
//      int cellsHeight = 60 * taalbytes;
//      int freeSpace = screenHeight - cellsHeight;
//      int resultSideSpace = (freeSpace / 2) - (taalbytes / 2);
//      
//      
//      UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
//      [flowLayout setItemSize:CGSizeMake(60,60)];
//      [flowLayout setMinimumInteritemSpacing:1];
//      [flowLayout setMinimumLineSpacing:2];
//      [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
//      [flowLayout setHeaderReferenceSize: CGSizeMake(512,97)];
//      [flowLayout setFooterReferenceSize:CGSizeMake(512, 117)];
//      [flowLayout setSectionInset:UIEdgeInsetsMake(50.0,resultSideSpace,263.0,resultSideSpace)];
//      
//      return flowLayout;
//      
//}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
      
      CGSize sizeForItem;
      
      if (indexPath.row < taalChosed * 2) {
            
            sizeForItem = CGSizeMake(60,20);
      }
      else if ((indexPath.row > (taalChosed * 3) -1) & (indexPath.row < taalChosed * 4)) {
            
            sizeForItem = CGSizeMake(60,20);
      }
      else if  (indexPath.row > (taalChosed * 5) -1)  {
            
            sizeForItem = CGSizeMake(60,20);
      }
      else {
            sizeForItem = CGSizeMake(60,40);
      }
      
      return sizeForItem;
}
      //// CREA EL GESTURE RECONIZER
- (void)activateGesturesReconizers {
      
      UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc]
                                            initWithTarget:self action:@selector(handleTapGesture)];
      
      NSArray* recognizers = [self.collectionView gestureRecognizers];
      
         
      for (UIGestureRecognizer* aRecognizer in recognizers) {
            
            if ([aRecognizer isKindOfClass:[UITapGestureRecognizer class]])
                  [aRecognizer requireGestureRecognizerToFail:tapGesture];
      }
            
      tapGesture.numberOfTapsRequired = 2;
      [self.collectionView addGestureRecognizer:tapGesture];
      
}
- (void)handleTapGesture {
      
      NSLog(@"handleTapGesture....");
}


      //// NUMERO DE SECCIONES DE LA TABLA DE VIEWS
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
      
      return [_sheetsNotes count];
}

      //// NUMERO DE CELDAS POR SECCION
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
      
      NSMutableArray *sectionArray = [_sheetsNotes objectAtIndex:section];
      return [sectionArray count];
}

      //// SE CREAN LOS BOX NOTES VIEWS Y SE MUESTRAN
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
      
      static NSString *cellIdentifier = @"Part";
      
      UICollectionViewCell *cell   = (UICollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
      
      
      return cell;
      
}
      //// SE CREAN LOS VIEWS HEADER Y FOOTER
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
      
      static NSString *cellIdentifier;
      
      if ([kind isEqualToString:@"UICollectionElementKindSectionFooter"]) {
            
            cellIdentifier = @"PartFooter";
      }
      if ([kind isEqualToString:@"UICollectionElementKindSectionHeader"]) {
            
            cellIdentifier = @"PartHeader";
      }
      
      UICollectionReusableView *cell =  (UICollectionReusableView *)[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:cellIdentifier forIndexPath:indexPath];
      
      return cell;
}

- (void)didReceiveMemoryWarning
{
      [super didReceiveMemoryWarning];
            // Dispose of any resources that can be recreated.
}

- (IBAction)chooseNewRaga:(id)sender {
}
@end
