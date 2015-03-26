//
//  TableViewController.h
//  OmniHelp
//
//  Created by Chubin OU on 3/23/15.
//  Copyright (c) 2015 Chubin OU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWTableViewCell.h"

@interface TableViewController : UIViewController <SWTableViewCellDelegate, UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;


@end
