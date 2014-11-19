//
//  MessagesViewController.h
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 11/11/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageContentTableViewCell.h"
#import "UIButton+Bootstrap.h"
@interface MessagesViewController : UIViewController<UITextViewDelegate>
@property(nonatomic,retain)IBOutlet UITableView *message_tbview;
@property(nonatomic,retain)NSMutableArray *message_array;
@property(nonatomic,retain)NSMutableDictionary *message_content;
@property (strong, nonatomic) IBOutlet UIButton *send;
@property (strong, nonatomic) IBOutlet UITextView *msg;
@end
