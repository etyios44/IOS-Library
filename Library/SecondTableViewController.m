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
    
    NSArray *animals;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    dogs = [NSArray arrayWithObjects:@"Golden",@"Lab",@"Boxer", nil];
    cats = [NSArray arrayWithObjects:@"Colden",@"Cab", nil];
    frogs = [NSArray arrayWithObjects:@"Folden",@"Fab",@"Foxer",@"FFoxer", nil];
    gnats = [NSArray arrayWithObjects:@"Olden",@"Oab",@"Ooxer",@"Oooxer",@"Ooooxer", nil];
    
    ///
    
    NSLog(@"\n\nGetting a Directory File Listing\n");
    NSFileManager *filemgr;
    NSArray *filelist;
    int c;
    int i;
    
    filemgr = [NSFileManager defaultManager];
    
    filelist = [filemgr contentsOfDirectoryAtPath: @"/tmp" error: nil];
    
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

    /*
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
    */
    
    return 1;
     
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *simpleTableIdentifier = @"Animal2Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    /*
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
    */
    
    
    NSLog(@"\n\nGetting the Attributes of a File or Directory\n");
    
    NSDictionary *attribs;
    NSFileManager *filemgr;

    filemgr = [NSFileManager defaultManager];
    
    //attribs = [filemgr attributesOfItemAtPath: @"/tmp" error: NULL];
    attribs = [filemgr attributesOfItemAtPath: _animalName error: NULL];
    
    NSLog (@"Created on %@", [attribs objectForKey: NSFileCreationDate]);
    NSLog (@"File type %@", [attribs objectForKey: NSFileType]);
    NSLog (@"POSIX Permissions %@", [attribs objectForKey: NSFilePosixPermissions]);
    
    ///
    
    //cell.textLabel.text = [animals  objectAtIndex:indexPath.row];
    NSString *test = [attribs objectForKey: NSFileCreationDate];
    cell.textLabel.text = [NSString stringWithFormat:@"%@\n%@\n%@",
                           [attribs objectForKey: NSFileCreationDate],
                           [attribs objectForKey: NSFileType],
                           [attribs objectForKey: NSFilePosixPermissions]];
    NSLog (@"test %@", cell.textLabel.text);
    return cell;
}

@end
