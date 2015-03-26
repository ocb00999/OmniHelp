//
//  Note.h
//  OmniHelp
//
//  Created by Chubin OU on 3/21/15.
//  Copyright (c) 2015 Chubin OU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface Note : NSObject

@property (strong, nonatomic) NSString *username;
@property (strong, nonatomic) NSString *content;
@property (strong, nonatomic) NSNumber *reward;
@property (strong, nonatomic) NSString *receivedHelpFrom;
@property (strong, nonatomic) PFGeoPoint *location;
@property (strong ,nonatomic) PFInstallation *object;

-(NSString *)getusername;
-(NSString *)getcontent;

@end
