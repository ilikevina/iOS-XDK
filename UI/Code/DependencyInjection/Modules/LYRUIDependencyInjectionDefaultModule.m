//
//  LYRUIDependencyInjectionDefaultModule.m
//  Layer-XDK-UI-iOS
//
//  Created by Łukasz Przytuła on 15.12.2017.
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

#import "LYRUIDependencyInjectionDefaultModule.h"
#import "LYRUIConfiguration+DependencyInjection.h"
#import "LYRUIPresenceView.h"
#import "LYRUIPresenceViewDefaultTheme.h"
#import "LYRUIPresenceViewPresenter.h"
#import "LYRUIAvatarView.h"
#import "LYRUIAvatarViewDefaultTheme.h"
#import "LYRUIAvatarViewPresenter.h"
#import "LYRUIImageWithLettersView.h"
#import "LYRUIImageWithLettersViewPresenter.h"
#import "LYRUIBaseItemView.h"
#import "LYRUIBaseItemViewDefaultTheme.h"
#import "LYRUIBaseItemViewLayout.h"
#import "LYRUIConversationItemView.h"
#import "LYRUIConversationItemViewUnreadTheme.h"
#import "LYRUIConversationItemViewPresenter.h"
#import "LYRUIConversationItemAccessoryViewProviding.h"
#import "LYRUIConversationItemTitleFormatter.h"
#import "LYRUIConversationItemTimeFormatter.h"
#import "LYRUIMessageTimeDefaultFormatter.h"
#import "LYRUIConversationListView.h"
#import "LYRUIConversationListViewPresenter.h"
#import "LYRUIListCellPresenter.h"
#import "LYRUIListHeaderView.h"
#import "LYRUIListSupplementaryViewPresenter.h"
#import "LYRUIListLayout.h"
#import "LYRUIIdentityItemView.h"
#import "LYRUIIdentityItemViewPresenter.h"
#import "LYRUIIdentityItemAccessoryViewProviding.h"
#import "LYRUIIdentityNameFormatter.h"
#import "LYRUITimeAgoFormatter.h"
#import "LYRUIIdentityListView.h"
#import "LYRUIIdentityListViewPresenter.h"
#import "LYRUIImageFetcher.h"
#import "LYRUIImageFactory.h"
#import "LYRUIInitialsFormatter.h"
#import "LYRUIDataFactory.h"
#import "LYRUIDispatcher.h"
#import "NSCache+LYRUIImageCaching.h"
#import "LYRUIBundleProvider.h"
#import "LYRUIComposeBar.h"
#import "LYRUIComposeBarLayout.h"
#import "LYRUIComposeBarPresenter.h"
#import "LYRUIAvatarViewProvider.h"
#import "LYRUIMessageItemView.h"
#import "LYRUIMessageItemViewLayout.h"
#import "LYRUIMessageItemViewPresenter.h"
#import "LYRUIMessageItemAccessoryViewProviding.h"
#import "LYRUIMessageCollectionViewCell.h"
#import "LYRUIMessageCellPresenter.h"
#import "LYRUIMessageListMessageTimeView.h"
#import "LYRUIMessageListMessageTimeViewLayout.h"
#import "LYRUIMessageListMessageSenderView.h"
#import "LYRUIMessageListMessageSenderViewLayout.h"
#import "LYRUIMessageListTimeSupplementaryViewPresenter.h"
#import "LYRUIMessageListMessageStatusView.h"
#import "LYRUIMessageListMessageStatusViewLayout.h"
#import "LYRUIMessageListStatusSupplementaryViewPresenter.h"
#import "LYRUIListLoadingIndicatorView.h"
#import "LYRUIListLoadingIndicatorPresenter.h"
#import "LYRUIMessageListView.h"
#import "LYRUIMessageListLayout.h"
#import "LYRUIMessageListViewPresenter.h"
#import "LYRUIMessageListTimeFormatter.h"
#import "LYRUIConversationView.h"
#import "LYRUIConversationViewLayout.h"
#import "LYRUIPanelTypingIndicatorView.h"
#import "LYRUIPanelTypingIndicatorViewLayout.h"
#import "LYRUITypingIndicatorFooterPresenter.h"
#import "LYRUIBubbleTypingIndicatorCollectionViewCell.h"
#import "LYRUITypingIndicatorCellPresenter.h"
#import "LYRUIReusableViewsQueue.h"
#import "LYRUITextMessage.h"
#import "LYRUITextMessageSerializer.h"
#import "LYRUITextMessageContentViewPresenter.h"
#import "LYRUIStandardMessageContainerViewPresenter.h"
#import "LYRUIStandardMessageContainerView.h"
#import "LYRUIStandardMessageContainerViewLayout.h"
#import "LYRUIStandardMessageContainerViewDefaultTheme.h"
#import "LYRUIFileMessage.h"
#import "LYRUIFileMessageSerializer.h"
#import "LYRUIFileMessageContentViewPresenter.h"
#import "LYRUIMessageOpenFileActionHandler.h"
#import "LYRUILinkMessage.h"
#import "LYRUILinkMessageSerializer.h"
#import "LYRUILinkMessageContentViewPresenter.h"
#import "LYRUILinkMessageContainerViewPresenter.h"
#import "LYRUIMessageOpenURLActionHandler.h"
#import "LYRUIImageMessage.h"
#import "LYRUIImageMessageSerializer.h"
#import "LYRUIImageMessageContentViewPresenter.h"
#import "LYRUILocationMessage.h"
#import "LYRUILocationMessageSerializer.h"
#import "LYRUILocationMessageContentViewPresenter.h"
#import "LYRUIMessageOpenMapActionHandler.h"
#import "LYRUIStatusMessageCollectionViewCell.h"
#import "LYRUIStatusCellPresenter.h"
#import "LYRUIStatusMessage.h"
#import "LYRUIStatusMessageSerializer.h"
#import "LYRUIResponseMessage.h"
#import "LYRUIResponseMessageSerializer.h"
#import "LYRUIButtonsMessage.h"
#import "LYRUIButtonsMessageSerializer.h"
#import "LYRUIButtonsMessageCompositeViewPresenter.h"
#import "LYRUIChoiceMessage.h"
#import "LYRUIChoiceMessageSerializer.h"
#import "LYRUIChoiceMessageCompositeViewPresenter.h"
#import "LYRUIMessageChoiceSelectedActionHandler.h"
#import "LYRUIProductMessage.h"
#import "LYRUIProductMessageSerializer.h"
#import "LYRUIProductMessageCompositeViewPresenter.h"
#import "LYRUIReceiptMessage.h"
#import "LYRUIReceiptMessageSerializer.h"
#import "LYRUIReceiptMessageCompositeViewPresenter.h"
#import "LYRUICarouselMessage.h"
#import "LYRUICarouselMessageSerializer.h"
#import "LYRUICarouselMessageCompositeViewPresenter.h"
#import "LYRUICarouselMessageListView.h"
#import "LYRUICarouselMessageListLayout.h"
#import "LYRUICarouselMessageListViewPresenter.h"
#import "LYRUICarouselContentOffsetHandler.h"
#import "LYRUICarouselContentOffsetsCache.h"
#import "LYRUIMessageListViewPreviewingDelegate.h"
#import "LYRUISmallMessageItemContentPresentersProvider.h"
#import "LYRUIMessageItemContentPresentersProvider.h"
#import "LYRUILargeMessageItemContentPresentersProvider.h"
#import "LYRUIAudioMessage.h"
#import "LYRUIAudioMessageSerializer.h"
#import "LYRUIAudioMessageContainerView.h"
#import "LYRUIAudioContainerViewPresenter.h"
#import "LYRUIVideoMessage.h"
#import "LYRUIVideoMessageSerializer.h"
#import "LYRUIVideoMessageContainerView.h"
#import "LYRUIVideoContainerViewPresenter.h"
#import "LYRUIMediaMessageContentViewPresenter.h"
#import "LYRUIPlayableMediaContainerViewPresenter.h"
#import "LYRUIAudioMessageContainerViewLayout.h"
#import "LYRUIVideoMessageContainerViewLayout.h"
#import "LYRUIMediaHandler.h"
#import "LYRUIMediaPlaying.h"
#import "LYRUIMessageOpenMessageActionHandler.h"
#import "LYRUILargeAudioContainerViewPresenter.h"
#import "LYRUILargeVideoContainerViewPresenter.h"
#import "LYRUILargeVideoMessageContainerView.h"
#import "LYRUILargeAudioMessageContainerView.h"
#import "LYRUILargePlayableMediaMessageContainerViewLayout.h"
#import "LYRUILargeVideoMessageContainerViewLayout.h"
#import "LYRUILargeMediaMessageContentViewPresenter.h"
#import "LYRUILargeVideoMessageContentViewPresenter.h"
#import "LYRUILargeMessageContainerViewDefaultTheme.h"
#import "LYRUIFeedbackMessage.h"
#import "LYRUIFeedbackResponseMessage.h"
#import "LYRUIFeedbackMessagePresenter.h"
#import "LYRUIFeedbackResponseMessagePresenter.h"
#import "LYRUILargeFeedbackMessageContainerViewPresenter.h"
#import "LYRUILargeFeedbackResponseMessageContainerViewPresenter.h"
#import "LYRUIFeedbackMessageSerializer.h"
#import "LYRUIFeedbackMessageContainerView.h"

