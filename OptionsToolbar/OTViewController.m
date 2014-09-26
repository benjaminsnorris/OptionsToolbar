//
//  OTViewController.m
//  OptionsToolbar
//
//  Created by Joshua Howland on 6/5/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "OTViewController.h"
#import <MessageUI/MessageUI.h>

@interface OTViewController () <MFMailComposeViewControllerDelegate>

@end

@implementation OTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)mail:(id)sender {
    
    MFMailComposeViewController *mailViewController = [[MFMailComposeViewController alloc] init];
    mailViewController.mailComposeDelegate = self;
    
    [self presentViewController:mailViewController animated:YES completion:nil];
    
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)red:(id)sender {

    self.view.backgroundColor = [UIColor redColor];
}

@end
