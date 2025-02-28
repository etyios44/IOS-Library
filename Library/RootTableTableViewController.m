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
    NSArray *files;
    NSString *label;
}
@end

@implementation RootTableTableViewController
@synthesize connectorClass;

- (void)viewDidLoad {
    [super viewDidLoad];
    label = connectorClass.stringBeingPassed;
    NSLog(@"label : %@, secondString : %@", label, connectorClass.secondString);
    
    NSLog(@"\n\nGetting a Directory File Listing\n");
    NSFileManager *filemgr;
    NSArray *filelist;
    int c;
    int i;
    NSString *currentpath;
    filemgr = [NSFileManager defaultManager];
    NSString *myHome = NSHomeDirectory();
    currentpath = myHome;
    NSLog (@"currentpath : %@",currentpath);
    //filelist = [filemgr contentsOfDirectoryAtPath:currentpath error: nil];
    filelist = [filemgr contentsOfDirectoryAtPath:label error: nil];
    c = [filelist count] ;
    for (i = 0; i < c; i++)
        NSLog (@"filelist : %@", [filelist objectAtIndex: i]);
    files = filelist;
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [files count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 
    static NSString *simpleTableIdentifier = @"AnimalCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [files  objectAtIndex:indexPath.row];
     return cell;
}

-  (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showArrayDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        SecondTableViewController *destViewController = segue.destinationViewController;
        destViewController.fileName = [files objectAtIndex:indexPath.row];
        destViewController.title = destViewController.fileName;
    }

}


@end
