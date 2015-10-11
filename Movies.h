//
//  Movies.h
//  MovieSearch
//
//  Created by Student on 11/24/14.
//  Copyright (c) 2014 RIT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movies : NSObject

@property (strong, nonatomic) NSString *movieTitle;
@property (strong, nonatomic) NSString *movieYear;
@property (strong, nonatomic) NSString *movieReleased;
@property (strong, nonatomic) NSString *movieRuntime;
@property (strong, nonatomic) NSString *movieGenre;
@property (strong, nonatomic) NSString *movieDirector;
@property (strong, nonatomic) NSString *movieWriter;
@property (strong, nonatomic) NSString *movieActors;
@property (strong, nonatomic) NSString *movieLanguage;
@property (strong, nonatomic) NSString *moviePosters;
@property (strong, nonatomic) NSString *movieCountry;
@property (strong, nonatomic) NSString *movieType;
@property (strong, nonatomic) NSString *movieComment;
@property (strong, nonatomic) NSString *movieURL;

-(id) initWithTitle:(NSString *)m_title
              mYear:(NSString *)m_year
          mReleased:(NSString *)m_released
           mRuntime:(NSString *)m_runtime
             mGenre:(NSString *)m_genre
          mDirector:(NSString *)m_director
           mWriters:(NSString *)m_writer
            mActors:(NSString *)m_actors
          mLanguage:(NSString *)m_language
           mPosters:(NSString *)m_posters
           mCounrty:(NSString *)m_country
              mType:(NSString *)m_type
           mComment:(NSString *)m_comment
              mURL:(NSString *)m_URL;

-(id) initWithDictionary:(NSDictionary *)m_dict;


+(id)movies;

@end
