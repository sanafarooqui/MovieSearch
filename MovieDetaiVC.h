//
//  MovieDetaiVC.h
//  MovieSearch
//
//  Created by Student on 11/22/14.
//  Copyright (c) 2014 RIT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movies.h"
#import "ObjCMongoDB.h"

@interface MovieDetaiVC : UITableViewController

@property(nonatomic, strong) Movies *movie;
@property(nonatomic,strong) UITextField *myTextField;

@end
