//
//  DPCalendarTestStoryboardViewController.m
//  DPCalendar
//
//  Created by Shan Wang on 15/03/2014.
//  Copyright (c) 2014 Ethan Fang. All rights reserved.
//

#import "DPCalendarTestStoryboardViewController.h"
#import "DPCalendarMonthlyView.h"
#import "DPCalendarEvent.h"
#import "DPCalendarIconEvent.h"
#import "NSDate+DP.h"

@interface DPCalendarTestStoryboardViewController ()<DPCalendarMonthlyViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet DPCalendarMonthlyView *calendarMonthlyView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (nonatomic, strong) NSMutableArray *events;
@property (nonatomic, strong) NSMutableArray *iconEvents;

@property (weak, nonatomic) IBOutlet UICollectionView *titleCollectionView;
@property (nonatomic, strong) NSArray *titles;
@end


@implementation DPCalendarTestStoryboardViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.titleCollectionView.backgroundColor = [UIColor whiteColor];
    self.titleCollectionView.delegate = self;
    self.titleCollectionView.dataSource = self;
    self.titles = @[@"Sun", @"Mon", @"Tue",@"Wed",@"Thu",@"Fri",@"Sat"];
    
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.sectionInset = UIEdgeInsetsZero;
    layout.minimumInteritemSpacing = 0.f;
    layout.minimumLineSpacing = 0.f;
    layout.headerReferenceSize = CGSizeZero;
    layout.footerReferenceSize = CGSizeZero;
    self.titleCollectionView.collectionViewLayout = layout;
    
    self.calendarMonthlyView.monthlyViewDelegate = self;
    
   [self generateData];
    [self.calendarMonthlyView setEvents:self.events complete:nil];
    [self.calendarMonthlyView setIconEvents:self.iconEvents complete:nil];
    
	[self updateLabelWithMonth:self.calendarMonthlyView.seletedMonth];
}

- (IBAction)backButtonClicked:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) updateLabelWithMonth:(NSDate *)month {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MMM YYYY"];
    NSString *stringFromDate = [formatter stringFromDate:month];
    [self.titleLabel setText:stringFromDate];
}

- (void) generateData {
    self.events = @[].mutableCopy;
    self.iconEvents = @[].mutableCopy;
    
    
    NSDate *date = [[NSDate date] dateByAddingYears:0 months:0 days:0];
    UIImage *icon = [UIImage imageNamed:@"IconPubHol"];
    UIImage *greyIcon = [UIImage imageNamed:@"IconDateGrey"];
    
    NSArray *titles = @[@"Research", @"Study", @"Work"];
    
    for (int i = 0; i < 60; i++) {
        if (arc4random() % 2 > 0) {
            int index = arc4random() % 3;
            DPCalendarEvent *event = [[DPCalendarEvent alloc] initWithTitle:[titles objectAtIndex:index] startTime:date endTime:[date dateByAddingYears:0 months:0 days:arc4random() % 3] colorIndex:index];
            [self.events addObject:event];
        }
        
        if (arc4random() % 2 > 0) {
            DPCalendarIconEvent *iconEvent = [[DPCalendarIconEvent alloc] initWithStartTime:date endTime:[date dateByAddingYears:0 months:0 days:0] icon:icon];
            [self.iconEvents addObject:iconEvent];
            
            
            iconEvent = [[DPCalendarIconEvent alloc] initWithTitle:[NSString stringWithFormat:@"%d", i] startTime:date endTime:[date dateByAddingYears:0 months:0 days:0] icon:greyIcon bkgColorIndex:1];
            [self.iconEvents addObject:iconEvent];
        }
        
        date = [date dateByAddingYears:0 months:0 days:1];
    }
    NSLog(@"events %@",self.events);
     NSLog(@"iconEvents %@",self.iconEvents);
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
    NSLog(@"Select date %@ with \n events %@ \n and icon events %@", date, [self.calendarMonthlyView eventsForDay:date], [self.calendarMonthlyView iconEventsForDay:date]);
}

-(NSDictionary *)monthlyViewAttributes {
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        return [self ipadMonthlyViewAttributes];
    } else {
        return [self iphoneMonthlyViewAttributes];
    }
}
-(NSDictionary *) iphoneMonthlyViewAttributes {
    return @{
             DPCalendarMonthlyViewAttributeEventDrawingStyle: [NSNumber numberWithInt:DPCalendarMonthlyViewEventDrawingStyleUnderline],
             DPCalendarMonthlyViewAttributeCellNotInSameMonthSelectable: @YES,
             DPCalendarMonthlyViewAttributeMonthRows:@3,
             DPCalendarMonthlyViewAttributeWeekdayHeight: @0.f
             };
}

-(NSDictionary *) ipadMonthlyViewAttributes {
    return @{
             DPCalendarMonthlyViewAttributeCellRowHeight: @23,
             DPCalendarMonthlyViewAttributeStartDayOfWeek: @0,
             DPCalendarMonthlyViewAttributeWeekdayFont: [UIFont systemFontOfSize:18],
             DPCalendarMonthlyViewAttributeDayFont: [UIFont systemFontOfSize:14],
             DPCalendarMonthlyViewAttributeEventFont: [UIFont systemFontOfSize:14],
             DPCalendarMonthlyViewAttributeMonthRows:@5,
             DPCalendarMonthlyViewAttributeIconEventBkgColors: @[[UIColor clearColor], [UIColor colorWithRed:239/255.f green:239/255.f blue:244/255.f alpha:1]],
             DPCalendarMonthlyViewAttributeWeekdayHeight: @0.f
             };
}

#pragma mark - Rotation

-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    [self.calendarMonthlyView resetViews];
    [self.titleCollectionView reloadData];
}

-(BOOL)shouldAutorotate {
    return YES;
}

-(BOOL)shouldAutomaticallyForwardAppearanceMethods{
    [self.calendarMonthlyView resetViews];
    return YES;
}

- (void)orientationChanged:(NSNotification *)notification
{
    [self.calendarMonthlyView resetViews];
}

#pragma mark - UICollectionViewDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 7;
}

#define CalendarTitleCellIdentifier @"CalendarTitleCellIdentifier"

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CalendarTitleCellIdentifier forIndexPath:indexPath];
    UILabel *label = (UILabel *)[cell viewWithTag:1];
    CGSize size = [self collectionView:collectionView layout:collectionView.collectionViewLayout sizeForItemAtIndexPath:indexPath];
    label.frame = CGRectMake(0, 0, size.width, size.height);
   // label.text = [self.titles objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat itemWidth  = floorf(self.titleCollectionView.bounds.size.width / self.titles.count);
    CGFloat itemHeight = roundf(self.titleCollectionView.bounds.size.height);
    
    return CGSizeMake(itemWidth, itemHeight);
}

@end