static NSString * const LYRUILegacyTextMessageMimeType = @"text/plain";
static NSString * const LYRUILegacyPDFFileMessageMimeType = @"application/pdf";
static NSString * const LYRUILegacyJPGImageMessageMimeType = @"image/jpg";
static NSString * const LYRUILegacyJPEGImageMessageMimeType = @"image/jpeg";
static NSString * const LYRUILegacyPNGImageMessageMimeType = @"image/png";
static NSString * const LYRUILegacyGIFImageMessageMimeType = @"image/gif";
static NSString * const LYRUILegacyLocationMessageMimeType = @"location/coordinate";

@interface LYRUIDependencyInjectionDefaultModule ()

@property (nonatomic, strong) id<LYRUIImageCaching> imagesCache;
@property (nonatomic, strong) id<LYRUIThumbnailsCaching> thumbnailsCache;
@property (nonatomic, strong) LYRUIBundleProvider *bundleProvider;
@property (nonatomic, strong) LYRUIReusableViewsQueue *reusableViewsQueue;
@property (nonatomic, strong) LYRUICarouselContentOffsetsCache *carouselContentOffsetsCache;

@end

@implementation LYRUIDependencyInjectionDefaultModule

- (instancetype)init {
    self = [super init];
    if (self) {
        self.imagesCache = [[NSCache<NSURL *, UIImage *> alloc] init];
        self.thumbnailsCache = [[NSCache<NSURL *, UIImage *> alloc] init];
        self.bundleProvider = [[LYRUIBundleProvider alloc] init];
        self.reusableViewsQueue = [[LYRUIReusableViewsQueue alloc] init];
        self.carouselContentOffsetsCache = [[LYRUICarouselContentOffsetsCache alloc] init];

        [self setupThemes];
        [self setupAlternativeThemes];
        [self setupPresenters];
        [self setupLayouts];
        [self setupProtocolImplementations];
        [self setupObjects];
        [self setupMessagePresenters];
        [self setupMessageContainerPresenters];
        [self setupMessageSerializers];
        [self setupActionHandlers];
    }
    return self;
}

