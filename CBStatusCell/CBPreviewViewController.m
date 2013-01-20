//
//  CBPreviewViewController.m
//  CBStatusCell
//
//  Created by ly on 1/8/13.
//  Copyright (c) 2013 Lei Yan. All rights reserved.
//

#import "CBPreviewViewController.h"
#import "UIImageView+WebCache.h"
#import <QuartzCore/QuartzCore.h>

@interface CBPreviewViewController ()

@end

@implementation CBPreviewViewController

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
    // Do any additional setup after loading the view from its nib.
    
//    self.imageView.image = self.image;
    [self.imageView setImageWithURL:self.imageURL];
    
    CGSize contextSize = [[UIScreen mainScreen] applicationFrame].size;
    
    UIGraphicsBeginImageContext(contextSize);
    CGContextRef c = UIGraphicsGetCurrentContext();
    
    [self.containerController.view.layer renderInContext:c];
    
    UIImage *bkgImage = UIGraphicsGetImageFromCurrentImageContext();
    self.backgroudImageView.image = bkgImage;
    
    UIGraphicsEndImageContext();
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self dismissModalViewControllerAnimated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setImageView:nil];
    [self setBackgroudImageView:nil];
    [super viewDidUnload];
}
@end
