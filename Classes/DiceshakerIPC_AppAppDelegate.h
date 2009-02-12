//
//  DiceshakerIPC_AppAppDelegate.h
//  DiceshakerIPC_App
//
//  Created by ∞ on 12/02/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DiceshakerIPC_AppViewController;

@interface DiceshakerIPC_AppAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    DiceshakerIPC_AppViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet DiceshakerIPC_AppViewController *viewController;

@end

