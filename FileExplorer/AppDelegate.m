//
//  AppDelegate.m
//  FileExplorer
//
//  Created by Orosz Ábel on 27/12/14.
//  Copyright (c) 2014 Abel Orosz. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"filelist" ofType:@"json"];
    NSData *fileData = [NSData dataWithContentsOfFile:filePath];
    id json = [NSJSONSerialization JSONObjectWithData:fileData options:kNilOptions error:nil];
    
    FileTableViewController *fileController = [[FileTableViewController alloc] initWithArray:[FileHelper parseDictionaryToFileModel:json] andTitle:@"File Explorer"];
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:fileController];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = self.navigationController;
    
    [self.window makeKeyAndVisible];
     
    return YES;
}

@end
