//
//  DPCalendarTestViewController.m
//  DPCalendar
//
//  Created by Ethan Fang on 19/12/13.
//  Copyright (c) 2013 Ethan Fang. All rights reserved.
//

#import "DPCalendarTestViewController.h"
#import "DPCalendarMonthlySingleMonthViewLayout.h"

#import "DPCalendarMonthlyView.h"
#import "DPCalendarEvent.h"
#import "DPCalendarIconEvent.h"
#import "NSDate+DP.h"
#import "DPCalendarTestOptionsViewController.h"
#import "DPCalendarTestCreateEventViewController.h"


@interface DPCalendarTestViewController ()<DPCalendarMonthlyViewDelegate, DPCalendarTestCreateEventViewControllerDelegate>
{
    NSDate *selected_date;
    ElectronicHealthcareRecordAppDelegate *delegate;
}

@property (nonatomic, strong) UILabel *monthLabel;
@property (nonatomic, strong) UIButton *previousButton;
@property (nonatomic, strong) UIButton *nextButton;
@property (nonatomic, strong) UIButton *todayButton;
@property (nonatomic, strong) UIButton *createEventButton;
@property (nonatomic, strong) UIButton *optionsButton;
@property (nonatomic, strong) UIButton *backButton;

@property (nonatomic, strong) NSMutableArray *events;
@property (nonatomic, strong) NSMutableArray *iconEvents;

@property (nonatomic, strong) DPCalendarMonthlyView *monthlyView;

@end

@implementation DPCalendarTestViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self.view setBackgroundColor:[UIColor whiteColor]];
        [self generateData];
        [self commonInit];
        [self initWithColorPatternForDates];
    }
    return self;
}
-(void)initWithColorPatternForDates
{
    
}
-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self generateData];
        [self commonInit];
    }
    return self;
}

-(void) commonInit {
    [self generateMonthlyView];
    [self updateLabelWithMonth:self.monthlyView.seletedMonth];
}

