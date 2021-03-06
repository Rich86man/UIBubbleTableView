//
//  NSBubbleData.h
//
//  Created by Alex Barinov
//  Project home page: http://alexbarinov.github.com/UIBubbleTableView/
//
//  This work is licensed under the Creative Commons Attribution-ShareAlike 3.0 Unported License.
//  To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/3.0/
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum _NSBubbleType
{
    BubbleTypeMine = 0,
    BubbleTypeSomeoneElse = 1
} NSBubbleType;

@interface NSBubbleData : NSObject <NSCoding>

@property (readonly, nonatomic, strong) NSDate *date;
@property (readonly, nonatomic) NSBubbleType type;
@property (readonly, nonatomic, strong) UIView *view;
@property (readonly, nonatomic) UIEdgeInsets insets;
@property (nonatomic, strong) UIImage *avatar;

- (instancetype)initWithText:(NSString *)text date:(NSDate *)date type:(NSBubbleType)type;
+ (instancetype)dataWithText:(NSString *)text date:(NSDate *)date type:(NSBubbleType)type;
- (instancetype)initWithImage:(UIImage *)image date:(NSDate *)date type:(NSBubbleType)type;
+ (instancetype)dataWithImage:(UIImage *)image date:(NSDate *)date type:(NSBubbleType)type;
- (instancetype)initWithView:(UIView *)view date:(NSDate *)date type:(NSBubbleType)type insets:(UIEdgeInsets)insets NS_DESIGNATED_INITIALIZER;
+ (instancetype)dataWithView:(UIView *)view date:(NSDate *)date type:(NSBubbleType)type insets:(UIEdgeInsets)insets;

@end