#pragma mark - Setup

- (void)setupThemes {
    [self setThemeClass:[LYRUIPresenceViewDefaultTheme class] forViewClass:[LYRUIPresenceView class]];
    [self setThemeClass:[LYRUIAvatarViewDefaultTheme class] forViewClass:[LYRUIAvatarView class]];
    [self setThemeClass:[LYRUIBaseItemViewDefaultTheme class] forViewClass:[LYRUIConversationItemView class]];
    [self setThemeClass:[LYRUIBaseItemViewDefaultTheme class] forViewClass:[LYRUIIdentityItemView class]];
    [self setThemeClass:[LYRUIStandardMessageContainerViewDefaultTheme class] forViewClass:[LYRUIStandardMessageContainerView class]];
    [self setThemeClass:[LYRUIStandardMessageContainerViewDefaultTheme class] forViewClass:[LYRUIAudioMessageContainerView class]];
    [self setThemeClass:[LYRUIStandardMessageContainerViewDefaultTheme class] forViewClass:[LYRUIVideoMessageContainerView class]];
    [self setThemeClass:[LYRUILargeMessageContainerViewDefaultTheme class] forViewClass:[LYRUILargeAudioMessageContainerView class]];
    [self setThemeClass:[LYRUILargeMessageContainerViewDefaultTheme class] forViewClass:[LYRUILargeVideoMessageContainerView class]];
}

