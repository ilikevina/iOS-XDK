//
//  LYRUICarouselMessage.h
//  Layer-XDK-UI-iOS
//
//  Created by Łukasz Przytuła on 04.12.2017.
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

#import "LYRUIMessageType.h"

NS_ASSUME_NONNULL_BEGIN     // {
@interface LYRUICarouselMessage : LYRUIMessageType

@property (nonatomic, strong, readonly) NSArray<LYRUIMessageType *> *carouselItemMessages;
@property (nonatomic, copy, readonly) NSString *identifier;

- (instancetype)initWithItemMessages:(NSArray<LYRUIMessageType *> *)itemMessages
                          identifier:(nullable NSString *)identifier
                              action:(nullable LYRUIMessageAction *)action
                              sender:(nullable LYRIdentity *)sender
                              sentAt:(nullable NSDate *)sentAt
                              status:(nullable LYRUIMessageTypeStatus *)status
                         messagePart:(nullable LYRMessagePart *)messagePart;

@end
NS_ASSUME_NONNULL_END       // }
