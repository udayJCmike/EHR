//
//  MessagesViewController.m
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 11/11/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//

#import "Clinic_Ask_UsViewController.h"

@interface Clinic_Ask_UsViewController ()

@end

@implementation Clinic_Ask_UsViewController
@synthesize message_array;
@synthesize message_content;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)Showtext:(id)sender {
    [self performSegueWithIdentifier:@"detailpage" sender:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    message_array=[[NSMutableArray alloc]init];
    message_content=[[NSMutableDictionary alloc]init];
    [message_content setValue:@"Doctor, what i have to do during sudden pain?" forKey:@"title"];
    [message_content setValue:@"Some description about the question comes here! Some description about the question comes here! Some description about the question comes here! Some description about the question comes here! Some description about the question comes here?" forKey:@"subject"];
    [message_content setValue:@"25/10/2014" forKey:@"date"];
    [message_content setValue:@"10:15 AM" forKey:@"time"];
    [message_content setValue:@"0" forKey:@"person"];
    [message_array addObject:message_content];
    message_content=[[NSMutableDictionary alloc]init];
    [message_content setValue:@"Doctor, what i have to do during sudden pain?" forKey:@"title"];
    [message_content setValue:@"Some description about the question comes here! Some description about the question comes here! Some description about the question comes here! Some description about the question comes here! Some description about the question comes here?" forKey:@"subject"];
    [message_content setValue:@"25/10/2014" forKey:@"date"];
    [message_content setValue:@"10:15 AM" forKey:@"time"];
    [message_content setValue:@"1" forKey:@"person"];
    [message_array addObject:message_content];
    message_content=[[NSMutableDictionary alloc]init];
    [message_content setValue:@"Doctor, what i have to do during sudden pain?" forKey:@"title"];
    [message_content setValue:@"Some description about the question comes here! Some description about the question comes here! Some description about the question comes here! Some description about the question comes here! Some description about the question comes here?" forKey:@"subject"];
    [message_content setValue:@"15/10/2014" forKey:@"date"];
    [message_content setValue:@"10:15 AM" forKey:@"time"];
    [message_content setValue:@"0" forKey:@"person"];
    [message_array addObject:message_content];
    message_content=[[NSMutableDictionary alloc]init];
    [message_content setValue:@"Doctor, what i have to do during sudden pain?" forKey:@"title"];
    [message_content setValue:@"Some description about the question comes here! Some description about the question comes here! Some description about the question comes here! Some description about the question comes here! Some description about the question comes here?" forKey:@"subject"];
    [message_content setValue:@"15/10/2014" forKey:@"date"];
    [message_content setValue:@"10:15 AM" forKey:@"time"];
    [message_content setValue:@"1" forKey:@"person"];
    [message_array addObject:message_content];
    message_content=[[NSMutableDictionary alloc]init];
    [message_content setValue:@"Doctor, what i have to do during sudden pain?" forKey:@"title"];
    [message_content setValue:@"Some description about the question comes here! Some description about the question comes here! Some description about the question comes here! Some description about the question comes here! Some description about the question comes here?" forKey:@"subject"];
    [message_content setValue:@"15/10/2014" forKey:@"date"];
    [message_content setValue:@"10:15 AM" forKey:@"time"];
    [message_content setValue:@"0" forKey:@"person"];
    [message_array addObject:message_content];
    message_content=[[NSMutableDictionary alloc]init];
    [message_content setValue:@"Doctor, what i have to do during sudden pain?" forKey:@"title"];
    [message_content setValue:@"Some description about the question comes here! Some description about the question comes here! Some description about the question comes here! Some description about the question comes here! Some description about the question comes here?" forKey:@"subject"];
    [message_content setValue:@"31/10/2014" forKey:@"date"];
    [message_content setValue:@"10:15 AM" forKey:@"time"];
    [message_content setValue:@"1" forKey:@"person"];
    [message_array addObject:message_content];
    message_content=[[NSMutableDictionary alloc]init];
    [message_content setValue:@"Doctor, what i have to do during sudden pain?" forKey:@"title"];
    [message_content setValue:@"Some description about the question comes here! Some description about the question comes here! Some description about the question comes here! Some description about the question comes here! Some description about the question comes here?" forKey:@"subject"];
    [message_content setValue:@"25/10/2014" forKey:@"date"];
    [message_content setValue:@"10:15 AM" forKey:@"time"];
    [message_content setValue:@"0" forKey:@"person"];
    [message_array addObject:message_content];
    message_content=[[NSMutableDictionary alloc]init];
    [message_content setValue:@"Doctor, what i have to do during sudden pain?" forKey:@"title"];
    [message_content setValue:@"Some description about the question comes here! Some description about the question comes here! Some description about the question comes here! Some description about the question comes here! Some description about the question comes here?" forKey:@"subject"];
    [message_content setValue:@"5/10/2014" forKey:@"date"];
    [message_content setValue:@"10:15 AM" forKey:@"time"];
    [message_content setValue:@"1" forKey:@"person"];
    [message_array addObject:message_content];
    message_content=[[NSMutableDictionary alloc]init];
    [message_content setValue:@"Doctor, what i have to do during sudden pain?" forKey:@"title"];
    [message_content setValue:@"Some description about the question comes here! Some description about the question comes here! Some description about the question comes here! Some description about the question comes here! Some description about the question comes here?" forKey:@"subject"];
    [message_content setValue:@"01/10/2014" forKey:@"date"];
    [message_content setValue:@"10:15 AM" forKey:@"time"];
    [message_content setValue:@"0" forKey:@"person"];
    [message_array addObject:message_content];
    message_content=[[NSMutableDictionary alloc]init];
    [message_content setValue:@"Doctor, what i have to do during sudden pain?" forKey:@"title"];
    [message_content setValue:@"Some description about the question comes here! Some description about the question comes here! Some description about the question comes here! Some description about the question comes here! Some description about the question comes here?" forKey:@"subject"];
    [message_content setValue:@"13/10/2014" forKey:@"date"];
    [message_content setValue:@"10:15 AM" forKey:@"time"];
    [message_content setValue:@"1" forKey:@"person"];
    [message_array addObject:message_content];
    self.message_tbview.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.send primaryStyle];
    self.msg.layer.cornerRadius=10;
    self.msg.layer.masksToBounds=YES;
    self.msg.layer.borderWidth=1.0;
    self.msg.layer.borderColor=[[UIColor blackColor]CGColor];
}
-(void)textViewDidBeginEditing:(UITextView *)textView
{
    [self animateTextField:textView up:YES];
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    [self animateTextField:textView up:NO];
}