- (void)setupAlternativeThemes {
    [self setAlternativeThemeClass:[LYRUIConversationItemViewUnreadTheme class] forViewClass:[LYRUIConversationItemView class]];
}

- (void)setupPresenters {
    [self setPresenterClass:[LYRUIPresenceViewPresenter class] forViewClass:[LYRUIPresenceView class]];
    [self setPresenterClass:[LYRUIAvatarViewPresenter class] forViewClass:[LYRUIAvatarView class]];
    [self setPresenterClass:[LYRUIImageWithLettersViewPresenter class] forViewClass:[LYRUIImageWithLettersView class]];
    [self setPresenterClass:[LYRUIConversationItemViewPresenter class] forViewClass:[LYRUIConversationItemView class]];
    [self setPresenterClass:[LYRUIListCellPresenter class] forViewClass:[UICollectionViewCell class]];
    [self setPresenterProvider:^id (LYRUIConfiguration *configuration) {
        return [LYRUIListSupplementaryViewPresenter headerPresenter];
    } forViewClass:[LYRUIListHeaderView class]];
    [self setPresenterClass:[LYRUIConversationListViewPresenter class] forViewClass:[LYRUIConversationListView class]];
    [self setPresenterClass:[LYRUIIdentityItemViewPresenter class] forViewClass:[LYRUIIdentityItemView class]];
    [self setPresenterClass:[LYRUIIdentityListViewPresenter class] forViewClass:[LYRUIIdentityListView class]];
    [self setPresenterClass:[LYRUIComposeBarPresenter class] forViewClass:[LYRUIComposeBar class]];
    [self setPresenterClass:[LYRUIMessageItemViewPresenter class] forViewClass:[LYRUIMessageItemView class]];
    [self setPresenterClass:[LYRUIMessageListViewPresenter class] forViewClass:[LYRUIMessageListView class]];
    [self setPresenterClass:[LYRUICarouselMessageListViewPresenter class] forViewClass:[LYRUICarouselMessageListView class]];
}

- (void)setupLayouts {
    [self setLayoutClass:[LYRUIListLayout class] forViewClass:[LYRUIConversationListView class]];
    [self setLayoutClass:[LYRUIBaseItemViewLayout class] forViewClass:[LYRUIConversationItemView class]];
    [self setLayoutClass:[LYRUIListLayout class] forViewClass:[LYRUIIdentityListView class]];
    [self setLayoutClass:[LYRUIBaseItemViewLayout class] forViewClass:[LYRUIIdentityItemView class]];
    [self setLayoutClass:[LYRUIComposeBarLayout class] forViewClass:[LYRUIComposeBar class]];
    [self setLayoutClass:[LYRUIMessageItemViewLayout class] forViewClass:[LYRUIMessageItemView class]];
    [self setLayoutClass:[LYRUIMessageListMessageTimeViewLayout class] forViewClass:[LYRUIMessageListMessageTimeView class]];
    [self setLayoutClass:[LYRUIMessageListMessageSenderViewLayout class] forViewClass:[LYRUIMessageListMessageSenderView class]];
    [self setLayoutClass:[LYRUIMessageListMessageStatusViewLayout class] forViewClass:[LYRUIMessageListMessageStatusView class]];
    [self setLayoutClass:[LYRUIMessageListLayout class] forViewClass:[LYRUIMessageListView class]];
    [self setLayoutClass:[LYRUIConversationViewLayout class] forViewClass:[LYRUIConversationView class]];
    [self setLayoutClass:[LYRUIPanelTypingIndicatorViewLayout class] forViewClass:[LYRUIPanelTypingIndicatorView class]];
    [self setLayoutClass:[LYRUIStandardMessageContainerViewLayout class] forViewClass:[LYRUIStandardMessageContainerView class]];
    [self setLayoutClass:[LYRUIAudioMessageContainerViewLayout class] forViewClass:[LYRUIAudioMessageContainerView class]];
    [self setLayoutClass:[LYRUIVideoMessageContainerViewLayout class] forViewClass:[LYRUIVideoMessageContainerView class]];
    [self setLayoutClass:[LYRUICarouselMessageListLayout class] forViewClass:[LYRUICarouselMessageListView class]];
    [self setLayoutClass:[LYRUILargePlayableMediaMessageContainerViewLayout class] forViewClass:[LYRUILargeAudioMessageContainerView class]];
    [self setLayoutClass:[LYRUILargeVideoMessageContainerViewLayout class] forViewClass:[LYRUILargeVideoMessageContainerView class]];
}

