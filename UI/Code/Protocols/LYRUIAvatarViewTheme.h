//
//  LYRUIAvatarViewTheme.h
//  Layer-UI-iOS
//
//  Created by Łukasz Przytuła on 21.07.2017.
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
#import "LYRUIPresenceView.h"

/**
 @abstract Objects conforming to the `LYRUIAvatarViewTheme` protocol will be used to provide colors for the avatar view.
 */
@protocol LYRUIAvatarViewTheme <LYRUIPresenceViewTheme>

/**
 @abstract The color of avatar circle view background.
 */
@property (nonatomic, readonly) UIColor *initialsBackgroundColor;

@end