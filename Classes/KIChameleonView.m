#import "KIChameleonView.h"
#import <UIImageView+WebCache.h>
#import <VKVideoPlayer.h>
#import <FLAnimatedImage.h>
#import <FLAnimatedImageView.h>

@interface KIChameleonView ()

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
            NSLog(@"DEFAULT");
            break;
    }
}

# pragma mark - Private Methods

- (void)setImageViewWithURL:(NSURL *)URL {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.frame];
    [self addSubview:imageView];
    [imageView sd_setImageWithURL:URL];
}

- (void)setAnimationGIFViewWithURL:(NSURL *)URL {
    FLAnimatedImage *image = [[FLAnimatedImage alloc] initWithAnimatedGIFData:[NSData dataWithContentsOfURL:URL]];
    FLAnimatedImageView *imageView = [[FLAnimatedImageView alloc] initWithFrame:self.frame];
    [self addSubview:imageView];
    imageView.animatedImage = image;
}

- (void)setVideoPlayerViewWithURL:(NSURL *)URL {
    // [TODO]
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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
