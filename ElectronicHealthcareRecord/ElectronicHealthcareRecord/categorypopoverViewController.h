//
//  categorypopoverViewController.h
//  LMSMOOC
//
//  Created by DeemsysInc on 17/09/14.
//  Copyright (c) 2014 deemsys. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIButton+Bootstrap.h"

@interface categorypopoverViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
   
}
@property (retain, nonatomic) IBOutlet UITableView *category_tableView;
@property(retain,nonatomic)NSMutableArray *categorylist;
@end
