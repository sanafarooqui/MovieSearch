//
//  Movies.m
//  MovieSearch
//
//  Created by Student on 11/24/14.
//  Copyright (c) 2014 RIT. All rights reserved.
//

#import "Movies.h"

@implementation Movies

-(id)init{
    self = [super init];
    if(self){
        //initilization code goes here
    }
    return [self initWithTitle:@"unknown" mYear:@"unknown" mReleased:@"unknown" mRuntime:@"unknown" mGenre:@"unknown" mDirector:@"unknown" mWriters:@"unknown" mActors:@"unknown" mLanguage:@"unknown" mPosters:@"unknown" mCounrty:@"unknown" mType:@"unknown" mComment:@"unknown" mURL:@"unknown"];
}

-(id) initWithTitle:(NSString *)m_title mYear:(NSString *)m_year mReleased:(NSString *)m_released mRuntime:(NSString *)m_runtime mGenre:(NSString *)m_genre mDirector:(NSString *)m_director mWriters:(NSString *)m_writer mActors:(NSString *)m_actors mLanguage:(NSString *)m_language mPosters:(NSString *)m_posters mCounrty:(NSString *)m_country mType:(NSString *)m_type mComment:(NSString *)m_comment mURL:(NSString *)m_URL{
    self = [super init];
    if(self!=nil){
        //initilization code goes here
        [self setMovieTitle:m_title];
        [self setMovieYear:m_year];
        [self setMovieReleased:m_released];
        [self setMovieRuntime:m_runtime];
        [self setMovieGenre:m_genre];
        [self setMovieDirector:m_director];
        [self setMovieWriter:m_writer];
        [self setMovieActors:m_actors];
        [self setMovieLanguage:m_language];
        [self setMoviePosters:m_posters];
        [self setMovieCountry:m_country];
        [self setMovieType:m_type];
        [self setMovieComment:m_comment];
        [self setMovieURL:m_URL];

    }
    return self;
    
}

-(id) initWithDictionary:(NSDictionary *)m_dict{
    self.movieTitle = [m_dict objectForKey:@"Title"];
    self.movieYear = [m_dict objectForKey:@"Year"];
    self.movieReleased = [m_dict objectForKey:@"Released"];
    self.movieRuntime = [m_dict objectForKey:@"Runtime"];
    self.movieGenre = [m_dict objectForKey:@"Genre"];
    self.movieDirector = [m_dict objectForKey:@"Director"];
    self.movieWriter = [m_dict objectForKey:@"Writer"];
    self.movieActors = [m_dict objectForKey:@"Actors"];
    self.movieLanguage = [m_dict objectForKey:@"Language"];
    self.movieCountry = [m_dict objectForKey:@"Country"];
    self.moviePosters = [m_dict objectForKey:@"Poster"];
    self.movieType = [m_dict objectForKey:@"Type"];
    self.movieComment = [m_dict objectForKey:@"Comment"];
     self.movieURL = [m_dict objectForKey:@"URL"];
    
    return self;
}


+(id)movies{
    Movies *movie = [[self alloc] initWithTitle:@"Titanic" mYear:@"unknown" mReleased:@"unknown" mRuntime:@"unknown" mGenre:@"unknown" mDirector:@"unknown" mWriters:@"unknown" mActors:@"unknown" mLanguage:@"unknown" mPosters:@"unknown" mCounrty:@"unknown" mType:@"unknown"  mComment:@"unknown" mURL:@"unknown"];
    return movie;
}

- (NSString*)description{
	return [NSString stringWithFormat:@"Title=%@, \nYear=%@, \nReleased=%@, \nRuntime=%@, \nGenre=%@, \nDirector=%@, \nWriters=%@, \nActors=%@, \nLanguage=%@, \nPosters=%@, \nCountry=%@, \nType=%@, \nComment=%@,\nURL=%@ \n",self.movieTitle,self.movieYear,self.movieReleased,self.movieRuntime,self.movieGenre,self.movieDirector,self.movieWriter,self.movieActors,self.movieLanguage,self.moviePosters,self.movieCountry,self.movieType,self.movieComment,self.movieURL];
}

@end
