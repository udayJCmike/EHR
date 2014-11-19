//
//  ViewMedicalRecordDetailViewController.m
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 13/11/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//

#import "ViewMedicalRecordDetailViewController.h"

@interface ViewMedicalRecordDetailViewController ()

@end

@implementation ViewMedicalRecordDetailViewController
@synthesize treatment;
@synthesize result;
@synthesize dateoftest;
@synthesize cost;
@synthesize comments;
@synthesize detailData;
@synthesize scrollView;
@synthesize pagecontrol;
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
    
    treatment.text=[detailData valueForKey:@"treatment"];
//   result.text =[detailData valueForKey:@"result"];
    dateoftest.text=[detailData valueForKey:@"dateoftest"];
    cost.text =[detailData valueForKey:@"cost"];
    [self.DownloadStatus warningStyle];
    //comments.text=[data_for_cell valueForKey:@"comments"];
    // Do any additional setup after loading the view.
    self.grey_view.layer.cornerRadius=10;
    self.grey_view.layer.masksToBounds=YES;
    
  	scrollView.delegate = self;
    _pageImages = @[@"x-ray1.jpg", @"x-ray2.jpg",@"x-ray1.jpg", @"x-ray2.jpg"];
    pagecontrol.numberOfPages=[_pageImages count];
    for (int i = 0; i < [_pageImages count]; i++) {
        //We'll create an imageView object in every 'page' of our scrollView.
        CGRect frame;
        frame.origin.x = self.scrollView.frame.size.width * i;
        
        frame.size = self.scrollView.frame.size;
        
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
        imageView.image = [UIImage imageNamed:[_pageImages objectAtIndex:i]];
        
        [scrollView  setContentSize:imageView.frame.size];
        
        
        [self.scrollView addSubview:imageView];
    }
    //Set the content size of our scrollview according to the total width of our imageView objects.
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * [_pageImages count], 193);
}

- (void)scrollViewDidScroll:(UIScrollView *)_scrollView{
    
    
    // Update the page when more than 50% of the previous/next page is visible
    CGFloat pageWidth = self.scrollView.frame.size.width;
    int page = floor((self.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    self.pagecontrol.currentPage = page;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pageChanged:(id)sender {
    
    int page = (int)self.pagecontrol.currentPage;
    CGRect frame = self.scrollView.frame;
    frame.origin.x = frame.size.width * page;
    
    [self.scrollView scrollRectToVisible:frame animated:YES];
}
@end
