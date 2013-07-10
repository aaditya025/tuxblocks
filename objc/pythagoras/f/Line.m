//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: pythagoras/f/Line.java
//
//  Created by Thomas on 7/9/13.
//

#import "pythagoras/f/IPoint.h"
#import "Line.h"

@implementation PythagorasFLine

@synthesize x1_ = x1__;
@synthesize y1_ = y1__;
@synthesize x2_ = x2__;
@synthesize y2_ = y2__;

- (id)init {
  return [super init];
}

- (id)initWithFloat:(float)x1
          withFloat:(float)y1
          withFloat:(float)x2
          withFloat:(float)y2 {
  if ((self = [super init])) {
    [self setLineWithFloat:x1 withFloat:y1 withFloat:x2 withFloat:y2];
  }
  return self;
}

- (id)initWithPythagorasFIPoint:(id<PythagorasFIPoint>)p1
          withPythagorasFIPoint:(id<PythagorasFIPoint>)p2 {
  if ((self = [super init])) {
    [self setLineWithPythagorasFIPoint:p1 withPythagorasFIPoint:p2];
  }
  return self;
}

- (void)setLineWithFloat:(float)x1
               withFloat:(float)y1
               withFloat:(float)x2
               withFloat:(float)y2 {
  self.x1_ = x1;
  self.y1_ = y1;
  self.x2_ = x2;
  self.y2_ = y2;
}

- (void)setLineWithPythagorasFIPoint:(id<PythagorasFIPoint>)p1
               withPythagorasFIPoint:(id<PythagorasFIPoint>)p2 {
  [self setLineWithFloat:[((id<PythagorasFIPoint>) NIL_CHK(p1)) x] withFloat:[((id<PythagorasFIPoint>) NIL_CHK(p1)) y] withFloat:[((id<PythagorasFIPoint>) NIL_CHK(p2)) x] withFloat:[((id<PythagorasFIPoint>) NIL_CHK(p2)) y]];
}

- (float)x1 {
  return x1__;
}

- (float)y1 {
  return y1__;
}

- (float)x2 {
  return x2__;
}

- (float)y2 {
  return y2__;
}

- (void)dealloc {
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  PythagorasFLine *typedCopy = (PythagorasFLine *) copy;
  typedCopy.x1_ = x1__;
  typedCopy.y1_ = y1__;
  typedCopy.x2_ = x2__;
  typedCopy.y2_ = y2__;
}

@end
