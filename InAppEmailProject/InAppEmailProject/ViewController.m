
//
//  ViewController.m
//  InAppEmailProject
//
//  Created by Bereket Ghebremedhin on 4/24/16.
//  Copyright © 2016 Bereket Ghebremedhin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


- (IBAction)sendEmailButtonTapped:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendEmailButtonTapped:(id)sender {
    
    
    MFMailComposeViewController* composer = [[MFMailComposeViewController alloc] init];
    
    [composer setMailComposeDelegate:self];
    
    if ([MFMailComposeViewController canSendMail]){
        [composer setToRecipients: [NSArray arrayWithObjects:@"", nil]]; //insert email here
        [composer setSubject:@"testing InAppEmail"];
        [composer setMessageBody:@"" isHTML:NO];
        [composer setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
        [self presentViewController:composer animated:YES completion:nil];
    }
    else {
        
    }
}

- (void)mailComposeController:(MFMailComposeViewController *)controller
didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {

    if (error) {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"ERROR"
                                                                       message:@"EMAIL DID NOT SEND"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"ERROR" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
        
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }
    else{
          [self dismissViewControllerAnimated:YES completion:nil];
    }

}
@end
