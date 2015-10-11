//
//  FavouritesTableVC.m
//  MovieSearch
//
//  Created by Student on 12/1/14.
//  Copyright (c) 2014 RIT. All rights reserved.
//

#import "FavouritesTableVC.h"
#import "MovieDetaiVC.h"
#import "Movies.h"
#import "MainSearchPage.h"

@interface FavouritesTableVC ()

@end

@implementation FavouritesTableVC

@synthesize movietTitleArray,favMovies,movieArr;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    self.movieArr = [[NSMutableArray alloc]init];
    MainSearchPage *mainSearchPage = [[MainSearchPage alloc]init];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    movietTitleArray = [[NSMutableArray alloc] initWithArray:[defaults objectForKey:@"movie"]];
   
    for (NSString *str in movietTitleArray ) {
        NSArray *a =[mainSearchPage retriveMovies:@"Title" searchQuery:str];
      
        [self.movieArr addObjectsFromArray:a];
      
    }
    
  
    [self.tableView reloadData];
    [defaults synchronize];
    
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
 return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return[movietTitleArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FavoriteMovieCell" forIndexPath:indexPath];
    
     cell.textLabel.text = [movietTitleArray objectAtIndex:indexPath.row];
     cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (void)addMovieToFavorite:(Movies *)movie
{
    
    //[self.navigationController setSelectedViewController:self];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    movietTitleArray = [[NSMutableArray alloc] initWithArray:[defaults objectForKey:@"movie"]];
    
    
    [movietTitleArray addObject:movie.movieTitle];
    [[NSUserDefaults standardUserDefaults] setObject:movietTitleArray forKey:@"movie"];
    [defaults synchronize];
    
     // NSLog(@"Favourite park - @a",favMovies);
}

- (void)removeMovieFromFavorite:(Movies *)movie
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    movietTitleArray = [[NSMutableArray alloc] initWithArray:[defaults objectForKey:@"movie"]];
    
    [movietTitleArray removeObject:movie.movieTitle];
    
    [[NSUserDefaults standardUserDefaults] setObject:movietTitleArray forKey:@"movie"];
    [defaults synchronize];
    
    // NSLog(@"Favourite park - @a",favMovies);
}

-(BOOL)checkForMovie:(Movies *)movie{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    movietTitleArray = [[NSMutableArray alloc] initWithArray:[defaults objectForKey:@"movie"]];
    
    if ([movietTitleArray containsObject:movie.movieTitle]) {
        return TRUE;
    
    }
    else{
        return FALSE;
    }
}


-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *movieTitle = [self.movietTitleArray objectAtIndex:indexPath.row];
    MovieDetaiVC *detailVC = [[MovieDetaiVC alloc]initWithStyle:UITableViewStyleGrouped];
   // Movies *mv = (Movies *)self.movieArr;
    //Movies *singlemv;
  /*  for (Movies *p in mv) {
        if ([p.movieTitle isEqualToString:movieTitle]) {
            detailVC.title = p.movieTitle;
            detailVC.movie = p;
            break;
        }
    }*/
  
    for (BSONDocument *movie in self.movieArr) {
        
        NSDictionary *movieDict = [BSONDecoder decodeDictionaryWithDocument:movie];
       
        if ([[movieDict objectForKey:@"Title"] isEqualToString:movieTitle]) {
            detailVC.title = movieTitle;
            Movies *movies = [[Movies alloc] initWithDictionary:movieDict];
            
            detailVC.movie = movies;
            break;
        }
        
    }
    
    [self.navigationController pushViewController:detailVC animated:YES];
}



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
