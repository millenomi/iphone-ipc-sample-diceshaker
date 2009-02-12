//
//  DiceshakerIPC_AppAppDelegate.m
//  DiceshakerIPC_App
//
//  Created by ∞ on 12/02/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "DiceshakerIPC_AppAppDelegate.h"
#import "DiceshakerIPC_AppViewController.h"

#import "NSURL_L0URLParsing.h"

@implementation DiceshakerIPC_AppAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication*) app handleOpenURL:(NSURL*) url {
	NSDictionary* d = [url dictionaryByDecodingQueryString];
	
	id o = [[NSUserDefaults standardUserDefaults] objectForKey:@"L0DiceshakerLastRequestUUID"];
	if ([[d objectForKey:@"app.requestIdentifier"] isEqual:o]) {
		[[NSUserDefaults standardUserDefaults] removeObjectForKey:@"L0DiceshakerLastRequestUUID"];
		
		NSString* result;
		
		if ([[d objectForKey:@"canceled"] isEqual:@"YES"])
			result = @"(canceled)";
		else
			result = [NSString stringWithFormat:@"%@d%@: %@", [d objectForKey:@"numberOfDice"], [d objectForKey:@"numberOfFacesPerDie"], [d objectForKey:@"roll"]];
		
		viewController.lastRollText = result;
		
		return YES;
	}
	
	return NO;
}

@end