- (void)setupProtocolImplementations {
    [self setImplementationClass:[LYRUIAvatarViewProvider class]
                     forProtocol:@protocol(LYRUIConversationItemAccessoryViewProviding)];
    [self setImplementationClass:[LYRUIConversationItemTitleFormatter class]
                     forProtocol:@protocol(LYRUIConversationItemTitleFormatting)];
    [self setImplementationClass:[LYRUIMessageTimeDefaultFormatter class]
                     forProtocol:@protocol(LYRUITimeFormatting)];
    [self setImplementationClass:[LYRUIAvatarViewProvider class]
                     forProtocol:@protocol(LYRUIIdentityItemAccessoryViewProviding)];
    [self setImplementationClass:[LYRUIIdentityNameFormatter class]
                     forProtocol:@protocol(LYRUIIdentityNameFormatting)];
    [self setImplementationClass:[LYRUIImageFetcher class]
                     forProtocol:@protocol(LYRUIImageFetching)];
    [self setImplementationClass:[LYRUIImageFactory class]
                     forProtocol:@protocol(LYRUIImageCreating)];
    [self setImplementationClass:[LYRUIInitialsFormatter class]
                     forProtocol:@protocol(LYRUIInitialsFormatting)];
    [self setImplementationClass:[LYRUIDataFactory class]
                     forProtocol:@protocol(LYRUIDataCreating)];
    [self setImplementationClass:[LYRUIDispatcher class]
                     forProtocol:@protocol(LYRUIDispatching)];
    [self setupImagesCaches];
    [self setImplementationClass:[LYRUIAvatarViewProvider class]
                     forProtocol:@protocol(LYRUIMessageItemAccessoryViewProviding)];
    [self setImplementationClass:[LYRUICarouselContentOffsetHandler class]
                     forProtocol:@protocol(LYRUICarouselContentOffsetHandling)];
    [self setImplementationClass:[LYRUIMessageListViewPreviewingDelegate class]
                     forProtocol:@protocol(UIViewControllerPreviewingDelegate)];
    [self setImplementationClass:[LYRUIConversationItemTimeFormatter class]
                     forProtocol:@protocol(LYRUITimeFormatting)
                     usedInClass:[LYRUIConversationItemViewPresenter class]];
    [self setImplementationClass:[LYRUITimeAgoFormatter class]
                     forProtocol:@protocol(LYRUITimeFormatting)
                     usedInClass:[LYRUIIdentityItemViewPresenter class]];
    [self setImplementationClass:[LYRUIMessageListTimeFormatter class]
                     forProtocol:@protocol(LYRUITimeFormatting)
                     usedInClass:[LYRUIMessageListTimeSupplementaryViewPresenter class]];
}

- (void)setupImagesCaches {
    __weak __typeof(self) weakSelf = self;
    [self setImplementationProvider:^id (LYRUIConfiguration *configuration) {
        return weakSelf.imagesCache;
    } forProtocol:@protocol(LYRUIImageCaching) usedInClass:nil];
    
    [self setImplementationProvider:^id (LYRUIConfiguration *configuration) {
        return weakSelf.thumbnailsCache;
    } forProtocol:@protocol(LYRUIThumbnailsCaching) usedInClass:nil];

    [self setImplementationProvider:^id (LYRUIConfiguration *configuration) {
        static dispatch_once_t onceToken;
        static LYRUIMediaHandler *mediaPlayer;
        dispatch_once(&onceToken, ^{
            mediaPlayer = [[LYRUIMediaHandler alloc] initWithConfiguration:configuration];
        });
        return mediaPlayer;
    } forProtocol:@protocol(LYRUIMediaPlaying) usedInClass:nil];
}

