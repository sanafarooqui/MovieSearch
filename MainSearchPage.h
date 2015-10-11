//
//  MainSearchPage.h
//  MovieSearch
//
//  Created by Student on 11/23/14.
//  Copyright (c) 2014 RIT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ObjCMongoDB.h"

@interface MainSearchPage : UIViewController<UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate>
@property (strong, nonatomic) NSArray *movieArray;
@property (strong, nonatomic) NSArray *categoriesArray;
@property (strong, nonatomic) NSString *category;


-(NSArray *) retriveMovies:(NSString*)category searchQuery:(NSString*)searchText;
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;



@end
