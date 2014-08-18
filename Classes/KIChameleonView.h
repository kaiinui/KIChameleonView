#import <UIKit/UIKit.h>
#import <VKVideoPlayer.h>

@interface KIChameleonView : UIView <VKVideoPlayerDelegate>

- (void)setURL:(NSURL *)URL;

@end
