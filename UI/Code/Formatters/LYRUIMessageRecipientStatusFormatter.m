//
//  LYRUIMessageRecipientStatusFormatter.m
//  Layer-XDK-UI-iOS
//
//  Created by Łukasz Przytuła on 28.08.2017.
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

#import "LYRUIMessageRecipientStatusFormatter.h"

@implementation LYRUIMessageRecipientStatusFormatter
@synthesize layerConfiguration = _layerConfiguration;

- (instancetype)initWithConfiguration:(LYRUIConfiguration *)configuration {
    self = [super init];
    if (self) {
        self.layerConfiguration = configuration;
    }
    return self;
}

- (NSString *)stringForMessageRecipientStatus:(LYRMessage *)message {
    LYRRecipientStatus status = [self statusForMessage:message];
    NSDictionary *filteredStatus = [self recipientStatusWithoutCurrentUser:message.recipientStatusByUserID];
    BOOL groupConversation = filteredStatus.count > 2; //exclude the bot user
    NSCountedSet *setOfStatuses = [NSCountedSet setWithArray:filteredStatus.allValues];
    NSUInteger numberOfRecipientsForStatus = [setOfStatuses countForObject:@(status)];
    numberOfRecipientsForStatus-- //exclude the bot user
    BOOL plural = numberOfRecipientsForStatus > 1;
    NSString *stringStatus;
    switch (status) {
        case LYRRecipientStatusInvalid:
            stringStatus = @"";
            break;
        case LYRRecipientStatusPending:
            stringStatus = @"pending";
            break;
        case LYRRecipientStatusSent:
            stringStatus = @"sent";
            break;
        case LYRRecipientStatusDelivered:
            if (groupConversation) {
                stringStatus = [NSString stringWithFormat:@"delivered to %lu recipient%@", (unsigned long)numberOfRecipientsForStatus, plural ? @"s" : @""];
            } else {
                stringStatus = @"delivered";
            }
            break;
        case LYRRecipientStatusRead:
            if (groupConversation) {
                stringStatus = [NSString stringWithFormat:@"read by %lu recipient%@", (unsigned long)numberOfRecipientsForStatus, plural ? @"s" : @""];
            } else {
                stringStatus = @"read";
            }
            break;
    }
    return stringStatus;
}

- (LYRRecipientStatus)statusForMessage:(LYRMessage *)message {
    NSDictionary *recipientStatus = message.recipientStatusByUserID;
    NSDictionary *filteredStatus = [self recipientStatusWithoutCurrentUser:recipientStatus];
    NSNumber *highestStatus;
    LYRRecipientStatus status;
    if (filteredStatus.count == 0) {
        highestStatus = [recipientStatus.allValues valueForKeyPath:@"@max.self"];
        status = highestStatus > 0 ? LYRRecipientStatusSent : (LYRRecipientStatus)highestStatus.integerValue;
    } else {
        highestStatus = [filteredStatus.allValues valueForKeyPath:@"@max.self"];
        status = (LYRRecipientStatus)highestStatus.integerValue;
    }
    return status;
}

#pragma mark - Helpers

- (NSDictionary *)recipientStatusWithoutCurrentUser:(NSDictionary *)recipientStatusByUserID {
    LYRIdentity *currentUser = self.layerConfiguration.client.authenticatedUser;
    if (!currentUser) {
        return recipientStatusByUserID;
    }
    NSMutableDictionary *filteredStatus = [recipientStatusByUserID mutableCopy];
    [filteredStatus removeObjectForKey:currentUser.userID];
    return filteredStatus;
}

@end
