//
//  RWNoteEditionView.m
//  RagaWriterMaster
//
//  Created by luis sintes on 30/09/12.
//  Copyright (c) 2012 luis sintes. All rights reserved.
//

#import "RWNoteEditionView.h"

@implementation RWNoteEditionView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
 
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

*/
- (void)drawRect:(CGRect)rect
{
      self.frame =   _pruebaView.frame;
      self.bounds =  _pruebaView.frame;
      [self addSubview:_pruebaView];
      
      {
//     self.frame = CGRectMake(0,0,102,76);
//      self.bounds =  CGRectMake(0,0,1024,768);
//       self.backgroundColor = [UIColor redColor];
//      self.bounds = CGRectMake(500,370,500,380);
//      _pruebaView.frame = self.bounds;
      
            
//      NSLog(@"_pruebaView.frame.size.width %f _pruebaView.frame.size.height %f",_pruebaView.frame.size.width,_pruebaView.frame.size.height);
//      NSLog(@"_pruebaView.bounds.size.width %f _pruebaView.bounds.size.height %f",_pruebaView.bounds.size.width,_pruebaView.bounds.size.height);
//      NSLog(@"_pruebaView.center.x %f _pruebaView.center.y %f",_pruebaView.center.x,_pruebaView.center.y);
//      
//      
//      NSLog(@"self.frame.size.width %f self.frame.size.height %f",self.frame.size.width,self.frame.size.height);
//      NSLog(@"self.bounds.size.width %f self.bounds.size.height %f",self.bounds.size.width,self.bounds.size.height);
//      NSLog(@"self.center.x  %f self.center.y %f",self.center.x,self.center.y);
      }

      }

- (IBAction)insertNote:(id)sender {
}
@end
