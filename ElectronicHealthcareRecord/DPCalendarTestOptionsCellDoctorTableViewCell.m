//
//  DPCalendarTestOptionsCellDoctorTableViewCell.m
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 11/20/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//

#import "DPCalendarTestOptionsCellDoctorTableViewCell.h"
enum CellType{
    CellTypeTextField,
    CellTypeSwitch,
    CellTypeSlider,
    CellTypeDate,
    CellTypeTextView
};



@implementation DPCalendarTestOptionsCellDoctorTableViewCell


@synthesize datePicker;
@synthesize isReschedule;
#define MARGIN_X 10

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        //  isReschedule=FALSE;
        self.nameLabel = [UILabel new];
        self.nameTextField = [UITextField new];
         self.nameTextField.delegate=self;
        [self.nameTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        self.valueTextField = [UITextView new];
        self.valueTextField.delegate=self;
        self.dateLabel = [UILabel new];
        self.datePicker=[UIDatePicker new];
        [self.valueTextField setFont:[UIFont fontWithName:@"Helvetica Neue" size:15]];
        tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dateLabelTapped:)];
        [tap setNumberOfTapsRequired:1];
        self.dateLabel.userInteractionEnabled = YES;
        [self.dateLabel addGestureRecognizer:tap];
        self.timePicker=[UIPickerView new];
        [self.valueTextField.layer setBorderColor:[[[UIColor grayColor] colorWithAlphaComponent:0.5] CGColor]];
        [self.valueTextField.layer setBorderWidth:1.0];
        //The rounded corner part, where you specify your view's corner radius:
        self.valueTextField.layer.cornerRadius = 5;
        self.valueTextField.clipsToBounds = YES;
        
        [self.nameTextField.layer setBorderColor:[[[UIColor grayColor] colorWithAlphaComponent:0.5] CGColor]];
        [self.nameTextField.layer setBorderWidth:1.0];
        //The rounded corner part, where you specify your view's corner radius:
        self.nameTextField.layer.cornerRadius = 5;
        self.nameTextField.clipsToBounds = YES;
        
        self.timeArray=[NSMutableArray new];
        self.timeArray=[[NSMutableArray alloc]initWithObjects:@"00:00",@"00:15",@"00:30",@"00:45",@"01:00",@"01:15",@"01:30",@"01:45",@"02:00",@"02:15",@"02:30",@"02:45",@"03:00",@"03:15",@"03:30",@"03:45",@"04:00",@"04:15",@"04:30",@"04:45",@"05:00",@"05:15",@"05:30",@"05:45",@"06:00",@"06:15",@"06:30",@"06:45",@"07:00",@"07:15",@"07:30",@"07:45",@"08:00",@"08:15",@"08:30",@"08:45",@"09:00",@"09:15",@"09:30",@"09:45",@"10:00",@"10:15",@"10:30",@"10:45",@"11:00",@"11:15",@"11:30",@"11:45",@"12:00",@"12:15",@"12:30",@"12:45",@"13:00",@"13:15",@"13:30",@"13:45",@"14:00",@"14:15",@"14:30",@"14:45",@"15:00",@"15:15",@"15:30",@"15:45",@"16:00",@"16:15",@"16:30",@"16:45",@"17:00",@"17:15",@"17:30",@"17:45",@"18:00",@"18:15",@"18:30",@"18:45",@"19:00",@"19:15",@"19:30",@"19:45",@"20:00",@"20:15",@"20:30",@"20:45",@"21:00",@"21:15",@"21:30",@"21:45",@"22:00",@"22:15",@"22:30",@"22:45",@"23:00",@"23:15",@"23:30",@"23:45",@"24:00",nil];
        [self.timePicker setDataSource:self];
        [self.timePicker setDelegate:self];
        self.timePicker.showsSelectionIndicator = YES;
       
           [self addSubview:self.nameTextField];
        [self addSubview:self.nameLabel];
        [self addSubview:self.valueTextField];
        [self addSubview:self.dateLabel];
    }
    return self;
}
-(void) textFieldDidChange:(UITextField *)textField {
  
    [self.delegate cell:self valueChanged:textField.text];
}
//Columns in picker views

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView; {
    return 1;
}
//Rows in each Column

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component; {
    return [self.timeArray count];
}


