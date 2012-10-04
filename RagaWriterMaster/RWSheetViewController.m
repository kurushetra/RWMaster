    //
    //  LSViewController.m
    //  ColectionControlerConStoryBoard
    //
    //  Created by kurushetra on 24/09/12.
    //  Copyright (c) 2012 kurushetra. All rights reserved.
    //

#import "RWSheetViewController.h"
#import <QuartzCore/CoreAnimation.h>
#import "RWAppDelegate.h"
#import "RWChooseNoteVC.h"
#import "RWSheetBoxView.h"
#import "RWNoteEditionView.h"
#import "RWChooseRagaViewController.h"
#import "RWRagaWriterController.h"
#import "RWNoteEditPanelViewController.h"
    //#import "RWTaal.h"

@interface RWSheetViewController ()
@end

@implementation RWSheetViewController
    //RWRagaWriterController *ragaWriter;
RWAppDelegate *appDelagate;
NSArray *theDataToShow;
int taalChosed;

    ////----------------------------------------------------------------////
#pragma mark -                Initialization
    ////----------------------------------------------------------------////

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        theDataToShow = [NSArray new];
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    taalChosed =  _ragaWriter.raga.taal.taalBytes.intValue;
    [self.collectionView setCollectionViewLayout: _ragaWriter.raga.viewLayout];
    
        //      [self currentScoreLine:taalChosed];
    
}

    ////----------------------------------------------------------------////
#pragma mark -            DELEGATES collectionView
    ////----------------------------------------------------------------////
    //// numero de secciones
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}
    //// numero de celdas por seccion
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return taalChosed * 7;
}
    ////  box notes views y se muestran
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSInteger rowCellNumber = indexPath.row;
    int rowLine = [[self lineNumber:rowCellNumber] intValue];

        ////_Creating the Cell
    static NSString *cellIdentifier = @"Part";
    RWSheetBoxView *cell = (RWSheetBoxView *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
//     UIView *viewForCell = [RWRagaWriterController cellForRowNumberAndLine:rowCellNumber line:rowLine];

    
    //// Elije el indice de los arrays de datos ha usar
    int dataArrayPosition = [_ragaWriter  getArrayDataForLine:rowLine];
    theDataToShow = [_ragaWriter.raga.scoreData.allLinesData objectAtIndex:dataArrayPosition];
    
     NSLog(@"theDataToShow2 %@",theDataToShow);
    NSLog(@"theDataToShow %@",[_ragaWriter.raga.scoreData.allLinesData objectAtIndex:dataArrayPosition]);
   
    
    int indexData = rowCellNumber - (taalChosed * rowLine);
    
    if (rowLine == 1) {
        
        [cell.labelNoteText setText:[NSString stringWithFormat:@"%@",[theDataToShow objectAtIndex:indexData]]];
        
    }else {
        [cell.labelNoteText setText:[theDataToShow objectAtIndex:indexData]];
        
    }
    cell.contentView.layer.borderWidth = 1.5f;
    cell.contentView.layer.borderColor = [UIColor blackColor].CGColor;
    
    
    
    
    
    
    
    return cell;
    
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@" linea es %@",[self lineNumber:indexPath.row]);
    
    UICollectionViewCell *touchedView = [collectionView cellForItemAtIndexPath: indexPath];
    
    NSArray *nibObjects = [[NSBundle mainBundle] loadNibNamed:@"NoteEditBox" owner:self options:nil];
    UIView *nibView = [nibObjects objectAtIndex:0];
        //      RWChooseNoteVC *chooseNotePanel = [RWChooseNoteVC new];
    [self.collectionView addSubview:nibView];
    
   {
        //      NSLog(@"touchedView.frame.size.width %f touchedView.frame.size.height %f",touchedView.frame.size.width,touchedView.frame.size.height);
        //      NSLog(@"touchedView.bounds.size.width %f touchedView.bounds.size.height %f",touchedView.bounds.size.width,touchedView.bounds.size.height);
        //      NSLog(@"touchedView.center.x %f touchedView.center.y %f",touchedView.center.x,touchedView.center.y);
        //
        //
        //      NSLog(@"nibView.frame.size.width %f nibView.frame.size.height %f",nibView.frame.size.width,nibView.frame.size.height);
        //      NSLog(@"nibView.bounds.size.width %f nibView.bounds.size.height %f",nibView.bounds.size.width,nibView.bounds.size.height);
        //      NSLog(@"nibView.center.x %f nibView.center.y %f",nibView.center.x,nibView.center.y);
    
    
        //     //      nibView.transform = CGAffineTransformMakeTranslation(110.0,110.0);
   }
    nibView.frame = CGRectMake(touchedView.center.x,touchedView.center.y,0,0);
        //       nibView.center = touchedView.center;
        //      nibView.frame = CGRectMake(0,0,397,380);
        //      nibView.bounds = nibView.frame;
    
    nibView.transform = CGAffineTransformMakeScale(0.0, 0.0);
    
    [UIView animateWithDuration:0.4 delay:0.0 options:0 animations:^{
                             //                             [nibView setAlpha:0.0f];
                         nibView.transform = CGAffineTransformMakeScale(1.0,1.0);
                         nibView.frame = CGRectMake(0,0,397,380);
                             //                             nibView.transform = CGAffineTransformMakeTranslation(0,0);
                     }
                     completion:^(BOOL finished) {
                             //                             [nibView removeFromSuperview];
                     }];
   {
        //_______________________________________para mover items____________________________
        //    [collectionView selectItemAtIndexPath:indexPath animated:YES scrollPosition:1];
        //    – scrollToItemAtIndexPath:atScrollPosition:animated:
        //    NSIndexPath *newIndex = [NSIndexPath indexPathForItem:indexPath.row - 23 inSection:indexPath.section];
        //    [collectionView moveItemAtIndexPath:indexPath toIndexPath:newIndex];
   }
}
- (void)collectionView:(UICollectionView *)colView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell* cell = [colView cellForItemAtIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor blueColor];
    
}
- (void)collectionView:(UICollectionView *)colView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell* cell = [colView cellForItemAtIndexPath:indexPath];
    cell.contentView.backgroundColor = nil;
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
#pragma mark -         DELEGATES  collectionViewLayout
    ////----------------------------------------------------------------////

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGSize sizeForItem;
    
    
    
    if (indexPath.row < taalChosed * 2) {
        
        sizeForItem = CGSizeMake(61,40);
    }
    else if ((indexPath.row >= (taalChosed * 3)) & (indexPath.row < taalChosed * 4)) {
        
        sizeForItem = CGSizeMake(61,20);
    }
    else if  (indexPath.row >= (taalChosed * 5))  {
        
        sizeForItem = CGSizeMake(61,20);
    }
    else {
        sizeForItem = CGSizeMake(61,80);
    }
    
    return sizeForItem;
}
    //- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
    //{
    //
    //
    //}
    //- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
    //{
    //      return 0.0;
    //
    //}
    //- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
    //{
    //
    //
    //      return 2;
    //
    //}
    //- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
    //{
    //
    //
    //}
    //- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
    //{
    //
    //
    //}

