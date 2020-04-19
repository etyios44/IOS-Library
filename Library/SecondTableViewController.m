//
//  SecondTableViewController.m
//  Library
//
//  Created by eric on 14/04/2020.
//  Copyright © 2020 SLCC. All rights reserved.
//

#import "SecondTableViewController.h"

@interface SecondTableViewController () {

        NSArray *listAttrib;
        NSDictionary *attribs;
}
@end

@implementation SecondTableViewController 

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
    //return nb;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"File2Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }

    NSFileManager *filemgr = [NSFileManager defaultManager];
    NSString *myHome = NSHomeDirectory();
    NSLog(@"myHome : %@", NSHomeDirectory());
    NSString *fil = [NSString stringWithFormat:@"%@/%@", myHome, _fileName];
    NSLog(@"fil: %@", fil);
    NSError *error;
    NSString *getfileContents = [NSString stringWithContentsOfFile:fil encoding:NSUTF8StringEncoding error:&error];
    if (error)
        NSLog(@"Error reading file: %@", error.localizedDescription);
    NSLog(@"contents: %@", getfileContents);
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@", getfileContents];

    return cell;
}

@end
