#import <UIKit/UIKit.h>

@interface KIChameleonView : UIView

typedef NS_ENUM(NSInteger, KIChameleonViewType) {
    KIChameleonViewTypeImage,
    KIChameleonViewTypeAniGif,
    KIChameleonViewTypeVideo
};

- (void)setImageWithURL:(NSURL *)URL;
- (void)setImageWithURL:(NSURL *)URL withType:(KIChameleonViewType)type;

- (void)setURL:(NSURL *)URL __deprecated;
- (void)setURL:(NSURL *)URL withType:(KIChameleonViewType)type __deprecated;

@end
