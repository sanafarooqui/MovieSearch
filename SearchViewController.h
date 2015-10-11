//
//  SearchViewController.h
//  MovieSearch
//
//  Created by Student on 11/22/14.
//  Copyright (c) 2014 RIT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ObjCMongoDB.h"

@interface SearchViewController : UIViewController
@property (strong, nonatomic) NSArray *movieArray;
@property (strong, nonatomic) NSString *category;
@property (strong, nonatomic) NSString *searchQuery;
//BOOL *isSearching;

//-(void) retriveMovies:(NSString*)category searchQuery:(NSString*)searchText;

@end
