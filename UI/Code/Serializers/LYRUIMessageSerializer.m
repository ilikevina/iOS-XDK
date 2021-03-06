//
//  LYRUIMessageSerializer.m
//  Layer-XDK-UI-iOS
//
//  Created by Łukasz Przytuła on 06.10.2017.
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

#import "LYRUIMessageSerializer.h"
#import "LYRUIConfiguration+DependencyInjection.h"
#import <LayerKit/LayerKit.h>
#import "LYRUIMessageType.h"
#import "LYRMessage+LYRUIHelpers.h"
#import "LYRMessagePart+LYRUIHelpers.h"
#import "LYRUIMessageTypeSerializing.h"

@implementation LYRUIMessageSerializer
@synthesize layerConfiguration = _layerConfiguration;

- (instancetype)initWithConfiguration:(LYRUIConfiguration *)configuration {
    self = [super init];
    if (self) {
        self.layerConfiguration = configuration;
    }
    return self;
}

- (LYRUIMessageType *)typedMessageWithLayerMessage:(LYRMessage *)message {
    LYRMessagePart *rootPart = message.rootPart;
    id<LYRUIMessageTypeSerializing> serializer;
    if (rootPart != nil) {
        serializer = [self.layerConfiguration.injector serializerForMessagePartMIMEType:rootPart.contentType];
    } else {
        for (LYRMessagePart *part in message.parts) {
            serializer = [self.layerConfiguration.injector serializerForMessagePartMIMEType:part.contentType];
            if (serializer != nil) {
                rootPart = part;
                break;
            }
        }
    }
    LYRUIMessageType *messageType = [serializer typedMessageWithMessagePart:rootPart];
    if (!messageType) {
        messageType = [[LYRUIMessageType alloc] initWithAction:nil sender:message.sender sentAt:message.sentAt status:nil messagePart:rootPart];
    }
    return messageType;
}

- (LYRMessage *)layerMessageWithTypedMessage:(LYRUIMessageType *)messageType {
    id<LYRUIMessageTypeSerializing> serializer = [self.layerConfiguration.injector serializerForMessagePartMIMEType:messageType.MIMEType];
    if (serializer == nil) {
        return nil;
    }
    NSArray *messageParts = [serializer layerMessagePartsWithTypedMessage:messageType];
    LYRMessageOptions *messageOptions = [serializer messageOptionsForTypedMessage:messageType];
    NSError *error = nil;
    NSSet *parts = [NSSet setWithArray:messageParts];
    LYRMessage *message = [self.layerConfiguration.client newMessageWithParts:parts options:messageOptions error:&error];
    if (error) {
        NSLog(@"Failed to create message: %@", error);
        return nil;
    }
    return message;
}

@end
