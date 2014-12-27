//
//  FileTableViewController.h
//  FileExplorer
//
//  Created by Orosz Ábel on 27/12/14.
//  Copyright (c) 2014 Abel Orosz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FileModel.h"
#import "FileHelper.h"
#import "FileTableViewCell.h"
#import <MGSwipeTableCell/MGSwipeButton.h>

@interface FileTableViewController : UITableViewController <UITableViewDelegate>

- (id)initWithArray:(NSArray *)list andTitle:(NSString *)title;

@end