- (void)setupObjects {
    [self setProvider:^id (LYRUIConfiguration *configuration) {
        return [NSCalendar currentCalendar];
    } forObjectType:[NSCalendar class]];
    
    [self setProvider:^id (LYRUIConfiguration *configuration) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.locale = [configuration.injector objectOfType:[NSLocale class]];
        dateFormatter.timeZone = [configuration.injector objectOfType:[NSTimeZone class]];
        return dateFormatter;
    } forObjectType:[NSDateFormatter class]];
    
    [self setProvider:^id (LYRUIConfiguration *configuration) {
        return [NSLocale currentLocale];
    } forObjectType:[NSLocale class]];
    
    [self setProvider:^id (LYRUIConfiguration *configuration) {
        return [NSTimeZone systemTimeZone];
    } forObjectType:[NSTimeZone class]];
    
    [self setProvider:^id (LYRUIConfiguration *configuration) {
        return [NSURLSession sharedSession];
    } forObjectType:[NSURLSession class]];
    
    __weak __typeof(self) weakSelf = self;
    [self setProvider:^id (LYRUIConfiguration *configuration) {
        return [weakSelf.bundleProvider bundleWithLayerAssets];
    } forObjectType:[NSBundle class]];
    
    [self setProvider:^id (LYRUIConfiguration *configuration) {
        return [NSNotificationCenter defaultCenter];
    } forObjectType:[NSNotificationCenter class]];
    
    [self setProvider:^id (LYRUIConfiguration *configuration) {
        return weakSelf.reusableViewsQueue;
    } forObjectType:[LYRUIReusableViewsQueue class]];
    
    [self setProvider:^id (LYRUIConfiguration *configuration) {
        return [LYRUIListLoadingIndicatorPresenter loadingOldItemsIndicatorPresenter];
    } forObjectType:[LYRUIListLoadingIndicatorPresenter class]];
    
    [self setProvider:^id (LYRUIConfiguration *configuration) {
        return weakSelf.carouselContentOffsetsCache;
    } forObjectType:[LYRUICarouselContentOffsetsCache class]];
}

