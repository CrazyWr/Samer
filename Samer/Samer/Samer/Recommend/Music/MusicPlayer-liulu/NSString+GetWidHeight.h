//
//  NSString+GetWidHeight.h
//  Pods
//
//  Created by 刘路 on 16/3/9.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (GetWidHeight)


//自定义方法  用来获取字符串

+(CGFloat)getHeightWithString:(NSString *)string Width:(CGFloat)Width FonSize:(CGFloat)fontsize;

//自定义方法  用来获取字符串显示的宽度

+(CGFloat)getWidthWithstirng:(NSString*)string Width:(CGFloat)width FonSize:(CGFloat)fontsize;

@end
