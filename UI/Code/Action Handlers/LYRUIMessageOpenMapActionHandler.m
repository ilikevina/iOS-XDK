//
//  LYRUIMessageOpenMapActionHandler.m
//  Layer-XDK-UI-iOS
//
//  Created by Łukasz Przytuła on 02.10.2017.
//  Copyright (c) 2017 Layer. All rights reserved.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import "LYRUIMessageOpenMapActionHandler.h"
#import "LYRUIConfiguration+DependencyInjection.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import <LayerKit/LayerKit.h>
#import "LYRUILocationPreviewViewController.h"

@implementation LYRUIMessageOpenMapActionHandler
@synthesize layerConfiguration = _layerConfiguration;

- (instancetype)initWithConfiguration:(LYRUIConfiguration *)configuration {
    self = [self init];
    if (self) {
        self.layerConfiguration = configuration;
    }
    return self;
}

- (void)handleActionWithData:(NSDictionary *)data delegate:(id<LYRUIActionHandlingDelegate>)delegate {
    UIViewController *viewController = [self viewControllerForActionWithData:data];
    if (viewController) {
        [delegate actionHandler:self presentViewController:viewController];
    }
}

- (UIViewController *)viewControllerForActionWithData:(NSDictionary *)data {
    if (data == nil || data[@"latitude"] == nil || data[@"longitude"] == nil) {
        return nil;
    }
    CGFloat latitude = [data[@"latitude"] doubleValue];
    CGFloat longitude = [data[@"longitude"] doubleValue];
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(latitude, longitude);
    
    LYRUILocationPreviewViewController *previewController = [[LYRUILocationPreviewViewController alloc] init];
    [previewController showCoordinate:coordinate];
    UINavigationController *navigationViewController = [[UINavigationController alloc] initWithRootViewController:previewController];
    
    return navigationViewController;
}

@end
