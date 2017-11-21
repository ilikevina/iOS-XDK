#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import <OCMockito/OCMockito.h>
#import <OCHamcrest/OCHamcrest.h>
#import <Atlas/LYRUIConversationItemViewConfiguration.h>
#import <Atlas/LYRUIConversationItemView.h>
#import <Atlas/LYRUIMessageTimeDefaultFormatter.h>
#import <Atlas/LYRUIMessageTextDefaultFormatter.h>
#import <Atlas/LYRUIConversationItemTitleFormatter.h>
#import <Atlas/LYRUIConversationItemAccessoryViewProviding.h>
#import <LayerKit/LayerKit.h>

SpecBegin(LYRUIConversationItemViewConfiguration)

describe(@"LYRUIConversationItemViewConfiguration", ^{
    __block LYRUIConversationItemViewConfiguration *viewConfiguration;
    __block id<LYRUIConversationItemAccessoryViewProviding> accessoryViewProviderMock;
    __block id<LYRUIConversationItemTitleFormatting> titleFormatterMock;
    __block id<LYRUIMessageTextFormatting> lastMessageFormatterMock;
    __block id<LYRUITimeFormatting> messageTimeFormatterMock;
    
    beforeEach(^{
        accessoryViewProviderMock = mockProtocol(@protocol(LYRUIConversationItemAccessoryViewProviding));
        titleFormatterMock = mockProtocol(@protocol(LYRUIConversationItemTitleFormatting));
        lastMessageFormatterMock = mockProtocol(@protocol(LYRUIMessageTextFormatting));
        messageTimeFormatterMock = mockProtocol(@protocol(LYRUITimeFormatting));
        
        viewConfiguration = [[LYRUIConversationItemViewConfiguration alloc] initWithAccessoryViewProvider:accessoryViewProviderMock
                                                                                     titleFormatter:titleFormatterMock
                                                                               lastMessageFormatter:lastMessageFormatterMock
                                                                                      messageTimeFormatter:messageTimeFormatterMock];
    });
    
    afterEach(^{
        viewConfiguration = nil;
    });
    
    describe(@"after initialization with convenience initializer", ^{
        beforeEach(^{
            viewConfiguration = [[LYRUIConversationItemViewConfiguration alloc] init];
        });
        
        it(@"should have default title formatter set", ^{
            expect(viewConfiguration.titleFormatter).to.beAKindOf([LYRUIConversationItemTitleFormatter class]);
        });
        it(@"should have default message time formatter set", ^{
            expect(viewConfiguration.messageTimeFormatter).to.beAKindOf([LYRUIMessageTimeDefaultFormatter class]);
        });
    });
    
    describe(@"setupConversationItemView:withConversation:", ^{
        __block LYRUIConversationItemView *view;
        __block LYRConversation *conversationMock;
        __block UIView *accessoryView;
        
        beforeEach(^{
            view = [[LYRUIConversationItemView alloc] init];
            conversationMock = mock([LYRConversation class]);
        });
        
        context(@"with nil 'view' argument", ^{
            it(@"should throw a NSInvalidArgumentException with proper reason", ^{
                void(^callWithNil)() = ^{
                    view = nil;
                    [viewConfiguration setupConversationItemView:view
                                             withConversation:conversationMock];
                };
                NSString *exceptionReason = @"Cannot setup Conversation Item View with nil `view` argument.";
                expect(callWithNil).to.raiseWithReason(NSInvalidArgumentException, exceptionReason);
            });
        });
        
        context(@"with nil 'conversation' argument", ^{
            it(@"should throw a NSInvalidArgumentException with proper reason", ^{
                void(^callWithNil)() = ^{
                    conversationMock = nil;
                    [viewConfiguration setupConversationItemView:view
                                             withConversation:conversationMock];
                };
                NSString *exceptionReason = @"Cannot setup Conversation Item View with nil `conversation` argument.";
                expect(callWithNil).to.raiseWithReason(NSInvalidArgumentException, exceptionReason);
            });
        });
        
        context(@"with both arguments passed", ^{
            beforeEach(^{
                LYRMessage *lastMessageMock = mock([LYRMessage class]);
                [given(conversationMock.lastMessage) willReturn:lastMessageMock];
                NSDate *lastMessageTimeMock = mock([NSDate class]);
                [given(lastMessageMock.sentAt) willReturn:lastMessageTimeMock];
                accessoryView = [[UIView alloc] init];
                
                [given([accessoryViewProviderMock accessoryViewForConversation:conversationMock]) willReturn:accessoryView];
                [given([titleFormatterMock titleForConversation:conversationMock]) willReturn:@"test title"];
                [given([lastMessageFormatterMock stringForMessage:lastMessageMock]) willReturn:@"test last message"];
                [given([messageTimeFormatterMock stringForTime:lastMessageTimeMock
                                               withCurrentTime:anything()]) willReturn:@"test time description"];
                
                [viewConfiguration setupConversationItemView:view
                                         withConversation:conversationMock];
            });
            
            it(@"should set the text of titleLabel", ^{
                expect(view.titleLabel.text).to.equal(@"test title");
            });
            it(@"should set the text of messageLabel", ^{
                expect(view.subtitleLabel.text).to.equal(@"test last message");
            });
            it(@"should set the text of timeLabel", ^{
                expect(view.detailLabel.text).to.equal(@"test time description");
            });
            it(@"should set the accessory view", ^{
                expect(view.accessoryView).to.equal(accessoryView);
            });
            it(@"should add the accessory view as a subview of conversation item view", ^{
                expect(accessoryView.superview).to.equal(view.accessoryViewContainer);
            });
        });
    });
    
    describe(@"currentUser", ^{
        __block LYRIdentity *currentUserMock;
        
        context(@"setter", ^{
            beforeEach(^{
                currentUserMock = mock([LYRIdentity class]);
                viewConfiguration.currentUser = currentUserMock;
            });
            
            it(@"should update participant filtering block on accessory view provider", ^{
                [verify(accessoryViewProviderMock) setParticipantsFilter:anything()];
            });
            it(@"should update participant filtering block on title formatter", ^{
                [verify(titleFormatterMock) setParticipantsFilter:anything()];
            });
        });
    });
});

SpecEnd