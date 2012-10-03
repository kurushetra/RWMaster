//
//  RWNoteEditPanelViewController.m
//  RagaWriterMaster
//
//  Created by luis sintes on 30/09/12.
//  Copyright (c) 2012 luis sintes. All rights reserved.
//

#import "RWNoteEditPanelViewController.h"

@interface RWNoteEditPanelViewController ()

@end

@implementation RWNoteEditPanelViewController

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
      
      self.view.frame = _ViewChooseNotes.bounds;
//      self.view.bounds = _ViewChooseNotes.bounds;
	 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
