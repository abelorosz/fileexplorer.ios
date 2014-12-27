//
//  FileModel.h
//  FileExplorer
//
//  Created by Orosz Ábel on 27/12/14.
//  Copyright (c) 2014 Abel Orosz. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, FileType) {
    FTPDF,
    FTImage,
    FTMovie,
    FTMusic,
    FTFolder,
    FTOther
};


@interface FileModel : NSObject

@property (nonatomic, retain) NSString *filename;
@property (nonatomic, assign) FileType fileType;
@property (nonatomic, retain) NSDate *modDate;

@property (nonatomic, retain) NSString *isFolder;

@property (nonatomic, assign) BOOL isBlue;
@property (nonatomic, assign) BOOL isOrange;

@property (nonatomic, retain) id content;

@end
