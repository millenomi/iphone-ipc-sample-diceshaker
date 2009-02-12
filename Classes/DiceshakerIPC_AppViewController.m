//
//  DiceshakerIPC_AppViewController.m
//  DiceshakerIPC_App
//
//  Created by ∞ on 12/02/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "DiceshakerIPC_AppViewController.h"
#import "L0UUID.h"

@interface DiceshakerIPC_AppViewController ()

- (void) _setLabelWithLastRollText;

@end


@implementation DiceshakerIPC_AppViewController


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	[self _setLabelWithLastRollText];
}

- (void) setView:(UIView*) v;
{
	if (!v) {
		self.label = nil;
	}
	
	[super setView:v];
}

- (void) _setLabelWithLastRollText;
{
	self.label.text = [NSString stringWithFormat:@"Last roll:\n%@", lastRollText ?: @"(none)"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
	self.label = nil;
    [super dealloc];
}

- (IBAction) roll;
{
	NSString* returnURLString = @"x-infinitelabs-diceshakeripcapp-return:?app.requestIdentifier=";
	NSString* ident = [[[L0UUID UUID] stringValue] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	returnURLString = [returnURLString stringByAppendingString:ident];
	
	[[NSUserDefaults standardUserDefaults] setObject:ident forKey:@"L0DiceshakerLastRequestUUID"];
	
	NSString* escapedURLString = (NSString*) CFURLCreateStringByAddingPercentEscapes(NULL, (CFStringRef) returnURLString, NULL, (CFStringRef) @"?:&", kCFStringEncodingUTF8);
	
	NSString* diceshakerURL = [NSString stringWithFormat:@"x-infinitelabs-diceshaker:roll?sender=%@&returnURL=%@", [@"IPC Test" stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], escapedURLString];
	
	[escapedURLString release];
	
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:diceshakerURL]];
}

@synthesize label, lastRollText;

- (void) setLastRollText:(NSString*) t {
	if (t != lastRollText) {
		[lastRollText release];
		lastRollText = [t retain];
		
		[self _setLabelWithLastRollText];
	}
}

@end
