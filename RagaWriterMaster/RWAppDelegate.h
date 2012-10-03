//
//  RWAppDelegate.h
//  RagaWriterMaster
//
//  Created by luis sintes on 26/09/12.
//  Copyright (c) 2012 luis sintes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RWRagaWriterController.h"

@interface RWAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (retain,nonatomic)  RWRagaWriterController *ragaWriter;
@property (retain,nonatomic)  NSArray *sheetData;


@end
