//
//  LYRUIMessageListViewConfiguration.h
//  Layer-UI-iOS
//
//  Created by Łukasz Przytuła on 18.08.2017.
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
@class LYRUIMessageListView;
@protocol LYRUIMessageTimeFormatting;

/**
 @abstract The `LYRUIMessageListViewConfiguration` objects will be used for configuring a `LYRUIMessageListView` with proper layout, data source, and delegate for presenting list of `LYRIdentity` items.
 */
@interface LYRUIMessageListViewConfiguration : NSObject

/**
 @abstract Configures provided `LYRUIMessageListView` for presenting `LYRMessage` items.
 @param messageListView An `LYRUIMessageListView` instance to be configured. The `layout`, `dataSource`, and `delegate` properties of the list view will be set properly to present `LYRMessage` items.
 */
- (void)setupMessageListView:(LYRUIMessageListView *)messageListView;

@end
