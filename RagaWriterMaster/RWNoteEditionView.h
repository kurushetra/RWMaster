//
//  RWNoteEditionView.h
//  RagaWriterMaster
//
//  Created by luis sintes on 30/09/12.
//  Copyright (c) 2012 luis sintes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RWNoteEditionView : UIView 


@property (strong, nonatomic) IBOutlet UITextView *textViewNoteResult;
@property (weak, nonatomic) IBOutlet UIView *pruebaView;

- (IBAction)insertNote:(id)sender;

@end
