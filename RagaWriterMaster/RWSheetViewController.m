    //
    //  LSViewController.m
    //  ColectionControlerConStoryBoard
    //
    //  Created by kurushetra on 24/09/12.
    //  Copyright (c) 2012 kurushetra. All rights reserved.
    //

#import "RWSheetViewController.h"
#import "RWSheetBoxView.h"
#import "RWChooseRagaViewController.h"
#import "RWAppSheetsController.h"
#import "RWTaal.h"

@interface RWSheetViewController ()
@end

@implementation RWSheetViewController

int taalChosed;

    ////----------------------------------------------------------------////
#pragma mark -                Initialization
    ////----------------------------------------------------------------////

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
    taalChosed = _thaatBytes.intValue;
    [self.collectionView setCollectionViewLayout:sheetController.collectionFlowLayout];
    
    
        //// se crean los datos para los cellsviewscollection...
    NSMutableArray *TimeSection = [[NSMutableArray alloc] init];
    
    for (int i=0; i < sheetController.taalNeededBoxes.intValue; i++) {
        
        [TimeSection addObject:[NSString stringWithFormat:@"%d",i]];
    }
    _sheetsNotes = [[NSArray alloc] initWithObjects:TimeSection,nil];
    
    
    [self activateGesturesReconizers];
    
    
}
    ////----------------------------------------------------------------////
#pragma mark -                   Gestures
    ////----------------------------------------------------------------////

    //// crea el gesture reconizer
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
    ////----------------------------------------------------------------////
#pragma mark -         DELEGATES  collectionViewLayout
    ////----------------------------------------------------------------////

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
    ////----------------------------------------------------------------////
#pragma mark -            DELEGATES collectionView
    ////----------------------------------------------------------------////

    //// numero de secciones 
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return [_sheetsNotes count];
}

    //// numero de celdas por seccion
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    NSMutableArray *sectionArray = [_sheetsNotes objectAtIndex:section];
    return [sectionArray count];
}

    ////  box notes views y se muestran
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier = @"Part";
    
    RWSheetBoxView *cell = (RWSheetBoxView *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    
        //      UICollectionViewCell *cell   = (UICollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    [cell.labelNoteText setText:@"sisi"];
    return cell;
    
}
    ////  header y footer
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
    ////----------------------------------------------------------------////
#pragma mark -                  MemoryWarring
    ////----------------------------------------------------------------////

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
}


@end
