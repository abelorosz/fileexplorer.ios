//
//  FileTableViewCell.h
//  FileExplorer
//
//  Created by Orosz Ábel on 27/12/14.
//  Copyright (c) 2014 Abel Orosz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MGSwipeTableCell/MGSwipeTableCell.h>

@interface FileTableViewCell : MGSwipeTableCell

@property (weak, nonatomic) IBOutlet UIView *blueView;
@property (weak, nonatomic) IBOutlet UIView *orangeView;
@property (weak, nonatomic) IBOutlet UIView *rightBarsView;

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@property (weak, nonatomic) IBOutlet UILabel *filename;
@property (weak, nonatomic) IBOutlet UILabel *modDate;


@end
