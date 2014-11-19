//
//  ViewHistoryViewController.h
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 11/11/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewHistoryTableViewCell.h"
@interface ViewHistoryViewController : UIViewController
@property(nonatomic,retain)IBOutlet UITableView *history_tbview;
@property(nonatomic,retain)NSMutableArray *history_array;
@property(nonatomic,retain)NSMutableDictionary *history_content;
@end
