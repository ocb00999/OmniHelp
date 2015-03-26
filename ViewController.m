//
//  ViewController.m
//  OmniHelp
//
//  Created by Chubin OU on 3/21/15.
//  Copyright (c) 2015 Chubin OU. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>
#import "SVProgressHUD.h"
#import "LoginViewController.h"
#import "MapViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    PFUser *currentUser = [PFUser currentUser];
    if (currentUser)
    {
        glb_user.username = currentUser.username;
        [SVProgressHUD showWithStatus:@"Loading User Information..."];
        [glb_user setUser:currentUser];
        PFQuery *query = [PFQuery queryWithClassName:@"Note"];
        [query whereKey:@"username" equalTo:currentUser[@"username"]];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (error) {
                UIAlertView *alert = [[UIAlertView alloc]
                                      initWithTitle:@"Error" message:@"Network Error!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
            }
            else
            {
                for (PFInstallation *ob in objects){
                    [glb_user addNote:ob];
                }
                [SVProgressHUD dismiss];
                [self performSegueWithIdentifier:@"toMapView" sender:self];
            }
            
        }];
        // Do any additional setup after loading the view from its nib.
    } else {
        [self performSegueWithIdentifier:@"toLoginView" sender:self];
    }


    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"toMapView"]){
        MapViewController *transferViewController = segue.destinationViewController;
    }
    if ([segue.identifier isEqualToString:@"toLoginView"]){
        LoginViewController *transferViewController = segue.destinationViewController;
    }
}

@end
