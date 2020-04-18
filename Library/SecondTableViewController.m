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

@implementation SecondTableViewController {
    
    NSArray *filelist;
    NSString *currentpath;
    int nb;
    NSString *existingVariable ;
    NSFileManager *filemgr;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    int c;
    int i;

    filemgr = [NSFileManager defaultManager];
    filelist = [filemgr contentsOfDirectoryAtPath: @"/tmp" error: nil];
    
    c = [filelist count] ;
    
    for (i = 0; i < c; i++)
        NSLog (@"%@", [filelist objectAtIndex: i]);
    
    listAttrib = [NSArray arrayWithObjects:@"NSFileCreationDate",@"NSFileImmutable",@"NSFileAppendOnly",@"NSFileOwnerAccountID",@"NSFileGroupOwnerAccountID",@"NSFileSize",@"NSFileModificationDate",@"NSFileReferenceCount",@"NSFileOwnerAccountName",@"NSFileGroupOwnerAccountName",@"NSFilePosixPermissions",@"NSFileSystemNumber",@"NSFileSystemFileNumber",@"NSFileExtensionHidden",@"NSFileTypeRegular",@"NSFileTypeSymbolicLink",@"NSFileTypeSocket",@"NSFileTypeCharacterSpecial",@"NSFileTypeBlockSpecial",@"NSFileTypeUnknown",@"NSFileDeviceIdentifier",@"NSFileHFSCreatorCode",@"NSFileHFSTypeCode", nil];

    nb = [listAttrib count];
    
    i = 0;
    for (existingVariable in listAttrib) {
        NSString *labAttrib;
        labAttrib = [attribs objectForKey: existingVariable];
        NSLog (@"%i - %@ on : %@", i, existingVariable, labAttrib);
        i++;
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //return 4;
    return nb;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *simpleTableIdentifier = @"File2Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }

    filemgr = [NSFileManager defaultManager];
    currentpath = [filemgr currentDirectoryPath];
    
    //attribs = [filemgr attributesOfItemAtPath: @"/tmp" error: NULL];
    attribs = [filemgr attributesOfItemAtPath: _fileName error: NULL];
    
    NSString *res;
    for (int j=0;j<nb;j++) {
        if (indexPath.row == j) {
            //existingVariable = listAttrib[20];
            existingVariable = listAttrib[(int)indexPath.row];
            NSLog(@"indexPath.row : %i, %@", (int)indexPath.row, existingVariable);
            res = [attribs objectForKey: existingVariable];
            if (!res) {
                cell.textLabel.text = @"";
            } else {
                cell.textLabel.text = [NSString stringWithFormat:@"%@ : %@", existingVariable, [attribs objectForKey: existingVariable]];
            }
        }
    }

    return cell;
}

@end
