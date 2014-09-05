#import "KIChameleonView.h"
#import <UIImageView+WebCache.h>
#import <VKVideoPlayer.h>
#import <FLAnimatedImage.h>
#import <FLAnimatedImageView.h>
#import <AssetsLibrary/AssetsLibrary.h>

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

- (void)setImageWithURL:(NSURL *)URL {
    [self setImageWithURL:URL withType:[self typeForURL:URL]];
}

- (void)setImageWithURL:(NSURL *)URL withType:(KIChameleonViewType)type {
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
        case KIChameleonViewTypeAsset:
            [self setAssetImageViewWithURL:URL];
            break;
        default:
            NSLog(@"DEFAULT"); // TODO Show "Unknown Extension! Error."
            break;
    }
}

- (void)setURL:(NSURL *)URL {
    [self setImageWithURL:URL];
}

- (void)setURL:(NSURL *)URL withType:(KIChameleonViewType)type {
    [self setImageWithURL:URL withType:type];
}

# pragma mark - Private Methods

- (void)setImageViewWithURL:(NSURL *)URL {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    [self addSubview:imageView];
    [imageView setContentMode:UIViewContentModeScaleAspectFit];
    [imageView sd_setImageWithURL:URL];
}

- (void)setAnimationGIFViewWithURL:(NSURL *)URL {
    FLAnimatedImage *image = [[FLAnimatedImage alloc] initWithAnimatedGIFData:[NSData dataWithContentsOfURL:URL]];
    FLAnimatedImageView *imageView = [[FLAnimatedImageView alloc] initWithFrame:self.bounds];
    [self addSubview:imageView];
    imageView.animatedImage = image;
    [imageView setContentMode:UIViewContentModeScaleAspectFit];
}

- (void)setVideoPlayerViewWithURL:(NSURL *)URL {
    VKVideoPlayerView *playerView = [[VKVideoPlayerView alloc] initWithFrame:self.bounds];
    VKVideoPlayer *player = [[VKVideoPlayer alloc] initWithVideoPlayerView:playerView];
    VKVideoPlayerTrack *track = [[VKVideoPlayerTrack alloc] initWithStreamURL:URL];
    [player loadVideoWithTrack:track];
    [self addSubview:playerView];
}

- (void)setAssetImageViewWithURL:(NSURL *)URL {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    [imageView setContentMode:UIViewContentModeScaleAspectFit];
    [self addSubview:imageView];
    
    ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    [library assetForURL:URL resultBlock:^(ALAsset *asset) {
        CGImageRef imageRef = [[asset defaultRepresentation] fullScreenImage];
        UIImage *image = [UIImage imageWithCGImage:imageRef];
        imageView.image = image;
    } failureBlock:^(NSError *error) {
        NSLog(@"Could not find asset %@.", URL);
    }];
}

- (KIChameleonViewType)typeForURL:(NSURL *)URL {
    NSString *scheme = [URL scheme];
    if ([scheme isEqualToString:@"assets-library"]) {return KIChameleonViewTypeAsset;}
    NSString *extension = [[URL path] pathExtension];
    return [self typeForExtension:extension];
}

- (KIChameleonViewType)typeForExtension:(NSString *)extension {
    return [[[self class] extensionToViewMapping][extension] integerValue];
}

+ (NSDictionary *)extensionToViewMapping {
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