- (void)setupMessagePresenters {
    // Medium size messages
    [self setMessagePresenterClass:[LYRUITextMessageContentViewPresenter class] forMessageClass:[LYRUITextMessage class] sizeVariant:LYRUIMessageSizeVariantMedium];
    [self setMessagePresenterClass:[LYRUIFileMessageContentViewPresenter class] forMessageClass:[LYRUIFileMessage class] sizeVariant:LYRUIMessageSizeVariantMedium];
    [self setMessagePresenterClass:[LYRUILinkMessageContentViewPresenter class] forMessageClass:[LYRUILinkMessage class] sizeVariant:LYRUIMessageSizeVariantMedium];
    [self setMessagePresenterClass:[LYRUIImageMessageContentViewPresenter class] forMessageClass:[LYRUIImageMessage class] sizeVariant:LYRUIMessageSizeVariantMedium];
    [self setMessagePresenterClass:[LYRUILocationMessageContentViewPresenter class] forMessageClass:[LYRUILocationMessage class] sizeVariant:LYRUIMessageSizeVariantMedium];
    [self setMessagePresenterClass:[LYRUIButtonsMessageCompositeViewPresenter class] forMessageClass:[LYRUIButtonsMessage class] sizeVariant:LYRUIMessageSizeVariantMedium];
    [self setMessagePresenterClass:[LYRUIChoiceMessageCompositeViewPresenter class] forMessageClass:[LYRUIChoiceMessage class] sizeVariant:LYRUIMessageSizeVariantMedium];
    [self setMessagePresenterClass:[LYRUIProductMessageCompositeViewPresenter class] forMessageClass:[LYRUIProductMessage class] sizeVariant:LYRUIMessageSizeVariantMedium];
    [self setMessagePresenterClass:[LYRUIReceiptMessageCompositeViewPresenter class] forMessageClass:[LYRUIReceiptMessage class] sizeVariant:LYRUIMessageSizeVariantMedium];
    [self setMessagePresenterClass:[LYRUICarouselMessageCompositeViewPresenter class] forMessageClass:[LYRUICarouselMessage class] sizeVariant:LYRUIMessageSizeVariantMedium];
    [self setMessagePresenterClass:[LYRUIFeedbackMessagePresenter class] forMessageClass:[LYRUIFeedbackMessage class] sizeVariant:LYRUIMessageSizeVariantMedium];
    [self setMessagePresenterClass:[LYRUIFeedbackResponseMessagePresenter class] forMessageClass:[LYRUIFeedbackResponseMessage class] sizeVariant:LYRUIMessageSizeVariantMedium];

    // Large size messages
    [self setMessagePresenterClass:[LYRUIMediaMessageContentViewPresenter class] forMessageClass:[LYRUIAudioMessage class] sizeVariant:LYRUIMessageSizeVariantMedium];
    [self setMessagePresenterClass:[LYRUIMediaMessageContentViewPresenter class] forMessageClass:[LYRUIVideoMessage class] sizeVariant:LYRUIMessageSizeVariantMedium];
    [self setMessagePresenterClass:[LYRUILargeMediaMessageContentViewPresenter class] forMessageClass:[LYRUIAudioMessage class] sizeVariant:LYRUIMessageSizeVariantLarge];
    [self setMessagePresenterClass:[LYRUILargeVideoMessageContentViewPresenter class] forMessageClass:[LYRUIVideoMessage class] sizeVariant:LYRUIMessageSizeVariantLarge];
    [self setMessagePresenterClass:[LYRUILargeFeedbackMessageContainerViewPresenter class] forMessageClass:[LYRUIFeedbackMessage class] sizeVariant:LYRUIMessageSizeVariantLarge];
    [self setMessagePresenterClass:[LYRUILargeFeedbackResponseMessageContainerViewPresenter class] forMessageClass:[LYRUIFeedbackResponseMessage class] sizeVariant:LYRUIMessageSizeVariantLarge];
}

- (void)setupMessageContainerPresenters {
    // Medium size messages
    [self setMessageContainerPresenterClass:[LYRUIStandardMessageContainerViewPresenter class] forMessageClass:[LYRUITextMessage class] sizeVariant:LYRUIMessageSizeVariantMedium];
    [self setMessageContainerPresenterClass:[LYRUIStandardMessageContainerViewPresenter class] forMessageClass:[LYRUIFileMessage class] sizeVariant:LYRUIMessageSizeVariantMedium];
    [self setMessageContainerPresenterClass:[LYRUILinkMessageContainerViewPresenter class] forMessageClass:[LYRUILinkMessage class] sizeVariant:LYRUIMessageSizeVariantMedium];
    [self setMessageContainerPresenterClass:[LYRUIStandardMessageContainerViewPresenter class] forMessageClass:[LYRUIImageMessage class] sizeVariant:LYRUIMessageSizeVariantMedium];
    [self setMessageContainerPresenterClass:[LYRUIStandardMessageContainerViewPresenter class] forMessageClass:[LYRUILocationMessage class] sizeVariant:LYRUIMessageSizeVariantMedium];
    [self setMessageContainerPresenterClass:[LYRUIAudioContainerViewPresenter class] forMessageClass:[LYRUIAudioMessage class] sizeVariant:LYRUIMessageSizeVariantMedium];
    [self setMessageContainerPresenterClass:[LYRUIVideoContainerViewPresenter class] forMessageClass:[LYRUIVideoMessage class] sizeVariant:LYRUIMessageSizeVariantMedium];

    // Large size messages
    [self setMessageContainerPresenterClass:[LYRUILargeVideoContainerViewPresenter class] forMessageClass:[LYRUIVideoMessage class] sizeVariant:LYRUIMessageSizeVariantLarge];
    [self setMessageContainerPresenterClass:[LYRUILargeAudioContainerViewPresenter class] forMessageClass:[LYRUIAudioMessage class] sizeVariant:LYRUIMessageSizeVariantLarge];
}