// these methods return either a plain NSString, a NSAttributedString, or a view (e.g UILabel) to display the row for the component.
-(NSString*) pickerView:(UIPickerView*)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    return [self.timeArray objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component;
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    //   NSLog(@"starttime %@",self.event.startTime);
    
    NSString *date=  [NSString stringWithFormat:@"%@ %@:00 +0000",[formatter stringFromDate:self.event.startTime],[self.timeArray objectAtIndex:row]];
    NSDateFormatter *formatter1 = [[NSDateFormatter alloc] init];
    [formatter1 setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
    NSDate *cdate=  [formatter1 dateFromString:date];
    //     NSLog(@"converted date from time by formatter %@ \n by code %@ \n",cdate,[cdate dateByAddingYears:0 months:0 days:0]);
    self.dateLabel.text=[self.timeArray objectAtIndex:row];
    [self.delegate cell:self valueChanged:[cdate dateByAddingYears:0 months:0 days:0]];
}

- (void) hideViews {
    self.valueTextField.hidden = YES;
    self.dateLabel.hidden = YES;
    self.nameTextField.hidden=YES;
}

- (void) dateLabelTapped: (UITapGestureRecognizer *)tapGesture {
    if([self.identifier isEqualToString:@"CELL_START_TIME"])
    {
        if (isReschedule==TRUE)
        {
            
            
            [self.datePopover presentPopoverFromRect:self.dateLabel.frame inView:self
                            permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];//tempButton.frame where you need you can put that frame
        }
        else
        {
            
            NSLog(@"Pop over will not show.Bcz its create appointment screen");
        }
    }
    else
    {
        [self.datePopover presentPopoverFromRect:self.dateLabel.frame inView:self
                        permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    }
    
}

-(UIPopoverController *)datePopover
{
    if(!_datePopover){
        
        UIViewController* popoverContent = [[UIViewController alloc] init]; //ViewController
        
        UIView *popoverView = [[UIView alloc] init];   //view
        
        //Date picker
        
        datePicker.frame=CGRectMake(0,44,280, 216);
        self.timePicker.frame=CGRectMake(0,44,280, 216);
        datePicker.datePickerMode = UIDatePickerModeTime;
        if([self.identifier isEqualToString:@"CELL_START_TIME"])
        {
            self.datePicker.datePickerMode = UIDatePickerModeDate;
            NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"US"];
            [self.datePicker setLocale:locale];
            [datePicker setMinuteInterval:15];
            [datePicker setTag:10];
            [datePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged];
            [popoverView addSubview:datePicker];
            
        }
        
        else
        {
            [popoverView addSubview:self.timePicker];
        }
        
        
        
        
        popoverContent.view = popoverView;
        
        
        _datePopover = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
        _datePopover.popoverContentSize = CGSizeMake(280.f, 250.f);
    }
    
    return _datePopover;
}

- (void) dateChanged:(UIDatePicker *)picker{
    self.date = picker.date;
    //    NSLog(@"date picked %@",picker.date);
     self.event.startTime=[picker.date dateByAddingYears:0 months:0 days:0];
    [self.delegate cell:self valueChanged:[picker.date dateByAddingYears:0 months:0 days:0]];
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    [self.delegate cell:self valueChanged:textView.text];
    return YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


- (NSString *) strFromDate:(NSDate *)date {
    if (!date) {
        return nil;
    }
    static NSDateFormatter *dateFormatter;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc]init];
        [dateFormatter setDateFormat:@"HH:mm"];
    }
    if([self.identifier isEqualToString:@"CELL_START_TIME"])
    {
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    }
    else  if([self.identifier isEqualToString:@"CELL_END_TIME"])
    {
        [dateFormatter setDateFormat:@"HH:mm"];
    }
    
    return [dateFormatter stringFromDate:date];
}

- (void) setTitle:(NSString *)title {
    self.nameLabel.text = title;
}

- (void) setTextValue:(NSString *)text {
    [self hideViews];
    self.valueTextField.hidden = NO;
    self.valueTextField.text = text;
    self.cellType = CellTypeTextView;
}
- (void) setTextFieldValue:(NSString *)text {
    [self hideViews];
    self.nameTextField.hidden = NO;
    self.nameTextField.text = text;
    self.cellType = CellTypeTextField;
}
- (void) setDate:(NSDate *)date
{
    if([self.identifier isEqualToString:@"CELL_START_TIME"])
    {
        self.datePicker.datePickerMode = UIDatePickerModeDate;
        self.datePicker.date=[date dateByAddingYears:0 months:0 days:0];
        self.dateLabel.text = [self strFromDate:date];
    }
    else
    {
        if (isReschedule)
        {
            NSString *stringDate = [NSString stringWithFormat:@"%@",date];
            //            NSLog(@"Reschedule gng to handle date %@",stringDate);
            NSArray *mycomp = [stringDate componentsSeparatedByCharactersInSet:
                               [NSCharacterSet characterSetWithCharactersInString:@" "]
                               ];
            mycomp = [[mycomp objectAtIndex:1] componentsSeparatedByCharactersInSet:
                      [NSCharacterSet characterSetWithCharactersInString:@":"]
                      ];
            //             NSLog(@"Array values %@",mycomp);
            self.dateLabel.text =  [NSString stringWithFormat:@"%@:%@",[mycomp objectAtIndex:0],[mycomp objectAtIndex:1]];
        }
        else
            self.dateLabel.text =@"00:00";
        
        
        
    }
    [self hideViews];
    self.dateLabel.hidden = NO;
    _date = date;
    
    
    self.cellType = CellTypeDate;
}

-(void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    CGFloat width = (rect.size.width - 3 * MARGIN_X) / 2;
    CGFloat height = rect.size.height;
    
    self.nameLabel.textAlignment = NSTextAlignmentLeft;
    
    self.nameLabel.frame = CGRectMake(MARGIN_X, 0, width, height);
    CGRect valueFrame = CGRectMake(CGRectGetMaxX(self.nameLabel.frame) + MARGIN_X, 0, width, height);
      self.valueTextField.frame = valueFrame;
    if([self.identifier isEqualToString:@"CELL_TITLE"])
    {
        CGRect val=valueFrame;
        val.size.width-=10;
        val.size.height-=10;
        val.origin.y+=5;
        self.valueTextField.frame=val;
    }
    if([self.identifier isEqualToString:@"CELL_NAME"])
    {
        CGRect val=valueFrame;
        val.size.width-=10;
        val.size.height-=10;
        val.origin.y+=5;
        self.nameTextField.frame=val;
    }
   
//        CGRect val=valueFrame;
//        val.size.width-=30;
//        val.size.height-=30;
    
    
    
    
   
    
    self.dateLabel.frame = valueFrame;
}



@end
