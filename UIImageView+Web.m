//
//  UIImageView+Web.m
//  tio-chat-ios
//
//  Created by 刘宇 on 2020/1/9.
//  Copyright © 2020 刘宇. All rights reserved.
//

#import "UIImageView+Web.h"
#import "UIImage+TColor.h"
#import "UIImageView+WebCache.h"
#import "SDImageCache.h"

@implementation UIImageView (Web)


- (void)tio_imageUrl:(NSString *)urlStr placeHolderImageName:(NSString *)placeHolderStr radius:(CGFloat)radius {
    NSURL *url;

    if (placeHolderStr == nil) {
        placeHolderStr = @"";
    }

    url = [NSURL URLWithString:urlStr];

    if (radius != 0.0) {
        //头像需要手动缓存处理成圆角的图片
        NSString *cacheurlStr = [urlStr stringByAppendingString:@"radiusCache"];
        UIImage *cacheImage = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:cacheurlStr];
        if (cacheImage) {
            self.image = cacheImage;
        }
        else {
            [self sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:placeHolderStr] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                if (!error) {
                    UIImage *radiusImage = [self.image imageWithCornerRadius:radius size:self.frame.size];
                    self.image = radiusImage;
                    [[SDImageCache sharedImageCache] storeImage:radiusImage forKey:cacheurlStr completion:nil];
                    //清除原有非圆角图片缓存
                    [[SDImageCache sharedImageCache] removeImageForKey:urlStr withCompletion:nil];
                }
            }];
        }
    }
    else {
        [self sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:placeHolderStr] completed:nil];
    }
}

@end
