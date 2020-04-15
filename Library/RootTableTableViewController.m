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
    animals = [NSArray arrayWithObjects:@"Dogs",@"Cats",@"Frogs",@"Gnats", nil];

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
