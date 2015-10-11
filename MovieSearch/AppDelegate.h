//
//  AppDelegate.h
//  MovieSearch
//
//  Created by Student on 11/22/14.
//  Copyright (c) 2014 RIT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic) UITabBarController *tabBarController;
@property (strong, nonatomic) NSMutableArray *movies;
@property (strong, nonatomic) UIWindow *window;

@end
