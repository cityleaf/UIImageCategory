//
//  UIImageView+Web.h
//  tio-chat-ios
//
//  Created by 刘宇 on 2020/1/9.
//  Copyright © 2020 刘宇. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (Web)

- (void)tio_imageUrl:(NSString *)urlStr placeHolderImageName:(NSString *)placeHolderStr radius:(CGFloat)radius;

@end

NS_ASSUME_NONNULL_END
