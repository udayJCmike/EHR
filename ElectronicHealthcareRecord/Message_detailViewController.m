//
//  Message_detailViewController.m
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 12/11/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//

#import "Message_detailViewController.h"

@interface Message_detailViewController ()

@end

@implementation Message_detailViewController
@synthesize Reply;
@synthesize cancel;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [Reply primaryStyle];
    [cancel defaultStyle];
    // Do any additional setup after loading the view.
}
- (IBAction)cancel:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
