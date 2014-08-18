#import "KIChameleonView.h"
#import <UIImageView+WebCache.h>
#import <VKVideoPlayer.h>
#import <FLAnimatedImage.h>
#import <FLAnimatedImageView.h>
#import <UIImage+WebP.h>

@interface KIChameleonView ()

@end

@implementation KIChameleonView

typedef NS_ENUM(NSInteger, KIChameleonViewType) {
    KIChameleonViewTypeImage,
    KIChameleonViewTypeAniGif,
    KIChameleonViewTypeVideo,
    KIChameleonViewTypeWebP
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
        case KIChameleonViewTypeWebP:
            [self setWebPImageViewWithURL:URL];
            break;
        default:
            NSLog(@"DEFAULT");
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
    player.delegate = self;
    VKVideoPlayerTrack *track = [[VKVideoPlayerTrack alloc] initWithStreamURL:URL];
    [player loadVideoWithTrack:track];
    [self addSubview:playerView];
}

- (void)setWebPImageViewWithURL:(NSURL *)URL {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    [self addSubview:imageView];
    NSData *data = [NSData dataWithContentsOfURL:URL];
    [imageView setImage:[UIImage sd_imageWithWebPData:data]];
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
             @"webp": @(KIChameleonViewTypeWebP),
             @"m3u8": @(KIChameleonViewTypeVideo)
             };
}

@end
