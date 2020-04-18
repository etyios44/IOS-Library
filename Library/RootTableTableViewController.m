//
//  RootTableTableViewController.m
//  Library
//
//  Created by eric on 14/04/2020.
//  Copyright © 2020 SLCC. All rights reserved.
//

#import "RootTableTableViewController.h"
#import "SecondTableViewController.h"

@interface RootTableTableViewController () {
    NSArray *animals;
}
@end

@implementation RootTableTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //animals = [NSArray arrayWithObjects:@"Dogs",@"Cats",@"Frogs",@"Gnats", nil];

    ////
    
    NSLog(@"\n\nGetting a Directory File Listing\n");
    NSFileManager *filemgr;
    NSArray *filelist;
    int c;
    int i;
    NSString *currentpath;
    
    filemgr = [NSFileManager defaultManager];
    currentpath = [filemgr currentDirectoryPath];
    //filelist = [filemgr contentsOfDirectoryAtPath: @"/tmp" error: nil];
    filelist = [filemgr contentsOfDirectoryAtPath:currentpath error: nil];
    c = [filelist count] ;
    
    for (i = 0; i < c; i++)
        NSLog (@"%@", [filelist objectAtIndex: i]);
    
    animals = filelist;
    
    ////
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [animals count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 
    static NSString *simpleTableIdentifier = @"AnimalCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [animals  objectAtIndex:indexPath.row];
     return cell;
}

-  (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showArrayDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        SecondTableViewController *destViewController = segue.destinationViewController;
        destViewController.animalName = [animals objectAtIndex:indexPath.row];
        destViewController.title = destViewController.animalName;
    }

}


@end
