//
//  UIBezierPath+SVG.h
//  svg_test
//
//  Created by Arthur Evstifeev on 5/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
//	Modified by Michael Redig 9/28/14

#if TARGET_OS_PHONE
#define SKUBezierPath UIBezierPath
#define addLineToPointSKU addLineToPoint
#define addCurveToPointSKU addCurveToPoint
#import <UIKit/UIKit.h>
#else
#define SKUBezierPath NSBezierPath
#define addLineToPointSKU lineToPoint
#define addCurveToPointSKU curveToPoint
#import <AppKit/AppKit.h>
#endif



@interface SKUBezierPath (SVG)

- (void)addPathFromSVGString:(NSString *)svgString factoryIdentifier:(NSString*) identifier;
+ (SKUBezierPath *)bezierPathWithSVGString:(NSString *)svgString factoryIdentifier:(NSString*) identifier;

@end

#if TARGET_OS_IPHONE
#else
@interface NSBezierPath (AddQuads)

-(void)addQuadCurveToPoint:(CGPoint)point controlPoint:(CGPoint)controlPoint;

@end
#endif