-(void)animateTextField:(UITextView*)textField up:(BOOL)up
{
    const int movementDistance = -263; // tweak as needed
    const float movementDuration = 0.3f; // tweak as needed
    
    int movement = (up ? movementDistance : -movementDistance);
    
    [UIView beginAnimations: @"animateTextField" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [message_array count];
    
    // Return the number of rows in the section.
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    MessageContentTableViewCell *cell = (MessageContentTableViewCell*)[self.message_tbview dequeueReusableCellWithIdentifier:@"messageList" forIndexPath:indexPath];
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    NSDictionary *data_for_cell= [message_array objectAtIndex:indexPath.row];
    //    if (indexPath.row %2==0)
    //    {
    //        cell.backgroundColor=[UIColor colorWithRed:51.0/255.0f green:214.0/255.0f blue:133.0/255.0f alpha:0.5f];
    //    }
    //    else
    //    {
    //          cell.backgroundColor=[UIColor colorWithRed:193.0/255.0f green:193.0/255.0f blue:193.0/255.0f alpha:0.5f];
    //    }
    cell. title.text=[data_for_cell valueForKey:@"title"];
    cell.content.text=[data_for_cell valueForKey:@"subject"];
    cell.date_sent.text=[data_for_cell valueForKey:@"date"];
    cell.time_sent.text=[data_for_cell valueForKey:@"time"];
    
    if([[data_for_cell valueForKey:@"person"] isEqualToString:@"0"])
    {
        cell.profileimage.image=[UIImage imageNamed:@"patient.png"];
    }
    else
    {
        cell.profileimage.image=[UIImage imageNamed:@"clinic_admin.jpeg"];
    }
    return cell;
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // [self performSegueWithIdentifier:@"detailpage" sender:self];
    
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
