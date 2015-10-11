//
//  SearchViewController.m
//  MovieSearch
//
//  Created by Student on 11/22/14.
//  Copyright (c) 2014 RIT. All rights reserved.
//

#import "SearchViewController.h"
#import "MovieDetaiVC.h"
#import "Movies.h"
#import "MainSearchPage.h"
@interface SearchViewController ()

@end

@implementation SearchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    
    MainSearchPage *mainSearchPage = [[MainSearchPage alloc]init];
    self.movieArray = [mainSearchPage retriveMovies:self.category searchQuery:self.searchQuery];
    
    UITableView *tableView = [[self view]subviews][0];
    [tableView reloadData];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
     UITableView *tableView = [[self view]subviews][0];
     [tableView reloadData];
    // Do any additional setup after loading the view.
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.movieArray count];;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MovieCell" forIndexPath:indexPath];
    BSONDocument *movie = [self.movieArray objectAtIndex:indexPath.row];
    NSDictionary *movieDict = [BSONDecoder decodeDictionaryWithDocument:movie];
    
    //NSLog(@" resultArray: %@",[movieDict objectForKey:@"Title"]);
    
    cell.textLabel.text = [movieDict objectForKey:@"Title"];
    
    // Configure the cell...
    
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    BSONDocument *movie = [self.movieArray objectAtIndex:indexPath.row];
    NSDictionary *movieDict = [BSONDecoder decodeDictionaryWithDocument:movie];
    Movies *movies = [[Movies alloc] initWithDictionary:movieDict];
    
    NSLog(@" resultArray: %@",[movieDict objectForKey:@"Title"]);

    MovieDetaiVC *detailVC = [[MovieDetaiVC alloc]initWithStyle:UITableViewStyleGrouped];
    detailVC.movie = movies;
    [self.navigationController pushViewController:detailVC animated:YES];
}




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
