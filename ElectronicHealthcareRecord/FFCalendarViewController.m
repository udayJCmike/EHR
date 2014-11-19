//
//  FFCalendarViewController.m
//  FFCalendar
//
//  Created by Fernanda G. Geraissate on 12/02/14.
//  Copyright (c) 2014 Fernanda G. Geraissate. All rights reserved.
//
//  http://fernandasportfolio.tumblr.com
//

#import "FFCalendarViewController.h"

#import "FFCalendar.h"

@interface FFCalendarViewController () <FFButtonAddEventWithPopoverProtocol, FFYearCalendarViewProtocol, FFMonthCalendarViewProtocol, FFWeekCalendarViewProtocol, FFDayCalendarViewProtocol>
@property (nonatomic) BOOL boolDidLoad;
@property (nonatomic) BOOL boolYearViewIsShowing;
@property (nonatomic, strong) NSMutableDictionary *dictEvents;
@property (nonatomic, strong) UILabel *labelWithMonthAndYear;
@property (nonatomic, strong) NSArray *arrayButtons;
@property (nonatomic, strong) NSArray *arrayCalendars;
@property (nonatomic, strong) FFEditEventPopoverController *popoverControllerEditar;
@property (nonatomic, strong) FFYearCalendarView *viewCalendarYear;
@property (nonatomic, strong) FFMonthCalendarView *viewCalendarMonth;
@property (nonatomic, strong) FFWeekCalendarView *viewCalendarWeek;
@property (nonatomic, strong) FFDayCalendarView *viewCalendarDay;
@end

@implementation FFCalendarViewController

#pragma mark - Synthesize

@synthesize boolDidLoad;
@synthesize boolYearViewIsShowing;
@synthesize protocol;
@synthesize arrayWithEvents;
@synthesize dictEvents;
@synthesize labelWithMonthAndYear;
@synthesize arrayButtons;
@synthesize arrayCalendars;
@synthesize popoverControllerEditar;
@synthesize viewCalendarYear;
@synthesize viewCalendarMonth;
@synthesize viewCalendarWeek;
@synthesize viewCalendarDay;

#pragma mark - Lifecycle

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
   [self setArrayWithEvents:[self arrayWithEvents]];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dateChanged:) name:DATE_MANAGER_DATE_CHANGED object:nil];
    
   // [self customNavigationBarLayout];
    [self addRightBarButtonItems];
    [self addLeftBarButtonItems];
    [self addCalendars];
    
    [self buttonYearMonthWeekDayAction:[arrayButtons objectAtIndex:0]];
//       self.navigationItem.leftItemsSupplementBackButton = YES;
//        self.navigationItem.backBarButtonItem.tintColor = [UIColor redColor];
//    if (_executer == nil)
//        _executer = [[SHStripeMenuExecuter alloc] init];
//    [_executer setupToParentView:self];
// SideBar
    
}
- (NSMutableArray *)arrayWithEvents {
    
    FFEvent *event1 = [FFEvent new];
    [event1 setStringCustomerName: @"Customer A"];
    [event1 setNumCustomerID:@1];
    [event1 setDateDay:[NSDate dateWithYear:[NSDate componentsOfCurrentDate].year month:[NSDate componentsOfCurrentDate].month day:[NSDate componentsOfCurrentDate].day]];
    [event1 setDateTimeBegin:[NSDate dateWithHour:10 min:00]];
    [event1 setDateTimeEnd:[NSDate dateWithHour:10 min:35]];
    [event1 setArrayWithGuests:[NSMutableArray arrayWithArray:@[@[@111, @"Guest 2", @"email2@email.com"], @[@111, @"Guest 4", @"email4@email.com"], @[@111, @"Guest 5", @"email5@email.com"], @[@111, @"Guest 7", @"email7@email.com"]]]];
    
    
    
    return [NSMutableArray arrayWithArray:@[event1]];
            
            }
- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    if (!boolDidLoad) {
        boolDidLoad = YES;
        [self buttonTodayAction:nil];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - FFDateManager Notification

- (void)dateChanged:(NSNotification *)notification {
    
    [self updateLabelWithMonthAndYear];
}

- (void)updateLabelWithMonthAndYear {
    
    NSDateComponents *comp = [NSDate componentsOfDate:[[FFDateManager sharedManager] currentDate]];
    NSString *string = boolYearViewIsShowing ? [NSString stringWithFormat:@"%li", (long)comp.year] : [NSString stringWithFormat:@"%@ %li", [arrayMonthName objectAtIndex:comp.month-1], (long)comp.year];
    [labelWithMonthAndYear setText:string];
}

#pragma mark - Init dictEvents

- (void)setArrayWithEvents:(NSMutableArray *)_arrayWithEvents {
    
    arrayWithEvents = _arrayWithEvents;
    
    dictEvents = [NSMutableDictionary new];
    
    for (FFEvent *event in _arrayWithEvents) {
        NSDateComponents *comp = [NSDate componentsOfDate:event.dateDay];
        NSDate *newDate = [NSDate dateWithYear:comp.year month:comp.month day:comp.day];
        NSMutableArray *array = [dictEvents objectForKey:newDate];
        if (!array) {
            array = [NSMutableArray new];
            [dictEvents setObject:array forKey:newDate];
        }
        [array addObject:event];
    }
}

#pragma mark - Custom NavigationBar

- (void)customNavigationBarLayout {
    
    if([[[UIDevice currentDevice] systemVersion] floatValue] >= 7) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setBarTintColor:[UIColor lighterGrayCustom]];
    self.navigationItem.backBarButtonItem.tintColor = [UIColor redColor];
    [self addRightBarButtonItems];
    [self addLeftBarButtonItems];
}

