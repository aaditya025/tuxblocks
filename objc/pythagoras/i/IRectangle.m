//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: pythagoras/i/IRectangle.java
//
//  Created by Thomas on 7/9/13.
//

#import "pythagoras/i/Dimension.h"
#import "pythagoras/i/IPoint.h"
#import "pythagoras/i/Point.h"
#import "pythagoras/i/Rectangle.h"
#import "IRectangle.h"


@implementation PythagorasIIRectangle

+ (int)OUT_LEFT {
  return PythagorasIIRectangle_OUT_LEFT;
}

+ (int)OUT_TOP {
  return PythagorasIIRectangle_OUT_TOP;
}

+ (int)OUT_RIGHT {
  return PythagorasIIRectangle_OUT_RIGHT;
}

+ (int)OUT_BOTTOM {
  return PythagorasIIRectangle_OUT_BOTTOM;
}

- (id)copyWithZoneWithNSZone:(NSZone *)zone OBJC_METHOD_FAMILY_NONE {
  return [[self clone] retain];
}

@end