- (void) generateMonthlyView {
    CGFloat width = [self.class currentSize].width;
    CGFloat height = [self.class currentSize].height;
    
    [self.previousButton removeFromSuperview];
    [self.nextButton removeFromSuperview];
    [self.monthLabel removeFromSuperview];
    [self.todayButton removeFromSuperview];
    [self.optionsButton removeFromSuperview];
    [self.createEventButton removeFromSuperview];
    
    self.monthLabel = [[UILabel alloc] initWithFrame:CGRectMake((width - 100) / 2, 20, 100, 20)];
    [self.monthLabel setTextAlignment:NSTextAlignmentCenter];
    
    self.previousButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.previousButton setBackgroundImage:[UIImage imageNamed:@"IconArrowPrev"] forState:UIControlStateNormal];
    self.nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.nextButton setBackgroundImage:[UIImage imageNamed:@"IconArrowNext"] forState:UIControlStateNormal];
    self.todayButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.optionsButton  = [UIButton buttonWithType:UIButtonTypeRoundedRect];
   // self.createEventButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
   // [self.createEventButton setBackgroundImage:[UIImage imageNamed:@"BtnAddSomething"] forState:UIControlStateNormal];
    
    self.previousButton.frame = CGRectMake(self.monthLabel.frame.origin.x - 18, 20, 18, 20);
    self.nextButton.frame = CGRectMake(CGRectGetMaxX(self.monthLabel.frame), 20, 18, 20);
    self.todayButton.frame = CGRectMake(width - 60, 20, 60, 21);
    self.backButton.frame = CGRectMake(60, 20, 50, 20);
    //    self.optionsButton.frame = CGRectMake(width - 50 * 3, 20, 50, 20);
  //  self.createEventButton.frame = CGRectMake(10, 20, 50, 20);
    [self.todayButton setTitle:@"Today" forState:UIControlStateNormal];
    [self.optionsButton setTitle:@"Option" forState:UIControlStateNormal];
    [self.backButton setTitle:@"Back" forState:UIControlStateNormal];
   // [self.createEventButton setTitle:@"Help" forState:UIControlStateNormal];
    
    
    
    [self.previousButton addTarget:self action:@selector(previousButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
    [self.nextButton addTarget:self action:@selector(nextButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
    [self.todayButton addTarget:self action:@selector(todayButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
    [self.backButton addTarget:self action:@selector(backButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
    //  [self.optionsButton addTarget:self action:@selector(optionsButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
      // [self.createEventButton addTarget:self action:@selector(createEventButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.monthLabel];
    [self.view addSubview:self.previousButton];
    [self.view addSubview:self.nextButton];
    [self.view addSubview:self.todayButton];
    [self.view addSubview:self.backButton];
    //    [self.view addSubview:self.optionsButton];
    [self.view addSubview:self.createEventButton];
    [self.monthlyView removeFromSuperview];
    self.monthlyView = [[DPCalendarMonthlyView alloc] initWithFrame:CGRectMake(0, 50, width, height - 50) delegate:self];
    [self.view addSubview:self.monthlyView];
    //    NSLog(@"Events in patient %@",self.events);
    [self.monthlyView setEvents:self.events complete:nil];
    // [self.monthlyView setIconEvents:self.iconEvents complete:nil];
}

- (void) generateData {
    delegate=AppDelegate;
    self.events = @[].mutableCopy;
    self.iconEvents = @[].mutableCopy;
    self.events=delegate.ListOfAppointments;
    
    
    //    NSDate *date = [[NSDate date] dateByAddingYears:0 months:0 days:0];
    //    UIImage *icon = [UIImage imageNamed:@"IconPubHol"];
    //    UIImage *greyIcon = [UIImage imageNamed:@"IconDateGrey"];
    //
    //    NSArray *titles = @[@"Research", @"Study", @"Work"];
    //    //Research -Orange //Study -Blue //Work -Pink
    //
    //    for (int i = 0; i < 60; i++) {
    //        if (arc4random() % 2 > 0) {
    //            int index = arc4random() % 3;
    //            DPCalendarEvent *event = [[DPCalendarEvent alloc] initWithTitle:[titles objectAtIndex:index] startTime:date endTime:[date dateByAddingYears:0 months:0 days:arc4random() % 3] colorIndex:index];
    //            [self.events addObject:event];
    //        }
    //
    //        if (arc4random() % 2 > 0) {
    //            DPCalendarIconEvent *iconEvent = [[DPCalendarIconEvent alloc] initWithStartTime:date endTime:[date dateByAddingYears:0 months:0 days:0] icon:icon];
    //            [self.iconEvents addObject:iconEvent];
    //
    //
    //            iconEvent = [[DPCalendarIconEvent alloc] initWithTitle:[NSString stringWithFormat:@"Icon Event %d", i] startTime:date endTime:[date dateByAddingYears:0 months:0 days:0] icon:greyIcon bkgColorIndex:1];
    //            [self.iconEvents addObject:iconEvent];
    //        }
    //
    //        date = [date dateByAddingYears:0 months:0 days:1];
    //    }
    //
    
}

- (void) backButtonSelected:(id)button {
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

-(void) previousButtonSelected:(id)button {
    [self.monthlyView scrollToPreviousMonthWithComplete:nil];
}

-(void) nextButtonSelected:(id)button {
    [self.monthlyView scrollToNextMonthWithComplete:nil];
}

-(void) todayButtonSelected:(id)button {
    [self.monthlyView clickDate:[NSDate date]];
}

-(void) optionsButtonSelected:(id)button {
    DPCalendarTestOptionsViewController *optionController = [DPCalendarTestOptionsViewController new];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:optionController];
    navController.modalPresentationStyle = UIModalPresentationFormSheet;
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setTitle:@"TEST" forState:UIControlStateNormal];
    rightBtn.frame = CGRectMake(0, 0, 70, 40 );
    UIBarButtonItem *rightBarBtn = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    navController.navigationItem.rightBarButtonItem = rightBarBtn;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
        [self presentViewController:navController animated:YES completion:nil];
    } else {
        
    }
}

- (void) createEventButtonSelected:(DPCalendarEvent *)dynamic_event {
    DPCalendarTestCreateEventViewController *createEventController = [DPCalendarTestCreateEventViewController new];
    createEventController.delegate = self;
    
    createEventController.event=dynamic_event;
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:createEventController];
    navController.modalPresentationStyle = UIModalPresentationFormSheet;
    [navController topViewController].title = @"Create Appointment";
    if (isUpdating) {
        [navController topViewController].title = @"Reschedule Appointment";
    }
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setTitle:@"Done" forState:UIControlStateNormal];
    rightBtn.frame = CGRectMake(0, 0, 70, 40 );
    UIBarButtonItem *rightBarBtn = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    navController.navigationItem.rightBarButtonItem = rightBarBtn;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
        [self presentViewController:navController animated:YES completion:nil];
    }
    
}
//- (void) createEventButton:(id *)sender {
//    
////    DPCalendarTestCreateEventViewController *createEventController = [DPCalendarTestCreateEventViewController new];
////    createEventController.delegate = self;
////
////
////    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:createEventController];
////    navController.modalPresentationStyle = UIModalPresentationFormSheet;
////      [navController topViewController].title = @"Create Appointment";
////    if (isUpdating) {
////          [navController topViewController].title = @"Reschedule Appointment";
////    }
////
////    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
////    [rightBtn setTitle:@"Done" forState:UIControlStateNormal];
////    rightBtn.frame = CGRectMake(0, 0, 70, 40 );
////    UIBarButtonItem *rightBarBtn = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
////    navController.navigationItem.rightBarButtonItem = rightBarBtn;
////    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
////        [self presentViewController:navController animated:YES completion:nil];
////    }
//
//}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
    IndexOfUpdatedEvent=0;
    isUpdating=FALSE;
    delegate=AppDelegate;
    [self updateLabelWithMonth:self.monthlyView.seletedMonth];
}

- (void) updateLabelWithMonth:(NSDate *)month {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MMM YYYY"];
    NSString *stringFromDate = [formatter stringFromDate:month];
    [self.monthLabel setText:stringFromDate];
}

#pragma DPCalendarMonthlyViewDelegate
-(void)didScrollToMonth:(NSDate *)month firstDate:(NSDate *)firstDate lastDate:(NSDate *)lastDate{
    [self updateLabelWithMonth:month];
}

-(void)didSkipToMonth:(NSDate *)month firstDate:(NSDate *)firstDate lastDate:(NSDate *)lastDate {
    [self updateLabelWithMonth:month];
}

-(void)didTapEvent:(DPCalendarEvent *)event onDate:(NSDate *)date {
    NSLog(@"Touched event %@, date %@", event.title, date);
}

-(BOOL)shouldHighlightItemWithDate:(NSDate *)date {
    return YES;
}

-(BOOL)shouldSelectItemWithDate:(NSDate *)date {
    return YES;
}

-(void)didSelectItemWithDate:(NSDate *)date {
    //NSLog(@"Select date %@ with \n events %@ \n and icon events %@", date, [self.monthlyView eventsForDay:date], [self.monthlyView iconEventsForDay:date]);
    response_date=date;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate  *today=[[NSDate date]dateByAddingYears:0 months:0 days:0];
    NSDate *s_date=[date dateByAddingYears:0 months:0 days:1];
    NSDate *s_date1=[date dateByAddingYears:0 months:0 days:0];
    NSString *selected_string=[formatter stringFromDate:s_date1];
    NSDateFormatter *weekFormatter = [[NSDateFormatter alloc] init] ;
    [weekFormatter setDateFormat:@"EEEE"];
    NSString *weekday= [weekFormatter stringFromDate:s_date1];
    // NSLog(@"Select date %@ and status %hhd",selected_string,[delegate.ListOfHolidays containsObject:selected_string]);
    NSLog(@"Select date %@ with  today date %@", [formatter stringFromDate:s_date1], today);
    if (([s_date compare:today]==NSOrderedAscending)||([weekday isEqualToString:@"Sunday"])||([weekday isEqualToString:@"Saturday"]))
    {
        UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"Info" message:@"The day you have clicked is Unavailable! Please try to get an Appointment on some other days! Thank You!!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if([delegate.ListOfHolidays containsObject:selected_string])
    {
        UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"Info" message:@"The day you have clicked is Unavailable! Please try to get an Appointment on some other days! Thank You!!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if ([delegate.ListOfappointment_status valueForKey:[formatter stringFromDate:s_date1]])
    {
        NSString *status_for_date=[delegate.ListOfappointment_status valueForKey:[formatter stringFromDate:s_date1]];
        if ([status_for_date isEqualToString:@"Available"])
        {
            if (![self.monthlyView eventsForDay:date]) {
                isUpdating=FALSE;
                selected_date=[date dateByAddingYears:0 months:0 days:0];
                DPCalendarEvent *event1=[[DPCalendarEvent alloc]initWithTitle:@"Appointment" startTime:selected_date endTime:[self Get_EndDate:[date dateByAddingYears:0 months:0 days:1]] description:@"" colorIndex:1];
                [self createEventButtonSelected:event1];
                
            }
            else
            {
            NSArray *listOfeventsForDay=[self.monthlyView eventsForDay:date];
            if ([listOfeventsForDay count]>0) {
                DPCalendarEvent *event=[listOfeventsForDay objectAtIndex:0];
                //            NSLog(@"Selected event datas title %@ with \n s_date %@ \n and e_time %@", event.title, event.startTime,event.endTime);
                isUpdating=TRUE;
                IndexOfUpdatedEvent= [self FindIndexOfEvent:event];
                [self createEventButtonSelected:event];
            }
            }
        }
        else if ([status_for_date isEqualToString:@"Waiting"])
        {
            UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"Info" message:@"Your appointment will be in waiting status.Would you like to proceed?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
            [alert show];
        }
        else if ([status_for_date isEqualToString:@"Full"])
        {
            UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"Info" message:@"The day you have clicked is Unavailable! Please try to get an Appointment on some other days! Thank You!!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
        }
    }
    
    else if (![self.monthlyView eventsForDay:date]) {
        isUpdating=FALSE;
        selected_date=[date dateByAddingYears:0 months:0 days:0];
        DPCalendarEvent *event1=[[DPCalendarEvent alloc]initWithTitle:@"Appointment" startTime:selected_date endTime:[self Get_EndDate:[date dateByAddingYears:0 months:0 days:1]] description:@"" colorIndex:1];
        [self createEventButtonSelected:event1];
        
    }
    else
    {
        
        
        NSArray *listOfeventsForDay=[self.monthlyView eventsForDay:date];
        if ([listOfeventsForDay count]>0) {
            DPCalendarEvent *event=[listOfeventsForDay objectAtIndex:0];
            //            NSLog(@"Selected event datas title %@ with \n s_date %@ \n and e_time %@", event.title, event.startTime,event.endTime);
            isUpdating=TRUE;
            IndexOfUpdatedEvent= [self FindIndexOfEvent:event];
            [self createEventButtonSelected:event];
        }
        
        
    }
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==1)
    {
        if (![self.monthlyView eventsForDay:response_date]) {
            isUpdating=FALSE;
            selected_date=[response_date dateByAddingYears:0 months:0 days:0];
            DPCalendarEvent *event1=[[DPCalendarEvent alloc]initWithTitle:@"Waiting for app" startTime:selected_date endTime:[self Get_EndDate:[response_date dateByAddingYears:0 months:0 days:1]] description:@"" colorIndex:1];
            [self createEventButtonSelected:event1];
            
        }
        else
        {
            
            
            NSArray *listOfeventsForDay=[self.monthlyView eventsForDay:response_date];
            if ([listOfeventsForDay count]>0) {
                DPCalendarEvent *event=[listOfeventsForDay objectAtIndex:0];
                //            NSLog(@"Selected event datas title %@ with \n s_date %@ \n and e_time %@", event.title, event.startTime,event.endTime);
                isUpdating=TRUE;
                IndexOfUpdatedEvent= [self FindIndexOfEvent:event];
                [self createEventButtonSelected:event];
            }
        }
       // NSLog(@"alert in test");
    }
    else if (buttonIndex==0)
    {
        NSLog(@"Cancelled");
    }
}
-(NSDate*)Get_EndDate:(NSDate *)date
{
    NSString *stringDate = [NSString stringWithFormat:@"%@",date];
    //        NSLog(@"Reschedule gng to handle date for 4th case %@",stringDate);
    NSArray *mycomp = [stringDate componentsSeparatedByCharactersInSet:
                       [NSCharacterSet characterSetWithCharactersInString:@" "]
                       ];
    stringDate  = [mycomp objectAtIndex:0];
    
    NSString *endDate=  [NSString stringWithFormat:@"%@ 00:00:00 +0000",stringDate];
    NSDateFormatter *formatter1 = [[NSDateFormatter alloc] init];
    [formatter1 setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
    NSDate *converted_endDate=  [formatter1 dateFromString:endDate];
    return converted_endDate;
    
}
-(int)FindIndexOfEvent:(DPCalendarEvent*)Receivedevent
{
    for (int i=0; i<[self.events count]; i++) {
        DPCalendarEvent* event=[self.events objectAtIndex:i];
        if (([event.title isEqualToString:Receivedevent.title]) && ([event.startTime compare:Receivedevent.startTime]==NSOrderedSame) &&([event.endTime compare:Receivedevent.endTime]==NSOrderedSame))
        {
            return i;
        }
    }
    return 0;
    
}


-(NSDictionary *) ipadMonthlyViewAttributes {
    return @{
             DPCalendarMonthlyViewAttributeCellRowHeight: @23,
             //             DPCalendarMonthlyViewAttributeEventDrawingStyle: [NSNumber numberWithInt:DPCalendarMonthlyViewEventDrawingStyleUnderline],
             DPCalendarMonthlyViewAttributeStartDayOfWeek: @1,
             DPCalendarMonthlyViewAttributeWeekdayFont: [UIFont systemFontOfSize:18],
             DPCalendarMonthlyViewAttributeDayFont: [UIFont systemFontOfSize:14],
             DPCalendarMonthlyViewAttributeEventFont: [UIFont systemFontOfSize:14],
             DPCalendarMonthlyViewAttributeMonthRows:@5,
             DPCalendarMonthlyViewAttributeIconEventBkgColors: @[[UIColor clearColor], [UIColor colorWithRed:239/255.f green:239/255.f blue:244/255.f alpha:1]]
             
             
             };
}

-(NSDictionary *) iphoneMonthlyViewAttributes {
    return @{
             DPCalendarMonthlyViewAttributeEventDrawingStyle: [NSNumber numberWithInt:DPCalendarMonthlyViewEventDrawingStyleUnderline],
             DPCalendarMonthlyViewAttributeCellNotInSameMonthSelectable: @YES,
             DPCalendarMonthlyViewAttributeMonthRows:@3
             };
    
}

-(NSDictionary *)monthlyViewAttributes {
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
        return [self ipadMonthlyViewAttributes];
    } else {
        return [self iphoneMonthlyViewAttributes];
    }
}

#pragma mark - Utilities

+(CGSize) currentSize
{
    return [self sizeInOrientation:[UIApplication sharedApplication].statusBarOrientation];
}

+(CGSize) sizeInOrientation:(UIInterfaceOrientation)orientation
{
    CGSize size = [UIScreen mainScreen].bounds.size;
    if (UIInterfaceOrientationIsLandscape(orientation))
    {
        size = CGSizeMake(size.height, size.width);
    }
    return size;
}

#pragma mark - DPCalendarTestCreateEventViewControllerDelegate
-(void)eventCreated:(DPCalendarEvent *)event {
    
    if (isUpdating) {
        [self.events replaceObjectAtIndex:IndexOfUpdatedEvent withObject:event];
        self.monthlyView.MultipletimeReloading=TRUE;
        [self.monthlyView setEvents:self.events complete:nil];
    }
    else
    {
        [self.events addObject:event];
          self.monthlyView.MultipletimeReloading=TRUE;
        [self.monthlyView setEvents:self.events complete:nil];
    }
 
}


#pragma mark - Rotation
-(BOOL)shouldAutorotate {
    return YES;
    
}

-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    [self commonInit];
}

@end
