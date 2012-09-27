//
//  RWChooseRagaViewController.m
//  ColectionControlerConStoryBoard
//
//  Created by kurushetra on 26/09/12.
//  Copyright (c) 2012 kurushetra. All rights reserved.
//

#import "RWChooseRagaViewController.h"
#import "RWSheetViewController.h"

@interface RWChooseRagaViewController ()

@end

@implementation RWChooseRagaViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
#pragma mark - SEGUE DELEGATE

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
     RWSheetViewController *sheetsPanel = [segue destinationViewController];
    
    if ([[segue identifier] isEqualToString:@"toTheRagaSheet"])
       {
        sheetsPanel.thaatBytes = [NSNumber numberWithInteger:[sender tag]];
//           sheetsPanel.thaatName = @"roopak";
       }
         
    
}

- (IBAction)addNewRaga:(id)sender {
    
    [self performSegueWithIdentifier:@"toTheRagaSheet" sender:sender];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
