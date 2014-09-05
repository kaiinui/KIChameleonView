#import <UIKit/UIKit.h>

@interface KIChameleonView : UIView

typedef NS_ENUM(NSInteger, KIChameleonViewType) {
    KIChameleonViewTypeImage,
    KIChameleonViewTypeAniGif,
    KIChameleonViewTypeVideo,
    KIChameleonViewTypeAsset // Keep in mind accessing the AssetsLibrary always occur asking the "Access your Photos" permission.
};

// You can pass
// Normal Image with URL: http://example.com/example.jpg
// Animation GIF with URL: http://example.cim/animation.gif
// Movie with URL: http://example.com/example.m3u8
// AssetLibrary Image with Asset URL: assets-library://asset/asset.JPG?id=C3EB0F3D-6B13-463D-83B3-B2B42A6C47CF&ext=JPG
- (void)setImageWithURL:(NSURL *)URL;
- (void)setImageWithURL:(NSURL *)URL withType:(KIChameleonViewType)type;

- (void)setURL:(NSURL *)URL __deprecated;
- (void)setURL:(NSURL *)URL withType:(KIChameleonViewType)type __deprecated;

@end
