//
//  UIImage+TColor.m
//  tio-chat-ios
//
//  Created by 刘宇 on 2020/1/2.
//  Copyright © 2020 刘宇. All rights reserved.
//

#import "UIImage+TColor.h"

@implementation UIImage (TColor)

- (instancetype)imageWithCornerRadius:(CGFloat)cornerRadius size:(CGSize)newSize
{
    // 先将图片裁剪为目标比例 不拉伸压缩
    UIImage *originImage = [self scaleImage:newSize];
    
    // 开始裁切圆角
    CGRect bounds = CGRectMake(0, 0, newSize.width, newSize.height);
    UIGraphicsBeginImageContextWithOptions(newSize, NO, UIScreen.mainScreen.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:bounds
                                                    cornerRadius:cornerRadius];
    CGContextAddPath(context, path.CGPath);
    CGContextClip(context);
    [originImage drawInRect:bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)scaleImage:(CGSize)newSize
{
    CGFloat width = self.size.width;
    CGFloat height = self.size.height;
    
    CGFloat scale = newSize.width / newSize.height;
    CGFloat imageScale = width / height;
    
    if (imageScale > scale) {
        // 以高为准
        width = height * scale;
    } else if (imageScale < scale) {
        // 以宽为准
        height = width / scale;
    } else {
        // 正常比例
    }
    
    // 中心放大
    CGRect frame = CGRectMake((self.size.width - width) * 0.5, (self.size.height - height) * 0.5, width, height);
    
    CGImageRef imageRef = [self CGImage];
    imageRef = CGImageCreateWithImageInRect(imageRef, frame);
    UIImage *image = [UIImage imageWithCGImage:imageRef];
    
    
    return image;
}

@end
