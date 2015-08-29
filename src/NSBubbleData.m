//
//  NSBubbleData.m
//
//  Created by Alex Barinov
//  Project home page: http://alexbarinov.github.com/UIBubbleTableView/
//
//  This work is licensed under the Creative Commons Attribution-ShareAlike 3.0 Unported License.
//  To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/3.0/
//

#import "NSBubbleData.h"
#import <QuartzCore/QuartzCore.h>

@implementation NSBubbleData

#pragma mark - Text bubble

const UIEdgeInsets textInsetsMine = {15, 20, 21, 25};
const UIEdgeInsets textInsetsSomeone = {15, 25, 21, 20};



- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    _date = [decoder decodeObjectForKey:@"date"];
    _type = [decoder decodeIntegerForKey:@"type"];
    _view = [decoder decodeObjectForKey:@"view"];
    _insets = [decoder decodeUIEdgeInsetsForKey:@"insets"];
    _avatar = [decoder decodeObjectForKey:@"image"];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.date forKey:@"date"];
    [encoder encodeInteger:self.type forKey:@"type"];
    [encoder encodeObject:self.view forKey:@"view"];
    [encoder encodeUIEdgeInsets:self.insets forKey:@"insets"];
    [encoder encodeObject:self.avatar forKey:@"avatar"];
}



+ (instancetype)dataWithText:(NSString *)text date:(NSDate *)date type:(NSBubbleType)type
{
    return [[[self class] alloc] initWithText:text date:date type:type];
}

- (instancetype)initWithText:(NSString *)text date:(NSDate *)date type:(NSBubbleType)type
{
    UIFont *font = [UIFont fontWithName:@"ProximaNova-light" size:17.0];
    CGSize size = [(text ? text : @"") boundingRectWithSize:CGSizeMake(220, 9999) 
                                                    options:NSStringDrawingUsesLineFragmentOrigin
                                                 attributes:@{ NSFontAttributeName:font }
                                                    context:nil].size;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    label.numberOfLines = 0;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    label.text = (text ? text : @"");
    label.font = font;
    
    label.backgroundColor = [UIColor clearColor];
    
    if(BubbleTypeSomeoneElse){
    label.textColor = [UIColor colorWithRed:0.045 green:0.064 blue:0.063 alpha:1.000];
    } if(BubbleTypeMine){
        label.textColor = [UIColor colorWithRed:1.000 green:1.000 blue:0.960 alpha:1.000];
    }
    
    UIEdgeInsets insets = (type == BubbleTypeMine ? textInsetsMine : textInsetsSomeone);
    return [self initWithView:label date:date type:type insets:insets];
    
}

#pragma mark - Image bubble

const UIEdgeInsets imageInsetsMine = {21, 30, 26, 42};
const UIEdgeInsets imageInsetsSomeone = {21, 38, 26, 24};

+ (instancetype)dataWithImage:(UIImage *)image date:(NSDate *)date type:(NSBubbleType)type
{
    return [[NSBubbleData alloc] initWithImage:image date:date type:type];
}

- (instancetype)initWithImage:(UIImage *)image date:(NSDate *)date type:(NSBubbleType)type
{
    CGSize size = image.size;
    if (size.width > 220)
    {
        size.height /= (size.width / 220);
        size.width = 220;
    }
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    imageView.image = image;
    imageView.layer.cornerRadius = 80.0;
    imageView.layer.masksToBounds = YES;
    
    UIEdgeInsets insets = (type == BubbleTypeMine ? imageInsetsMine : imageInsetsSomeone);
    return [self initWithView:imageView date:date type:type insets:insets];       
}

#pragma mark - Custom view bubble

+ (instancetype)dataWithView:(UIView *)view date:(NSDate *)date type:(NSBubbleType)type insets:(UIEdgeInsets)insets
{
    return [[NSBubbleData alloc] initWithView:view date:date type:type insets:insets];
}

- (instancetype)initWithView:(UIView *)view date:(NSDate *)date type:(NSBubbleType)type insets:(UIEdgeInsets)insets  
{
    self = [super init];
    if (self)
    {
        _view = view;
        _date = date;
        
        _type = type;
        _insets = insets;
    }
    return self;
}

@end
