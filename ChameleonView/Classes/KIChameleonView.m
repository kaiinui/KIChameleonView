#import "KIChameleonView.h"
#import <UIImageView+WebCache.h>
#import <VKVideoPlayer.h>
#import <FLAnimatedImage.h>
#import <FLAnimatedImageView.h>

@interface KIChameleonView ()

@end

@implementation KIChameleonView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setURL:(NSURL *)URL {
    [self setURL:URL withType:[self typeForURL:URL]];
}

- (void)setURL:(NSURL *)URL withType:(KIChameleonViewType)type {
    switch (type) {
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
            NSLog(@"DEFAULT"); // TODO Show "Unknown Extension! Error."
            break;
    }
}

# pragma mark - Private Methods

- (void)setImageViewWithURL:(NSURL *)URL {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    [self addSubview:imageView];
    [imageView sd_setImageWithURL:URL];
}

- (void)setAnimationGIFViewWithURL:(NSURL *)URL {
    FLAnimatedImage *image = [[FLAnimatedImage alloc] initWithAnimatedGIFData:[NSData dataWithContentsOfURL:URL]];
    FLAnimatedImageView *imageView = [[FLAnimatedImageView alloc] initWithFrame:self.bounds];
    [self addSubview:imageView];
    imageView.animatedImage = image;
}

- (void)setVideoPlayerViewWithURL:(NSURL *)URL {
    VKVideoPlayerView *playerView = [[VKVideoPlayerView alloc] initWithFrame:self.bounds];
    VKVideoPlayer *player = [[VKVideoPlayer alloc] initWithVideoPlayerView:playerView];
    VKVideoPlayerTrack *track = [[VKVideoPlayerTrack alloc] initWithStreamURL:URL];
    [player loadVideoWithTrack:track];
    [self addSubview:playerView];
}

- (KIChameleonViewType)typeForURL:(NSURL *)URL {
    NSString *extension = [[URL path] pathExtension];
    return [self typeForExtension:extension];
}

- (KIChameleonViewType)typeForExtension:(NSString *)extension {
    return [[self extensionToViewMapping][extension] integerValue];
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

@end
