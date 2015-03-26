//
//  CustomTableViewCell.h
//  OmniHelp
//
//  Created by Chubin OU on 3/23/15.
//  Copyright (c) 2015 Chubin OU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWTableViewCell.h"

@interface CustomTableViewCell : SWTableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *patternImageView;
@property (weak, nonatomic) IBOutlet UILabel *patternLabel;

@end