- (void)setupMessageSerializers {
    [self setMessageSerializerClass:[LYRUITextMessageSerializer class] forMIMEType:LYRUITextMessage.MIMEType];
    [self setMessageSerializerClass:[LYRUITextMessageSerializer class] forMIMEType:LYRUILegacyTextMessageMimeType];
    [self setMessageSerializerClass:[LYRUIFileMessageSerializer class] forMIMEType:LYRUIFileMessage.MIMEType];
    [self setMessageSerializerClass:[LYRUIFileMessageSerializer class] forMIMEType:LYRUILegacyPDFFileMessageMimeType];
    [self setMessageSerializerClass:[LYRUILinkMessageSerializer class] forMIMEType:LYRUILinkMessage.MIMEType];
    [self setMessageSerializerClass:[LYRUIImageMessageSerializer class] forMIMEType:LYRUIImageMessage.MIMEType];
    [self setMessageSerializerClass:[LYRUIImageMessageSerializer class] forMIMEType:LYRUILegacyJPGImageMessageMimeType];
    [self setMessageSerializerClass:[LYRUIImageMessageSerializer class] forMIMEType:LYRUILegacyJPEGImageMessageMimeType];
    [self setMessageSerializerClass:[LYRUIImageMessageSerializer class] forMIMEType:LYRUILegacyPNGImageMessageMimeType];
    [self setMessageSerializerClass:[LYRUIImageMessageSerializer class] forMIMEType:LYRUILegacyGIFImageMessageMimeType];
    [self setMessageSerializerClass:[LYRUILocationMessageSerializer class] forMIMEType:LYRUILocationMessage.MIMEType];
    [self setMessageSerializerClass:[LYRUILocationMessageSerializer class] forMIMEType:LYRUILegacyLocationMessageMimeType];
    [self setMessageSerializerClass:[LYRUIStatusMessageSerializer class] forMIMEType:LYRUIStatusMessage.MIMEType];
    [self setMessageSerializerClass:[LYRUIResponseMessageSerializer class] forMIMEType:LYRUIResponseMessage.MIMEType];
    [self setMessageSerializerClass:[LYRUIButtonsMessageSerializer class] forMIMEType:LYRUIButtonsMessage.MIMEType];
    [self setMessageSerializerClass:[LYRUIChoiceMessageSerializer class] forMIMEType:LYRUIChoiceMessage.MIMEType];
    [self setMessageSerializerClass:[LYRUIProductMessageSerializer class] forMIMEType:LYRUIProductMessage.MIMEType];
    [self setMessageSerializerClass:[LYRUIReceiptMessageSerializer class] forMIMEType:LYRUIReceiptMessage.MIMEType];
    [self setMessageSerializerClass:[LYRUICarouselMessageSerializer class] forMIMEType:LYRUICarouselMessage.MIMEType];
    [self setMessageSerializerClass:[LYRUIAudioMessageSerializer class] forMIMEType:LYRUIAudioMessage.MIMEType];
    [self setMessageSerializerClass:[LYRUIVideoMessageSerializer class] forMIMEType:LYRUIVideoMessage.MIMEType];
    [self setMessageSerializerClass:[LYRUIFeedbackMessageSerializer class] forMIMEType:LYRUIFeedbackMessage.MIMEType];
    [self setMessageSerializerClass:[LYRUIFeedbackMessageSerializer class] forMIMEType:LYRUIFeedbackResponseMessage.MIMEType];
}

- (void)setupActionHandlers {
    [self setActionHandlerClass:[LYRUIMessageOpenFileActionHandler class] forEvent:@"open-file"];
    [self setActionHandlerClass:[LYRUIMessageOpenURLActionHandler class] forEvent:@"open-url"];
    [self setActionHandlerClass:[LYRUIMessageOpenMapActionHandler class] forEvent:@"open-map"];
    [self setActionHandlerClass:[LYRUIMessageChoiceSelectedActionHandler class] forEvent:@"layer-choice-select"];
    [self setActionHandlerClass:[LYRUIMessageChoiceSelectedActionHandler class] forEvent:@"layer-send-feedback"];
    [self setActionHandlerClass:[LYRUIMessageOpenMessageActionHandler class] forEvent:@"layer-open-expanded-view"];
}

@end
