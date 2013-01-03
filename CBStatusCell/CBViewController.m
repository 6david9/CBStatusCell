//
//  CBViewController.m
//  CBStatusCell
//
//  Created by ly on 12/2/12.
//  Copyright (c) 2012 Lei Yan. All rights reserved.
//

#import "CBViewController.h"
#import "CBStatusCell.h"
#import "CBStatus.h"

@interface CBViewController ()

@property (strong)NSMutableOrderedSet *status;

- (void)setup;

- (CBStatusCell *)newCellForTableView:(UITableView *)tableView;
- (void)configureCell:(CBStatusCell *)cell atIndexPath:(NSIndexPath *)indexPath;

@end

@implementation CBViewController
@synthesize status = _status;

- (void)setup
{
    self.status = [[NSMutableOrderedSet alloc] init];
    
    
    CBStatus *status = [[CBStatus alloc] init];
    status.text = @"hellohellohellohellohellohellohellohellohello";
    status.image = [UIImage imageNamed:@"jobs.jpg"];
    status.imageURL = [NSURL URLWithString:@"http://ww1.sinaimg.cn/thumbnail/982a42b9gw1dzfpij9efjj.jpg"];
    status.repostText = @"repost";
    status.repostImage = [UIImage imageNamed:@"jobs.jpg"];
    status.repostImageURL = [NSURL URLWithString:@"http://ww1.sinaimg.cn/thumbnail/982a42b9gw1dzfpij9efjj.jpg"];
    status.avatarURL = [NSURL URLWithString:@"http://tp2.sinaimg.cn/2693551385/180/5629884601/1"];
    status.commentCount = [NSNumber numberWithInt:10];
    status.repostCount = [NSNumber numberWithInt:57009];
    [self.status addObject:status];
    
    CBStatus *status2 = [[CBStatus alloc] init];
    status2.text = @"hellohellohellohellohellohellohellohellohello";
    status2.image = [UIImage imageNamed:@"jobs.jpg"];
    status2.imageURL = [NSURL URLWithString:@"http://ww1.sinaimg.cn/thumbnail/982a42b9gw1dzfpij9efjj.jpg"];
    status2.avatarURL = [NSURL URLWithString:@"http://tp2.sinaimg.cn/2693551385/180/5629884601/1"];
    status2.commentCount = [NSNumber numberWithInt:10];
    status2.repostCount = [NSNumber numberWithInt:57];
    [self.status addObject:status2];
    
    CBStatus *status3 = [[CBStatus alloc] init];
    status3.text = @"hello";
    status3.repostText = @"repost";
    status3.repostImage = [UIImage imageNamed:@"jobs.jpg"];
    status3.repostImageURL = [NSURL URLWithString:@"http://ww1.sinaimg.cn/thumbnail/982a42b9gw1dzfpij9efjj.jpg"];
    status3.avatarURL = [NSURL URLWithString:@"http://tp2.sinaimg.cn/2693551385/180/5629884601/1"];
    status3.commentCount = [NSNumber numberWithInt:10];
    status3.repostCount = [NSNumber numberWithInt:57];
    [self.status addObject:status3];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self setup];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.status count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height;
    CBStatusCell *cell;
    
    cell = [self newCellForTableView:tableView];
    [self configureCell:cell atIndexPath:indexPath];
    height = [cell height];
    
    return height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CBStatusCell *cell = [self newCellForTableView:tableView];
    
    [self configureCell:cell atIndexPath:indexPath];
    
    return cell;
}

- (CBStatusCell *)newCellForTableView:(UITableView *)tableView
{
    static NSString *CellIdentifier = @"Cell";
    CBStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
        cell = [[CBStatusCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    
    return cell;
}

- (void)configureCell:(CBStatusCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = indexPath.row;
    CBStatus *status = [self.status objectAtIndex:row];
    
    cell.text = status.text;
//    cell.image = status.image;
    cell.imageURL = status.imageURL;
    cell.repostText = status.repostText;
//    cell.repostImage = status.repostImage;
    cell.repostImageURL = status.repostImageURL;
    cell.avatarURL = status.avatarURL;
    cell.commentCount = status.commentCount;
    cell.repostCount = status.repostCount;
}

@end
