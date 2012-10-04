//
//  RWChooseRagaViewController.m
//  ColectionControlerConStoryBoard
//
//  Created by kurushetra on 26/09/12.
//  Copyright (c) 2012 kurushetra. All rights reserved.
//

#import "RWChooseRagaViewController.h"
#import "RWAppDelegate.h"
#import "RWRagaWriterController.h"
#import "RWSheetViewController.h"

@interface RWChooseRagaViewController ()

@end

@implementation RWChooseRagaViewController

RWAppDelegate *appDelegate;

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
    	 
      appDelegate = (RWAppDelegate *)[UIApplication sharedApplication].delegate;
      
}
#pragma mark - SEGUE DELEGATE

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
      
    RWSheetViewController *sheetsPanel = [segue destinationViewController];
    if ([[segue identifier] isEqualToString:@"toTheRagaSheet"])
       {
                  sheetsPanel.ragaWriter = appDelegate.ragaWriter;
       }
}

- (IBAction)addNewRaga:(id)sender {
    
    [ appDelegate.ragaWriter newRagaFromRagaAndTaal:@"Bairavi" taal:[NSNumber numberWithInteger:[sender tag]]];
    [self performSegueWithIdentifier:@"toTheRagaSheet" sender:sender];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
