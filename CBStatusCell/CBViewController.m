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
    status.statusID = @"123235374562";
    status.name = @"Apple";
    status.text = @"苹果公司，原称苹果电脑（股份有限）公司（Apple Computer, Inc.），于2007年1月9日在旧金山Macworld Expo上宣布改为现名。";
    status.repostText = @"在创立电脑前，创始人之一沃兹已经是一个电子学骇客，自1975年，他在惠普上班和帮斯蒂夫·乔布斯设计Atari电子游戏。";
    status.repostImageURL = [NSURL URLWithString:@"http://upload.wikimedia.org/wikipedia/commons/f/f6/Steve_Wozniak.jpg"];
    status.avatarURL = [NSURL URLWithString:@"http://upload.wikimedia.org/wikipedia/zh/a/ab/Apple-logo.png"];
    status.commentCount = [NSNumber numberWithInt:10];
    status.repostCount = [NSNumber numberWithInt:57009];
    status.fromText = @"sWiBoo";
    [self.status addObject:status];
    
    CBStatus *status2 = [[CBStatus alloc] init];
    status2.statusID = @"12323537452";
    status2.name = @"Apple";
    status2.text = @"苹果公司，原称苹果电脑（股份有限）公司（Apple Computer, Inc.），于2007年1月9日在旧金山Macworld Expo上宣布改为现名。";
    status2.imageURL = [NSURL URLWithString:@"http://upload.wikimedia.org/wikipedia/commons/d/d8/Macintosh_classic.jpg"];
    status2.avatarURL = [NSURL URLWithString:@"http://upload.wikimedia.org/wikipedia/zh/a/ab/Apple-logo.png"];
    status2.commentCount = [NSNumber numberWithInt:10];
    status2.repostCount = [NSNumber numberWithInt:57];
    status2.fromText = @"sWiBoo";
    [self.status addObject:status2];
    
    CBStatus *status3 = [[CBStatus alloc] init];
    status3.statusID = @"56235374562";
    status3.name = @"Apple";
    status3.text = @"史蒂夫·乔布斯";
    status3.repostText = @"史蒂芬·保罗·乔布斯（英语：Steven Paul Jobs，1955年2月24日－2011年10月5日），通称史蒂夫·乔布斯（英语：Steve Jobs），苹果公司的创始人之一，曾任董事长及首席执行官职位，也是皮克斯动画的创办人并曾任首席执行官。";
    status3.repostImageURL = [NSURL URLWithString:@"http://upload.wikimedia.org/wikipedia/commons/b/b9/Steve_Jobs_Headshot_2010-CROP.jpg"];
    status3.avatarURL = [NSURL URLWithString:@"http://upload.wikimedia.org/wikipedia/zh/a/ab/Apple-logo.png"];
    status3.commentCount = [NSNumber numberWithInt:10];
    status3.repostCount = [NSNumber numberWithInt:57];
    status3.fromText = @"sWiBoo";
    [self.status addObject:status3];
    
    CBStatus *status4 = [[CBStatus alloc] init];
    status4.statusID = @"74562";
    status4.name = @"Apple";
    status4.text = @"苹果公司，原称苹果电脑（股份有限）公司（Apple Computer, Inc.），于2007年1月9日在旧金山Macworld Expo上宣布改为现名。";
    status4.avatarURL = [NSURL URLWithString:@"http://upload.wikimedia.org/wikipedia/zh/a/ab/Apple-logo.png"];
    status4.commentCount = [NSNumber numberWithInt:10];
    status4.repostCount = [NSNumber numberWithInt:57];
    status4.fromText = @"sWiBoo";
    [self.status addObject:status4];
    
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
    NSUInteger row = indexPath.row;
    CBStatus *status = [self.status objectAtIndex:row];
    
    cell.statusID = status.statusID;
    cell.name = status.name;
    cell.avatarURL = status.avatarURL;
    cell.postDate = [NSDate dateWithTimeIntervalSinceNow:3601];
    [cell setText:status.text andImageWithURL:status.imageURL];
    [cell setRepostText:status.repostText andRepostImageWithURL:status.repostImageURL];
    cell.textFrom = status.fromText;
    [cell setCommentCount:status.commentCount andRepostCount:status.repostCount];
    cell.containerViewController = self;
}

@end
