//
//  FileHelper.h
//  FileExplorer
//
//  Created by Orosz Ábel on 27/12/14.
//  Copyright (c) 2014 Abel Orosz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FileModel.h"

@interface FileHelper : NSObject

+ (NSArray *)parseDictionaryToFileModel:(NSArray *)jsonArray;

@end
