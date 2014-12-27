//
//  FileHelper.m
//  FileExplorer
//
//  Created by Orosz Ábel on 27/12/14.
//  Copyright (c) 2014 Abel Orosz. All rights reserved.
//

#import "FileHelper.h"

@implementation FileHelper

+ (NSArray *)parseDictionaryToFileModel:(NSArray *)jsonArray {
    NSMutableArray *resultArray = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < [jsonArray count]; i++) {
        FileModel *model = [[FileModel alloc] init];
        NSDictionary *actualObject = [jsonArray objectAtIndex:i];
        
        model.filename = actualObject[@"filename"];
        model.modDate = [self parseDateFromString:actualObject[@"modDate"]];
        model.isFolder = actualObject[@"isFolder"];
        model.content = actualObject[@"content"];

        
        if ([actualObject[@"isBlue"] isEqual:@(1)])
            model.isBlue = YES;
        else
            model.isBlue = NO;
        
        if ([actualObject[@"isOrange"] isEqual:@(1)])
            model.isOrange = YES;
        else
            model.isOrange = NO;
        
        
        if ([actualObject[@"fileType"] isEqualToString:@"image"])
            model.fileType = FTImage;
        else if ([actualObject[@"fileType"] isEqualToString:@"music"])
            model.fileType = FTMusic;
        else if ([actualObject[@"fileType"] isEqualToString:@"movie"])
            model.fileType = FTMovie;
        else if ([actualObject[@"fileType"] isEqualToString:@"pdf"])
            model.fileType = FTPDF;
        else if ([actualObject[@"fileType"] isEqualToString:@"folder"])
            model.fileType = FTFolder;
        else
            model.fileType = FTOther;
        
        
        [resultArray addObject:model];
    }
    
    return resultArray;
}

+ (NSDate *)parseDateFromString:(NSString *)dateString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [dateFormatter dateFromString:dateString];
}

@end
