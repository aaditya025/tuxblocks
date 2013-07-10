//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: pythagoras/d/RoundRectangle.java
//
//  Created by Thomas on 7/9/13.
//

#import "pythagoras/d/IRoundRectangle.h"
#import "RoundRectangle.h"

@implementation PythagorasDRoundRectangle

@synthesize x_ = x__;
@synthesize y_ = y__;
@synthesize width_ = width__;
@synthesize height_ = height__;
@synthesize arcwidth = arcwidth_;
@synthesize archeight = archeight_;

- (id)init {
  return [super init];
}

- (id)initWithDouble:(double)x
          withDouble:(double)y
          withDouble:(double)width
          withDouble:(double)height
          withDouble:(double)arcwidth
          withDouble:(double)archeight {
  if ((self = [super init])) {
    [self setRoundRectWithDouble:x withDouble:y withDouble:width withDouble:height withDouble:arcwidth withDouble:archeight];
  }
  return self;
}

- (void)setRoundRectWithDouble:(double)x
                    withDouble:(double)y
                    withDouble:(double)width
                    withDouble:(double)height
                    withDouble:(double)arcwidth
                    withDouble:(double)archeight {
  self.x_ = x;
  self.y_ = y;
  self.width_ = width;
  self.height_ = height;
  self.arcwidth = arcwidth;
  self.archeight = archeight;
}

- (void)setRoundRectWithPythagorasDIRoundRectangle:(id<PythagorasDIRoundRectangle>)rr {
  [self setRoundRectWithDouble:[((id<PythagorasDIRoundRectangle>) NIL_CHK(rr)) x] withDouble:[((id<PythagorasDIRoundRectangle>) NIL_CHK(rr)) y] withDouble:[((id<PythagorasDIRoundRectangle>) NIL_CHK(rr)) width] withDouble:[((id<PythagorasDIRoundRectangle>) NIL_CHK(rr)) height] withDouble:[((id<PythagorasDIRoundRectangle>) NIL_CHK(rr)) arcWidth] withDouble:[((id<PythagorasDIRoundRectangle>) NIL_CHK(rr)) arcHeight]];
}

- (double)arcWidth {
  return arcwidth_;
}

- (double)arcHeight {
  return archeight_;
}

- (double)x {
  return x__;
}

- (double)y {
  return y__;
}

- (double)width {
  return width__;
}

- (double)height {
  return height__;
}

- (void)setFrameWithDouble:(double)x
                withDouble:(double)y
                withDouble:(double)width
                withDouble:(double)height {
  [self setRoundRectWithDouble:x withDouble:y withDouble:width withDouble:height withDouble:arcwidth_ withDouble:archeight_];
}

- (void)dealloc {
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  PythagorasDRoundRectangle *typedCopy = (PythagorasDRoundRectangle *) copy;
  typedCopy.x_ = x__;
  typedCopy.y_ = y__;
  typedCopy.width_ = width__;
  typedCopy.height_ = height__;
  typedCopy.arcwidth = arcwidth_;
  typedCopy.archeight = archeight_;
}

@end
