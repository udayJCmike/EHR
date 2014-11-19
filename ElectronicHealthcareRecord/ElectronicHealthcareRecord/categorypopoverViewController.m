//
//  categorypopoverViewController.m
//  LMSMOOC
//
//  Created by DeemsysInc on 17/09/14.
//  Copyright (c) 2014 deemsys. All rights reserved.
//

#import "categorypopoverViewController.h"

@interface categorypopoverViewController ()
{
   
}
@end

@implementation categorypopoverViewController
@synthesize category_tableView;
@synthesize categorylist;
int loadcompleted;
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
   
   
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated
{
    categorylist=[[NSUserDefaults standardUserDefaults]valueForKey:@"arraylist"];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [categorylist count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    cell = [self.category_tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [categorylist objectAtIndex:indexPath.row];
    //  NSLog(@"category data %@", cell.textLabel.text);
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Categorylist"
                                                        object:[categorylist objectAtIndex:indexPath.row]
                                                      userInfo:nil];
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
