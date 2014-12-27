//
//  FileTableViewController.m
//  FileExplorer
//
//  Created by Orosz Ábel on 27/12/14.
//  Copyright (c) 2014 Abel Orosz. All rights reserved.
//

#import "FileTableViewController.h"

@interface FileTableViewController () {
    NSArray *fileList;
    NSString *viewTitle;
}

@end

@implementation FileTableViewController

// Custom initialization with file list and view title
- (id)initWithArray:(NSArray *)list andTitle:(NSString *)title {
    self = [super init];
    if (!self) return nil;
    
    fileList = list;
    viewTitle = title;
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = viewTitle;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [fileList count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FileTableViewCell *cell = (FileTableViewCell *) [tableView dequeueReusableCellWithIdentifier:@"fileCell"];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"FileTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    FileModel *actualFile = [fileList objectAtIndex:indexPath.row];
    
    // File / Folder names
    if ([actualFile.filename isEqualToString:@""])
        cell.filename.text = actualFile.isFolder;
    else {
        cell.filename.text = actualFile.filename;
        cell.rightBarsView.hidden = YES;
    }
        
    
    // Dates
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setLocale:[NSLocale localeWithLocaleIdentifier:@"en_US"]];
    [dateFormat setDateFormat:@"MMMM dd, YYYY"];
    cell.modDate.text = [NSString stringWithFormat:@"modified %@", [dateFormat stringFromDate:actualFile.modDate]];
    
    
    // Icons
    if (actualFile.fileType == FTImage)
        cell.iconImageView.image = [UIImage imageNamed:@"fileIconImage"];
    else if (actualFile.fileType == FTMovie)
        cell.iconImageView.image = [UIImage imageNamed:@"fileIconMovie"];
    else if (actualFile.fileType == FTMusic)
        cell.iconImageView.image = [UIImage imageNamed:@"fileIconMusic"];
    else if (actualFile.fileType == FTPDF)
        cell.iconImageView.image = [UIImage imageNamed:@"fileIconPDF"];
    else if (actualFile.fileType == FTFolder)
        cell.iconImageView.image = [UIImage imageNamed:@"fileIconFolder"];
    else
        cell.iconImageView.image = [UIImage imageNamed:@"fileIconOther"];
    
    
    // Blue / Orange bars
    if (actualFile.isOrange && actualFile.isBlue) {
        cell.blueView.backgroundColor = [UIColor colorWithRed:0.204 green:0.596 blue:0.859 alpha:1];
        cell.orangeView.backgroundColor = [UIColor colorWithRed:0.827 green:0.329 blue:0 alpha:1];
    }
    else if (actualFile.isOrange && !actualFile.isBlue) {
        cell.blueView.backgroundColor = [UIColor colorWithRed:0.827 green:0.329 blue:0 alpha:1];
        cell.orangeView.backgroundColor = [UIColor colorWithRed:0.827 green:0.329 blue:0 alpha:1];
    }
    else if (!actualFile.isOrange && actualFile.isBlue) {
        cell.blueView.backgroundColor = [UIColor colorWithRed:0.204 green:0.596 blue:0.859 alpha:1];
        cell.orangeView.backgroundColor = [UIColor colorWithRed:0.204 green:0.596 blue:0.859 alpha:1];
    }
    else {
        cell.blueView.backgroundColor = [UIColor whiteColor];
        cell.orangeView.backgroundColor = [UIColor whiteColor];
    }
    
    
    // Swipe buttons
    cell.rightButtons = @[
        [MGSwipeButton buttonWithTitle:@"" icon:[UIImage imageNamed:@"fileMenuTrash"] backgroundColor:[UIColor whiteColor]],
        [MGSwipeButton buttonWithTitle:@"" icon:[UIImage imageNamed:@"fileMenuLink"] backgroundColor:[UIColor whiteColor]],
        [MGSwipeButton buttonWithTitle:@"" icon:[UIImage imageNamed:@"fileMenuStar"] backgroundColor:[UIColor whiteColor]]
    ];
    cell.rightSwipeSettings.transition = MGSwipeTransitionStatic;
    
    
    return cell;
}


#pragma mark - Navigation

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    FileModel *actualFile = [fileList objectAtIndex:indexPath.row];
    
    if (![actualFile.isFolder isEqualToString:@""]) {
        FileTableViewController *fileController = [[FileTableViewController alloc] initWithArray:[FileHelper parseDictionaryToFileModel:actualFile.content] andTitle:actualFile.isFolder];
        [self.navigationController pushViewController:fileController animated:YES];
    }
    else
        NSLog(@"FILE: %@", actualFile.filename);
}

@end
