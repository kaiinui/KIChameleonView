//
//  KIChameleonView.m
//  ChameleonView
//
//  Created by kaiinui on 2014/08/18.
//  Copyright (c) 2014年 kaiinui. All rights reserved.
//

#import "KIChameleonView.h"


@interface KIChameleonView ()

@property (nonatomic, strong) NSURL *url;

@end

@implementation KIChameleonView

typedef NS_ENUM(NSInteger, KIChameleonViewType) {
    KIChameleonViewTypeImage,
    KIChameleonViewTypeAniGif,
    KIChameleonViewTypeVideo
};

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setURL:(NSURL *)URL {
    switch ([self typeForURL:URL]) {
        case KIChameleonViewTypeImage:
            [self setImageViewWithURL:URL];
            break;
        case KIChameleonViewTypeAniGif:
            [self setAnimationGIFViewWithURL:URL];
            break;
        case KIChameleonViewTypeVideo:
            [self setVideoPlayerViewWithURL:URL];
            break;
        default:
            break;
    }
}

# pragma mark - Private Methods

- (void)setImageViewWithURL:(NSURL *)URL {
    // [TODO]
}

- (void)setAnimationGIFViewWithURL:(NSURL *)URL {
    // [TODO]
}

- (void)setVideoPlayerViewWithURL:(NSURL *)URL {
    // [TODO]
}

- (KIChameleonViewType)typeForURL:(NSURL *)URL {
    NSString *extension = [[URL path] pathExtension];
    return [self typeForExtension:extension];
}

- (KIChameleonViewType)typeForExtension:(NSString *)extension {
    return [self extensionToViewMapping][extension];
}

- (NSDictionary *)extensionToViewMapping {
    return @{
             @"gif": @(KIChameleonViewTypeAniGif),
             @"jpg": @(KIChameleonViewTypeImage),
             @"jpeg": @(KIChameleonViewTypeImage),
             @"bmp": @(KIChameleonViewTypeImage),
             @"png": @(KIChameleonViewTypeImage),
             @"webp": @(KIChameleonViewTypeImage),
             @"m3u8": @(KIChameleonViewTypeVideo)
             };
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