- (void)addRightBarButtonItems {
    
    UIBarButtonItem *fixedItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixedItem.width = 30.;
    
    FFRedAndWhiteButton *buttonYear = [self calendarButtonWithTitle:@"year"];
    FFRedAndWhiteButton *buttonMonth = [self calendarButtonWithTitle:@"month"];
    FFRedAndWhiteButton *buttonWeek = [self calendarButtonWithTitle:@"week"];
    FFRedAndWhiteButton *buttonDay = [self calendarButtonWithTitle:@"day"];
    
    UIBarButtonItem *barButtonYear = [[UIBarButtonItem alloc] initWithCustomView:buttonYear];
    UIBarButtonItem *barButtonMonth = [[UIBarButtonItem alloc] initWithCustomView:buttonMonth];
    UIBarButtonItem *barButtonWeek = [[UIBarButtonItem alloc] initWithCustomView:buttonWeek];
    UIBarButtonItem *barButtonDay = [[UIBarButtonItem alloc] initWithCustomView:buttonDay];
    
    FFButtonAddEventWithPopover *buttonAdd = [[FFButtonAddEventWithPopover alloc] initWithFrame:CGRectMake(0., 0., 30., 44)];
    [buttonAdd setProtocol:self];
    UIBarButtonItem *barButtonAdd = [[UIBarButtonItem alloc] initWithCustomView:buttonAdd];
    
    arrayButtons = @[buttonYear, buttonMonth, buttonWeek, buttonDay];
    [self.navigationItem setRightBarButtonItems:@[barButtonAdd, fixedItem, barButtonYear, barButtonMonth, barButtonWeek, barButtonDay]];
}

- (void)addLeftBarButtonItems {
    
    UIBarButtonItem *fixedItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixedItem.width = 30.;
    
    FFRedAndWhiteButton *buttonToday = [[FFRedAndWhiteButton alloc] initWithFrame:CGRectMake(0., 0., 80., 30)];
    [buttonToday addTarget:self action:@selector(buttonTodayAction:) forControlEvents:UIControlEventTouchUpInside];
    [buttonToday setTitle:@"today" forState:UIControlStateNormal];
    UIBarButtonItem *barButtonToday = [[UIBarButtonItem alloc] initWithCustomView:buttonToday];
    
    labelWithMonthAndYear = [[UILabel alloc] initWithFrame:CGRectMake(0., 0., 170., 30)];
    [labelWithMonthAndYear setTextColor:[UIColor redColor]];
    [labelWithMonthAndYear setFont:buttonToday.titleLabel.font];
    UIBarButtonItem *barButtonLabel = [[UIBarButtonItem alloc] initWithCustomView:labelWithMonthAndYear];
    
    UIButton *back = [[UIButton alloc] initWithFrame:CGRectMake(0., 0., 50, 30)];
    [back setTitle:@"Back" forState:UIControlStateNormal];
    [back addTarget:self action:@selector(back_action:) forControlEvents:UIControlEventTouchUpInside];
    [back setTitleColor:[UIColor redColor]  forState:UIControlStateNormal];
   
    UIBarButtonItem *barBackButtonLabel = [[UIBarButtonItem alloc] initWithCustomView:back];
    
  //[self.navigationItem.leftBarButtonItems arrayByAddingObject:@[barBackButtonLabel,barButtonLabel, barButtonToday]];
    [self.navigationItem setLeftBarButtonItems:@[barBackButtonLabel,barButtonLabel, barButtonToday]];
}
-(IBAction)back_action:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (FFRedAndWhiteButton *)calendarButtonWithTitle:(NSString *)title {
    
    FFRedAndWhiteButton *button = [[FFRedAndWhiteButton alloc] initWithFrame:CGRectMake(0., 0., 80., 30.)];
    [button addTarget:self action:@selector(buttonYearMonthWeekDayAction:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:title forState:UIControlStateNormal];
    return button;
}

#pragma mark - Add Calendars

- (void)addCalendars {
    
    CGRect frame = CGRectMake(0., 0., self.Inner_View.frame.size.width, self.Inner_View.frame.size.height);
    
    viewCalendarYear = [[FFYearCalendarView alloc] initWithFrame:frame];
    [viewCalendarYear setProtocol:self];
    [self.Inner_View addSubview:viewCalendarYear];
    
    viewCalendarMonth = [[FFMonthCalendarView alloc] initWithFrame:frame];
    [viewCalendarMonth setProtocol:self];
    [viewCalendarMonth setDictEvents:dictEvents];
    [self.Inner_View addSubview:viewCalendarMonth];
    
    viewCalendarWeek = [[FFWeekCalendarView alloc] initWithFrame:frame];
    [viewCalendarWeek setProtocol:self];
    [viewCalendarWeek setDictEvents:dictEvents];
    [self.Inner_View addSubview:viewCalendarWeek];
    
    viewCalendarDay = [[FFDayCalendarView alloc] initWithFrame:frame];
    [viewCalendarDay setProtocol:self];
    [viewCalendarDay setDictEvents:dictEvents];
    [self.Inner_View addSubview:viewCalendarDay];
    
    arrayCalendars = @[viewCalendarYear, viewCalendarMonth, viewCalendarWeek, viewCalendarDay];
}

#pragma mark - Button Action

- (IBAction)buttonYearMonthWeekDayAction:(id)sender {
    
    long index = [arrayButtons indexOfObject:sender];
    
    [self.Inner_View bringSubviewToFront:[arrayCalendars objectAtIndex:index]];
   
    for (UIButton *button in arrayButtons) {
        button.selected = (button == sender);
    }
  //  [_executer setupToParentView:self];  SideBar
    
    boolYearViewIsShowing = (index == 0);
    [self updateLabelWithMonthAndYear];
}

- (IBAction)buttonTodayAction:(id)sender {
    
    [[FFDateManager sharedManager] setCurrentDate:[NSDate dateWithYear:[NSDate componentsOfCurrentDate].year
                                                                 month:[NSDate componentsOfCurrentDate].month
                                                                   day:[NSDate componentsOfCurrentDate].day]];
}

#pragma mark - Interface Rotation

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    
    [viewCalendarYear invalidateLayout];
    [viewCalendarMonth invalidateLayout];
    [viewCalendarWeek invalidateLayout];
    [viewCalendarDay invalidateLayout];
}

