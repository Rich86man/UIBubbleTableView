//
// Created by Chope on 14. 11. 4..
//

#import "CustomBubbleTableViewCell.h"


@implementation CustomBubbleTableViewCell

- (UIImage *)bubbleMineImage {
    return [super bubbleSomeoneImage];
}

- (UIImage *)bubbleSomeoneImage {
    return [super bubbleMineImage];
}

@end