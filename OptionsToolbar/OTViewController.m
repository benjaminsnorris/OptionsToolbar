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

- (IBAction)sendMail:(id)sender {
    MFMailComposeViewController *mailViewController = [MFMailComposeViewController new];
    mailViewController.mailComposeDelegate = self;
    [mailViewController setSubject:@"Send me an email"];
    // Body doesn't get set although subject does
    [mailViewController setMessageBody:@"I love that this is working now!" isHTML:NO];
    if ([MFMailComposeViewController canSendMail]) {
        [self presentViewController:mailViewController animated:YES completion:nil];
    }
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    [controller dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)changeToRed:(id)sender {
    self.view.backgroundColor = [UIColor redColor];
}

- (IBAction)changeToBlue:(id)sender {
    self.view.backgroundColor = [UIColor blueColor];
}

- (IBAction)newViewController:(id)sender {
    UIViewController *newView = [UIViewController new];
    newView.view.backgroundColor = [UIColor greenColor];
    // My button is still not showing up
    UIButton *dismissButton = [[UIButton alloc] initWithFrame:CGRectMake(15, 200, 100, 30)];
    [dismissButton setTitle:@"Record Time" forState:UIControlStateNormal];
    [dismissButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [dismissButton addTarget:self action:@selector(dismissNewView:) forControlEvents:UIControlEventTouchUpInside];
    [newView.view addSubview:dismissButton];
    [self.view addSubview:dismissButton];
    
    [self presentViewController:newView animated:YES completion:nil];
}

- (void)dismissNewView:(UIButton *) button {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
