//
//  MacPathView.m
//  svg_test
//
//  Created by Michael Redig on 9/29/14.
//
//

#import "MacPathView.h"
#import "SKUBezierPath+SVG.h"

@implementation MacPathView

- (id)initWithFrame:(CGRect)frame
       andSVGString:(NSString*)svgString
              scale:(CGFloat)scale
          fillColor:(NSColor *)color
{
    self = [super initWithFrame:frame];
    if (self) {
        _svgString = svgString;
        _scale = scale;
        _color = color;
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    SKUBezierPath* svgPath = [SKUBezierPath bezierPathWithSVGString:_svgString];
    NSAffineTransform *invertPathMac = [[NSAffineTransform alloc] init];
    NSAffineTransform *scaleUpMac = [[NSAffineTransform alloc] init];
    NSAffineTransform *resetOrigMac = [[NSAffineTransform alloc] init];
    [invertPathMac scaleXBy:1.0 yBy:-1.0];
    [svgPath transformUsingAffineTransform:invertPathMac];
    [resetOrigMac translateXBy:-svgPath.bounds.origin.x yBy:-svgPath.bounds.origin.y];
    [svgPath transformUsingAffineTransform:resetOrigMac];
    [scaleUpMac scaleXBy:_scale yBy:_scale];
    [svgPath transformUsingAffineTransform:scaleUpMac];
    
    [_color setFill];
    [svgPath fill];
}


@end
