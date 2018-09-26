//
//  LYRUICarouselMessageListView.m
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

#import "LYRUICarouselMessageListView.h"
#import "LYRUICarouselMessageListLayout.h"
#import "LYRUICarouselItemCellPresenter.h"
#import "LYRUIListDataSource.h"
#import "LYRUICarouselListDelegate.h"
#import "LYRUICarouselScrolledAnalyticsEvent+Private.h"

@implementation LYRUICarouselMessageListView

- (void)lyr_prepareForReuse {
    [self.contentOffsetHandler storeContentOffsetFromCarousel:self];
}

- (void)listViewDidScroll:(CGFloat)scrollPosition {
    if (self.message.messagePart.message != nil) {
        LYRUICarouselScrolledAnalyticsEvent *event = [LYRUICarouselScrolledAnalyticsEvent carouselScrolledAnalyticsEventWithMessage:self.message.messagePart.message position:scrollPosition];
        [self.layerConfiguration.client postAnalyticsEvent:event];
    }
}

@end
