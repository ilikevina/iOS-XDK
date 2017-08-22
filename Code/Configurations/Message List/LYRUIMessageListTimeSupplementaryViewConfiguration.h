//
//  LYRUIMessageListTimeSupplementaryViewConfiguration.h
//  Layer-UI-iOS
//
//  Created by Łukasz Przytuła on 17.10.2017.
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

#import <Foundation/Foundation.h>
#import "LYRUIListSupplementaryViewConfiguring.h"
#import "LYRUIListSupplementaryViewSizeCalculating.h"
#import "LYRUIMessageListStatusSupplementaryViewConfiguration.h"
@class LYRUIMessageListView;

@interface LYRUIMessageListTimeSupplementaryViewConfiguration : NSObject <LYRUIListSupplementaryViewConfiguring,
                                                                          LYRUIListSupplementaryViewSizeCalculating>

/**
 @abstract Reference to the `LYRUIMessageListView` that uses the configuration, to retrieve the `messageGroupingTimeInterval`.
 */
@property (nonatomic, weak) LYRUIMessageListView *messageListView;

/**
 @abstract Height of the message time supplementary view.
 */
@property (nonatomic) CGFloat messageTimeHeight;

@end
