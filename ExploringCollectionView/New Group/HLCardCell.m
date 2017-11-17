//
//  HLCardCell.m
//  Mom
//
//  Created by HeLin  on 2017/10/21.
//  Copyright © 2017年 HL. All rights reserved.
//

#import "HLCardCell.h"

@interface HLCardCell ()
@property (nonatomic, weak)UIButton *chooseIcon;
@end

@implementation HLCardCell

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupInterface];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupInterface];
    }
    return self;
}

-(void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    self.chooseIcon.selected = selected;
}

-(void)setupInterface{
    UIButton *chooseIcon = [[UIButton alloc]init];
    [chooseIcon setImage:[UIImage imageNamed:@"Unchecked"] forState:UIControlStateNormal];
    [chooseIcon setImage:[UIImage imageNamed:@"Selected"] forState:UIControlStateSelected];
    self.chooseIcon = chooseIcon;
    [self.contentView addSubview:chooseIcon];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.backgroundColor = [HLCardCell randomColor];
    
    CGFloat chooseIconW = 20;
    CGFloat chooseIconH = chooseIconW;
    CGFloat chooseIconX = self.frame.size.width - chooseIconW - 15;
    CGFloat chooseIconY = 15;
    self.chooseIcon.frame = CGRectMake(chooseIconX, chooseIconY, chooseIconW, chooseIconH);

    self.layer.mask = nil;
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    layer.frame = self.bounds;
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight |UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(8, 0)];
    layer.path = path.CGPath;
    self.layer.mask = layer;
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
+ (UIColor *)randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

@end
