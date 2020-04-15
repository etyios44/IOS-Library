//
//  SecondTableViewController.m
//  Library
//
//  Created by eric on 14/04/2020.
//  Copyright © 2020 SLCC. All rights reserved.
//

#import "SecondTableViewController.h"

@interface SecondTableViewController ()

@end

@implementation SecondTableViewController {
    NSArray *dogs;
    NSArray *cats;
    NSArray *frogs;
    NSArray *gnats;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    dogs = [NSArray arrayWithObjects:@"Golden",@"Lab",@"Boxer", nil];
    cats = [NSArray arrayWithObjects:@"Colden",@"Cab", nil];
    frogs = [NSArray arrayWithObjects:@"Folden",@"Fab",@"Foxer",@"FFoxer", nil];
    gnats = [NSArray arrayWithObjects:@"Olden",@"Oab",@"Ooxer",@"Oooxer",@"Ooooxer", nil];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if ( [_animalName isEqualToString:@"Dogs"]) {
        return [dogs count];
    }
    else if ( [_animalName isEqualToString:@"Cats"]) {
        return [cats count];
    }
    else if ( [_animalName isEqualToString:@"Frogs"]) {
        return [frogs count];
    }
    else if ( [_animalName isEqualToString:@"Gnats"]) {
        return [gnats count];
    }
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *simpleTableIdentifier = @"Animal2Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    if ([_animalName isEqualToString:@"Dogs"]) {
        cell.textLabel.text = [dogs objectAtIndex:indexPath.row];
    }
    else if ([_animalName isEqualToString:@"Cats"]) {
        cell.textLabel.text = [cats objectAtIndex:indexPath.row];
    }
    else if ([_animalName isEqualToString:@"Frogs"]) {
        cell.textLabel.text = [frogs objectAtIndex:indexPath.row];
    }
    else if ([_animalName isEqualToString:@"Gnats"]) {
        cell.textLabel.text = [gnats objectAtIndex:indexPath.row];
    }
    
    return cell;
}

@end
