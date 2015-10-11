//
//  MainSearchPage.m
//  MovieSearch
//
//  Created by Student on 11/23/14.
//  Copyright (c) 2014 RIT. All rights reserved.
//

#import "MainSearchPage.h"
#import "SearchViewController.h"

@interface MainSearchPage ()
@property (weak, nonatomic) IBOutlet UITextField *searchText;
- (IBAction)performSearch:(id)sender;

@property (weak, nonatomic) IBOutlet UIPickerView *categoriesSelect;

@end

@implementation MainSearchPage

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
  
    self.categoriesArray  = [[NSArray alloc]initWithObjects:@"All",@"Title",@"Genre",@"Actors",@"Director",@"Year" , nil];
    self.categoriesSelect.dataSource = self;
    self.categoriesSelect.delegate = self;
    
    _searchText.delegate = self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (IBAction)performSearch:(id)sender {
    [_searchText resignFirstResponder];
   // NSLog(@"Calling");
   }

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self textFieldShouldReturn:self.searchText];
   // NSLog(@"Called");
}

-(void) textFieldDidEndEditing:(UITextField *)textField{
    // NSLog(@"Called 1");
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

-(NSArray *) retriveMovies:(NSString *)category searchQuery:(NSString *)searchText{
    // NSError*  err = [[[NSError alloc]init] autorelease];
    NSError* __autoreleasing *err = nil;
    
    NSArray *arr = [[NSArray alloc]init];
    
    MongoConnection *dbconn = [MongoConnection connectionForServer:@"127.0.0.1" error:err];
    
    MongoDBCollection *collection = [dbconn collectionWithName:@"social.movies"];
    
    
    MongoKeyedPredicate *predicate1 = [MongoKeyedPredicate predicate];
    
    // BSONRegularExpression * pattern = [[BSONRegularExpression alloc]init];
    //  [predicate1 keyPath:@"Genre" matchesRegularExpression:[[[BSONRegularExpression alloc]init];
    
    //NSString *str = [NSString stringWithFormat:@"%@",searchText];
    
    if ([category isEqualToString:@"All"] || category == nil) {
       arr = [collection findAllWithError:err];
    }else
    {
    [predicate1 keyPath:category matchesRegularExpression:[BSONRegularExpression regularExpressionWithPattern:searchText options:@"i"]];
   arr = [collection findWithPredicate:predicate1 error:err];
    }
    NSLog(@"fetch result: %d", arr.count);

    return arr;
   // UITableView *tableView = [[self view]subviews][0];
    //[tableView reloadData];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@"SearchMovies"]){
        
        NSString *query = [[self searchText] text];
        
       self.movieArray = [self retriveMovies:self.category searchQuery:query];

        
        SearchViewController *searchvc = (SearchViewController *)[segue destinationViewController];
        searchvc.movieArray = self.movieArray;
        
        searchvc.category = self.category;
        searchvc.searchQuery = query;
        
        NSLog(@"movie array in segue result: %d", self.movieArray.count);
        //searchvc.delegate = self;
    }
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [self.categoriesArray count];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.categoriesArray objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    switch(row)
    {
        case 0:
            self.category = @"All";
            break;
        case 1:
           self.category = @"Title";
            break;
        case 2:
             self.category = @"Genre";
            break;
        case 3:
            self.category = @"Actors";
            break;
        case 4:
            self.category = @"Director";
            break;
        case 5:
            self.category = @"Year";
            break;
        default:
        break;
    }
    
     NSLog(@"Category selected: %@", self.category);
}

@end
