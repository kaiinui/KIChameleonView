#import <UIKit/UIKit.h>

@interface KIChameleonView : UIView

typedef NS_ENUM(NSInteger, KIChameleonViewType) {
    KIChameleonViewTypeImage,
    KIChameleonViewTypeAniGif,
    KIChameleonViewTypeVideo
};

- (void)setURL:(NSURL *)URL;
- (void)setURL:(NSURL *)URL withType:(KIChameleonViewType)type;

@end
