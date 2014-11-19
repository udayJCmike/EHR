//
//  FFCalendarViewController.h
//  FFCalendar
//
//  Created by Fernanda G. Geraissate on 12/02/14.
//  Copyright (c) 2014 Fernanda G. Geraissate. All rights reserved.
//
//  http://fernandasportfolio.tumblr.com
//

#import <UIKit/UIKit.h>
#import "SHStripeMenuExecuter.h"
#import "SHStripeMenuActionDelegate.h"
@protocol FFCalendarViewControllerProtocol <NSObject>
@required
- (void)arrayUpdatedWithAllEvents:(NSMutableArray *)arrayUpdated;
@end

@interface FFCalendarViewController : UIViewController<SHStripeMenuActionDelegate>

@property (nonatomic, strong) id <FFCalendarViewControllerProtocol> protocol;
@property (nonatomic, strong) NSMutableArray *arrayWithEvents;
@property (nonatomic, strong) SHStripeMenuExecuter  *executer;
@property(nonatomic,strong)IBOutlet UIView *Inner_View;
@end
