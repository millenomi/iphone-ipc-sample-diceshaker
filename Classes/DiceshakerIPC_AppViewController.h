//
//  DiceshakerIPC_AppViewController.h
//  DiceshakerIPC_App
//
//  Created by ∞ on 12/02/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DiceshakerIPC_AppViewController : UIViewController {
	IBOutlet UILabel* label;
	
	NSString* lastRollText;
}

@property (nonatomic, copy) NSString* lastRollText;
@property (nonatomic, retain) UILabel* label;

- (IBAction) roll;

@end

