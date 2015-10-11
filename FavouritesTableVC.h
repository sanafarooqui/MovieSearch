//
//  FavouritesTableVC.h
//  MovieSearch
//
//  Created by Student on 12/1/14.
//  Copyright (c) 2014 RIT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movies.h"

@interface FavouritesTableVC : UITableViewController
//@property (strong, nonatomic) NSMutableArray *movies;
@property (strong, nonatomic) NSUserDefaults *favMovies;
@property (strong, nonatomic) NSMutableArray *movietTitleArray;
@property (strong, nonatomic) NSMutableArray *movieArr;
@property (strong, nonatomic) NSMutableArray *moviesObjectArray;

-(void) addMovieToFavorite:(Movies *)movie;
-(void) removeMovieFromFavorite:(Movies *)movie;
-(BOOL) checkForMovie:(Movies *)movie;

@end
