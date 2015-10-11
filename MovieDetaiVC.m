//
//  MovieDetaiVC.m
//  MovieSearch
//
//  Created by Student on 11/22/14.
//  Copyright (c) 2014 RIT. All rights reserved.
//

#import "MovieDetaiVC.h"
#import "AppDelegate.h"
#import "FavouritesTableVC.h"
#import "SearchViewController.h"

#define MOVIE_TITLE_SECTION 0
#define MOVIE_POSTERS_SECTION 1
#define MOVIE_YEAR_SECTION 2
#define MOVIE_RELEASED_SECTION 3
#define MOVIE_RUNTIME_SECTION 4
#define MOVIE_GENRE_SECTION 5
#define MOVIE_DIRECTOR_SECTION 6
#define MOVIE_WRITER_SECTION 7
#define MOVIE_ACTORS_SECTION 8
#define MOVIE_LANGUAGE_SECTION 9
#define MOVIE_COUNTRY_SECTION 10
#define MOVIE_TYPE_SECTION 11
#define MOVIE_COMMENT_SECTION 12
#define MOVIE_URL_SECTION 13
#define MOVIE_FAV_SECTION 14


@interface MovieDetaiVC ()
@property NSInteger indexNumber;
@end

@implementation MovieDetaiVC

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
   
        return 15;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 1;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString *title;
    switch(section){
        case MOVIE_TITLE_SECTION:
            title = @"Movie Name";
            break;
        case MOVIE_YEAR_SECTION:
            title = @"Year of Released";
            break;
        case MOVIE_RELEASED_SECTION:
            title = @"Released Date";
            break;
        case MOVIE_RUNTIME_SECTION:
            title = @"Duration";
            break;
        case MOVIE_GENRE_SECTION:
            title = @"Genre";
            break;
        case MOVIE_DIRECTOR_SECTION:
            title = @"Directors";
            break;
        case MOVIE_WRITER_SECTION:
            title = @"Writers";
            break;
        case MOVIE_ACTORS_SECTION:
            title = @"Actors";
            break;
        case MOVIE_LANGUAGE_SECTION:
            title = @"language of Movie";
            break;
        case MOVIE_COUNTRY_SECTION:
            title = @"Country";
            break;
        case MOVIE_POSTERS_SECTION:
            title = @"Poster";
            break;
        case MOVIE_TYPE_SECTION:
            title = @"Type if Any";
            break;
       case MOVIE_COMMENT_SECTION:
            title = @"Comment";
            break;
            
        default:
            //NSLog(@"Should not be here");
            break;
    }
    return title;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section ==MOVIE_POSTERS_SECTION && ![self.movie.moviePosters isEqualToString:@"N/A"] ){
        
        NSURL * imageURL = [NSURL URLWithString:[self.movie.moviePosters stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
        UIImage *image = [UIImage imageWithData:imageData];
        return image.size.height+50.0;
    }
    else{
        return 30.0;
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return 30.0;
    }
    else{
        return 15.0;
    }
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier"];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellIdentifier"];
    }
    FavouritesTableVC *detailVC = [[FavouritesTableVC alloc]initWithStyle:UITableViewStylePlain];
    // Configure the cell...
    switch (indexPath.section) {
        case MOVIE_TITLE_SECTION:
        {
            cell.textLabel.text = self.movie.movieTitle;
            break;
        }
        case MOVIE_YEAR_SECTION:
        {
            cell.textLabel.text = self.movie.movieYear;
            break;
        }
        case MOVIE_RELEASED_SECTION:
        {
            cell.textLabel.text = self.movie.movieReleased;
            break;
        }
        case MOVIE_RUNTIME_SECTION:
        {
            cell.textLabel.text = self.movie.movieRuntime;
            break;
        }
        case MOVIE_GENRE_SECTION:
        {
            cell.textLabel.text = self.movie.movieGenre;
            break;
        }
        case MOVIE_DIRECTOR_SECTION:
        {
            cell.textLabel.text = self.movie.movieDirector;
            break;
        }
        case MOVIE_WRITER_SECTION:
        {
            cell.textLabel.text = self.movie.movieWriter;
            break;
        }
        case MOVIE_ACTORS_SECTION:
        {
            cell.textLabel.text = self.movie.movieActors;
            break;
        }
        case MOVIE_LANGUAGE_SECTION:
        {
            cell.textLabel.text = self.movie.movieLanguage;
            break;
        }
        case MOVIE_COUNTRY_SECTION:
        {
            cell.textLabel.text = self.movie.movieCountry;
            break;
        }
        case MOVIE_POSTERS_SECTION:
        {
            NSURL * imageURL = [NSURL URLWithString:[self.movie.moviePosters stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
            NSData * imageData = [NSData dataWithContentsOfURL:imageURL];
            UIImage * image = [UIImage imageWithData:imageData];
            UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,image.size.height)];
            imgView.image = image;
            cell.imageView.image = imgView.image;

            //cell.textLabel.text = self.movie.moviePosters;
            break;
        }
        case MOVIE_TYPE_SECTION:
        {
            cell.textLabel.text = self.movie.movieType;
            break;
        }
        case MOVIE_URL_SECTION:
        {
            cell.textLabel.text = @"View more details";
            break;
        }
        case MOVIE_COMMENT_SECTION:
        {
            if (self.movie.movieComment == nil) {
                  cell.textLabel.text = @"Add a comment";
                
            }else{
                cell.textLabel.text = self.movie.movieComment;
            }
            
            break;
        }
        case MOVIE_FAV_SECTION:
        {
            if (![detailVC checkForMovie:self.movie]) {
                cell.textLabel.text = @"Add to favourites";
            }else{
                cell.textLabel.text = @"Remove from favourites";
            }
            break;
        }
      /*  case MOVIE_GENRE_SECTION:
        {
            
            NSURL* aURL = [NSURL URLWithString:self.park.imageLink];
            NSData* data = [[NSData alloc] initWithContentsOfURL:aURL];
            UIImage *image = [[UIImage alloc] initWithData:data];
            
            cell.imageView.image = image;
            
            break;
        } 
       case MOVIE_GENRE_SECTION:

        {
            
            cell.textLabel.text = self.movieGenre;
            UIFont *myFont = [ UIFont fontWithName: @"Arial" size: 10.0 ];
            cell.textLabel.font  = myFont;
            
            break;
        }*/
        default:
            //NSLog(@"Should not be here");
            break;
    }
    cell.textLabel.numberOfLines = 0;
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *msg;
    self.indexNumber = indexPath.row;
    switch (indexPath.section) {
        case MOVIE_URL_SECTION:
        {
            
            NSString *url2 = [NSString stringWithFormat:@"%@",self.movie.movieURL];
            
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url2]];
            
            break;
        }
        case MOVIE_COMMENT_SECTION:
        {
            
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Comment"
                                                            message:@""
                                                           delegate:self
                                                  cancelButtonTitle:@"Cancel"
                                                  otherButtonTitles:@"Ok",nil];
            
          // self.myTextField = [[UITextField alloc] initWithFrame:CGRectMake(25.0, 45.0, 26.0, 25.0)];
          // [self.myTextField setBackgroundColor:[UIColor whiteColor]];
         //  self.myTextField.text = self.movie.movieComment;
        //   [alert addSubview:self.myTextField];
         //   [alert show];
           // [alert release];
            
            alert.alertViewStyle = UIAlertViewStylePlainTextInput;
            [alert textFieldAtIndex:0].text = self.movie.movieComment;
            
            
            [alert show];
            
            break;
        }
        case MOVIE_DIRECTOR_SECTION:
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Director"
                                                            message:self.movie.movieDirector
                                                           delegate:self
                                                  cancelButtonTitle:@"Cancel"
                                                  otherButtonTitles:nil];
            //alert.alertViewStyle = UIAlertViewStylePlainTextInput;
            [alert show];
            
            break;
        }
        case MOVIE_WRITER_SECTION:
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Writer"
                                                            message:self.movie.movieWriter
                                                           delegate:self
                                                  cancelButtonTitle:@"Cancel"
                                                  otherButtonTitles:nil];
            //alert.alertViewStyle = UIAlertViewStylePlainTextInput;
            [alert show];
            
            break;
        }
        case MOVIE_ACTORS_SECTION:
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Actor"
                                                            message:self.movie.movieActors
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            //alert.alertViewStyle = UIAlertViewStylePlainTextInput;
            [alert show];
            
            break;
        }
         case MOVIE_FAV_SECTION:
        {
           // AppDelegate *myAppDelegate = [[UIApplication sharedApplication] delegate];
          //  [[[[myAppDelegate tabBarController] viewControllers] objectAtIndex:1] addMovieToFavorite:self.movie];
            FavouritesTableVC *detailVC = [[FavouritesTableVC alloc]initWithStyle:UITableViewStylePlain];
            if (![detailVC checkForMovie:self.movie]) {
                [detailVC addMovieToFavorite:self.movie];
                msg = [NSString stringWithFormat:@"%@ added to favorites!",self.movie.movieTitle];
            }else{
                [detailVC removeMovieFromFavorite:self.movie];
                msg = [NSString stringWithFormat:@"%@ removed from favorites!",self.movie.movieTitle];
            }
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Favourites" message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            break;
        }
        default:
            //NSLog(@"Should not be here");
            break;
    }
    
  
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}



- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        NSString *comment = [alertView textFieldAtIndex:0].text;
        
        NSLog(@"Coomment entered : %@",comment);
        
        //update the table with the comment
        NSError* __autoreleasing *err = nil;
        
        MongoConnection *dbconn = [MongoConnection connectionForServer:@"127.0.0.1" error:err];
        
        MongoDBCollection *collection = [dbconn collectionWithName:@"social.movies"];
        
        MongoKeyedPredicate *predicate = [MongoKeyedPredicate predicate];
        [predicate keyPath:@"Title" matches:self.movie.movieTitle];
        [predicate keyPath:@"Genre" matches:self.movie.movieGenre];
        
        
        
        MongoUpdateRequest *updateRequest = [MongoUpdateRequest updateRequestWithPredicate:predicate firstMatchOnly:NO];
        [updateRequest keyPath:@"Comment" setValue:comment];
        [collection updateWithRequest:updateRequest error:err];
        
        BSONDocument *resultDoc = [collection findOneWithPredicate:predicate error:err];
        NSDictionary *result = [BSONDecoder decodeDictionaryWithDocument:resultDoc];
        NSLog(@"fetch result after update: %@", result);
        Movies *movies = [[Movies alloc] initWithDictionary:result];
        
        
       // SearchViewController *mainSearchPage = [[SearchViewController alloc]init];
     //   NSMutableArray *array = [[NSMutableArray alloc]initWithArray:mainSearchPage.movieArray];
        
       // [array replaceObjectAtIndex:self.indexNumber withObject:resultDoc];
        
     //   mainSearchPage.movieArray = [NSArray arrayWithArray:array];
        
        
        
        self.movie = movies;
        [self.tableView reloadData];
       
    }
}

//how tall is each row?
/*-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == PARK_IMAGE_SECTION || indexPath.section == PARK_DESCRIPTION_SECTION){
        return 88.0;
    }else{
        return 44.0;
    }
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
