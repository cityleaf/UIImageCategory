//
//  UIImage+TColor.h
//  tio-chat-ios
//
//  Created by 刘宇 on 2020/1/2.
//  Copyright © 2020 刘宇. All rights reserved.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (TColor)

/**
 给静态图片添加圆角

 @param cornerRadius 圆角
 @param newSize 图片大小
 @return 添加圆角的图片
 */
- (UIImage *)imageWithCornerRadius:(CGFloat)cornerRadius size:(CGSize)newSize;

- (UIImage *)scaleImage:(CGSize)newSize;

@end

NS_ASSUME_NONNULL_END