- (NSNumber*)lineNumber:(NSInteger)indexPath {
    
    int lineNumber = (indexPath / taalChosed);
    NSNumber *line = [NSNumber numberWithInt:lineNumber];
        //      NSLog(@"La linea Tocada es la: %@",line);
    
    return line;
}
    //- (NSNumber*)columnNumber:(NSIndexPath*)indexPath {
    //      return ;
    //}
    ////----------------------------------------------------------------////
#pragma mark -                   Gestures  no Usado....
    ////----------------------------------------------------------------////

    //// crea el gesture reconizer
- (void)activateGesturesReconizers {
    
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self action:@selector(handleTapGesture:)];
    
    NSArray* recognizers = [self.collectionView gestureRecognizers];
    
    
    for (UIGestureRecognizer* aRecognizer in recognizers) {
        
        if ([aRecognizer isKindOfClass:[UITapGestureRecognizer class]])
            [aRecognizer requireGestureRecognizerToFail:tapGesture];
    }
    
    tapGesture.numberOfTapsRequired = 2;
        //    [self.collectionView addGestureRecognizer:tapGesture];
    
}
- (void)handleTapGesture:(UITapGestureRecognizer *)sender  {
    
    NSLog(@"handleTapGesture....");
    
    CGPoint p1 = [sender locationOfTouch:0 inView:[self collectionView]];
        //    CGPoint p2 = [sender locationOfTouch:1 inView:[self collectionView]];
    NSLog(@"Location touch 0:%@",NSStringFromCGPoint(p1));
        //    UIView *viewTouched = sender.view;
        //    viewTouched.bounds  = CGRectMake(0,0,10,10);
        //    sender.view.center = location;
    
    CGPoint location = [sender locationInView:sender.view.superview];
    NSLog(@"locationInView : %@",NSStringFromCGPoint(location));
    
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