#pragma mark - FFButtonAddEventWithPopover Protocol

- (void)addNewEvent:(FFEvent *)eventNew {
    
    NSMutableArray *arrayNew = [dictEvents objectForKey:eventNew.dateDay];
    if (!arrayNew) {
        arrayNew = [NSMutableArray new];
        [dictEvents setObject:arrayNew forKey:eventNew.dateDay];
    }
    [arrayNew addObject:eventNew];
    
    [self setNewDictionary:dictEvents];
}

#pragma mark - FFMonthCalendarView, FFWeekCalendarView and FFDayCalendarView Protocols

- (void)setNewDictionary:(NSDictionary *)dict {
    
    dictEvents = (NSMutableDictionary *)dict;
    
    [viewCalendarMonth setDictEvents:dictEvents];
    [viewCalendarWeek setDictEvents:dictEvents];
    [viewCalendarDay setDictEvents:dictEvents];
    
    [self arrayUpdatedWithAllEvents];
}

#pragma mark - FFYearCalendarView Protocol

- (void)showMonthCalendar {
    
    [self buttonYearMonthWeekDayAction:[arrayButtons objectAtIndex:1]];
}


- (void)showDayCalendar {
    
    [self buttonYearMonthWeekDayAction:[arrayButtons objectAtIndex:3]];
}

#pragma mark - Sending Updated Array to FFCalendarViewController Protocol

- (void)arrayUpdatedWithAllEvents {
    
    NSMutableArray *arrayNew = [NSMutableArray new];
    
    NSArray *arrayKeys = dictEvents.allKeys;
    for (NSDate *date in arrayKeys) {
        NSArray *arrayOfDate = [dictEvents objectForKey:date];
        for (FFEvent *event in arrayOfDate) {
            [arrayNew addObject:event];
        }
    }
    
    if (protocol != nil && [protocol respondsToSelector:@selector(arrayUpdatedWithAllEvents:)]) {
        [protocol arrayUpdatedWithAllEvents:arrayNew];
    }
}
//- (void)stripeMenuItemSelected:(NSString *)menuName           SideBar
//{
//    if ([menuName isEqualToString:@"Home"])
//    {
//        NSLog(@"Home");
//        [self.navigationController popViewControllerAnimated:YES];
//    }
//    else if ([menuName isEqualToString:@"Today"])
//    {
//       
//       
//        
//     
//        
//    }
//    else if ([menuName isEqualToString:@"Day"])
//    {
//          [self calendarButtonWithTitle:@"day"];
//    }
//    else if ([menuName isEqualToString:@"Week"])
//    {
//        [self calendarButtonWithTitle:@"week"];
//    }
//    else if ([menuName isEqualToString:@"Month"])
//    {
//         [self calendarButtonWithTitle:@"month"];
//    }
//    else if ([menuName isEqualToString:@"Year"])
//    {
//         [self calendarButtonWithTitle:@"year"];
//    }
//    else if ([menuName isEqualToString:@"Add"])
//    {
//        NSLog(@"Add");
//    }
//    else if ([menuName isEqualToString:@"Cancel"])
//    {
//        NSLog(@"Cancel");
//    }
//}
@end
