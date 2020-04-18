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
    
    NSArray *filelist;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"\n\nGetting a Directory File Listing\n");
    NSFileManager *filemgr;
    int c;
    int i;
    
    filemgr = [NSFileManager defaultManager];
    
    filelist = [filemgr contentsOfDirectoryAtPath: @"/tmp" error: nil];
    
    c = [filelist count] ;
    
    for (i = 0; i < c; i++)
        NSLog (@"%@", [filelist objectAtIndex: i]);
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 3;
     
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *simpleTableIdentifier = @"File2Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    NSLog(@"\n\nGetting the Attributes of a File or Directory\n");
    
    NSDictionary *attribs;
    NSFileManager *filemgr;

    filemgr = [NSFileManager defaultManager];
    
    //attribs = [filemgr attributesOfItemAtPath: @"/tmp" error: NULL];
    attribs = [filemgr attributesOfItemAtPath: _fileName error: NULL];
    
    NSLog (@"Created on %@", [attribs objectForKey: NSFileCreationDate]);
    NSLog (@"File type %@", [attribs objectForKey: NSFileType]);
    NSLog (@"POSIX Permissions %@", [attribs objectForKey: NSFilePosixPermissions]);
    
    /*
    cell.textLabel.text = [NSString stringWithFormat:@"%@\n%@\n%@",
                           [attribs objectForKey: NSFileCreationDate],
                           [attribs objectForKey: NSFileType],
                           [attribs objectForKey: NSFilePosixPermissions]];
    */
    if (indexPath.row == 0) {
        cell.textLabel.text = [NSString stringWithFormat:@"NSFileCreationDate : %@",
                           [attribs objectForKey: NSFileCreationDate]];
    } else if (indexPath.row == 1) {
        cell.textLabel.text = [NSString stringWithFormat:@"NSFileType : %@",
                        [attribs objectForKey: NSFileType]];
    } else if (indexPath.row == 2) {
        cell.textLabel.text = [NSString stringWithFormat:@"NSFilePosixPermissions : %@",
                               [attribs objectForKey: NSFilePosixPermissions]];
    }
     NSLog (@"test %@", cell.textLabel.text);
    return cell;
}

@end
