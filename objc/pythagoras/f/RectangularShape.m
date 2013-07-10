//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: pythagoras/f/RectangularShape.java
//
//  Created by Thomas on 7/9/13.
//

#import "java/lang/Math.h"
#import "pythagoras/f/FlatteningPathIterator.h"
#import "pythagoras/f/IDimension.h"
#import "pythagoras/f/IPoint.h"
#import "pythagoras/f/IRectangle.h"
#import "pythagoras/f/IRectangularShape.h"
#import "pythagoras/f/IShape.h"
#import "pythagoras/f/PathIterator.h"
#import "pythagoras/f/Point.h"
#import "pythagoras/f/Rectangle.h"
#import "pythagoras/f/Transform.h"
#import "RectangularShape.h"

@implementation PythagorasFRectangularShape

- (void)setFrameWithFloat:(float)x
                withFloat:(float)y
                withFloat:(float)width
                withFloat:(float)height {
  // can't call an abstract method
  [self doesNotRecognizeSelector:_cmd];
}

- (void)setFrameWithPythagorasFIPoint:(id<PythagorasFIPoint>)loc
            withPythagorasFIDimension:(id<PythagorasFIDimension>)size {
  [self setFrameWithFloat:[((id<PythagorasFIPoint>) NIL_CHK(loc)) x] withFloat:[((id<PythagorasFIPoint>) NIL_CHK(loc)) y] withFloat:[((id<PythagorasFIDimension>) NIL_CHK(size)) width] withFloat:[((id<PythagorasFIDimension>) NIL_CHK(size)) height]];
}

- (void)setFrameWithPythagorasFIRectangle:(id<PythagorasFIRectangle>)r {
  [self setFrameWithFloat:[((id<PythagorasFIRectangle>) NIL_CHK(r)) x] withFloat:[((id<PythagorasFIRectangle>) NIL_CHK(r)) y] withFloat:[((id<PythagorasFIRectangle>) NIL_CHK(r)) width] withFloat:[((id<PythagorasFIRectangle>) NIL_CHK(r)) height]];
}

- (void)setFrameFromDiagonalWithFloat:(float)x1
                            withFloat:(float)y1
                            withFloat:(float)x2
                            withFloat:(float)y2 {
  float rx, ry, rw, rh;
  if (x1 < x2) {
    rx = x1;
    rw = x2 - x1;
  }
  else {
    rx = x2;
    rw = x1 - x2;
  }
  if (y1 < y2) {
    ry = y1;
    rh = y2 - y1;
  }
  else {
    ry = y2;
    rh = y1 - y2;
  }
  [self setFrameWithFloat:rx withFloat:ry withFloat:rw withFloat:rh];
}

- (void)setFrameFromDiagonalWithPythagorasFIPoint:(id<PythagorasFIPoint>)p1
                            withPythagorasFIPoint:(id<PythagorasFIPoint>)p2 {
  [self setFrameFromDiagonalWithFloat:[((id<PythagorasFIPoint>) NIL_CHK(p1)) x] withFloat:[((id<PythagorasFIPoint>) NIL_CHK(p1)) y] withFloat:[((id<PythagorasFIPoint>) NIL_CHK(p2)) x] withFloat:[((id<PythagorasFIPoint>) NIL_CHK(p2)) y]];
}

- (void)setFrameFromCenterWithFloat:(float)centerX
                          withFloat:(float)centerY
                          withFloat:(float)cornerX
                          withFloat:(float)cornerY {
  float width = [JavaLangMath absWithFloat:cornerX - centerX];
  float height = [JavaLangMath absWithFloat:cornerY - centerY];
  [self setFrameWithFloat:centerX - width withFloat:centerY - height withFloat:width * 2 withFloat:height * 2];
}

- (void)setFrameFromCenterWithPythagorasFIPoint:(id<PythagorasFIPoint>)center
                          withPythagorasFIPoint:(id<PythagorasFIPoint>)corner {
  [self setFrameFromCenterWithFloat:[((id<PythagorasFIPoint>) NIL_CHK(center)) x] withFloat:[((id<PythagorasFIPoint>) NIL_CHK(center)) y] withFloat:[((id<PythagorasFIPoint>) NIL_CHK(corner)) x] withFloat:[((id<PythagorasFIPoint>) NIL_CHK(corner)) y]];
}

- (PythagorasFPoint *)min {
  return [[[PythagorasFPoint alloc] initWithFloat:[self minX] withFloat:[self minY]] autorelease];
}

- (float)minX {
  return [self x];
}

- (float)minY {
  return [self y];
}

- (PythagorasFPoint *)max {
  return [[[PythagorasFPoint alloc] initWithFloat:[self maxX] withFloat:[self maxY]] autorelease];
}

- (float)maxX {
  return [self x] + [self width];
}

- (float)maxY {
  return [self y] + [self height];
}

- (PythagorasFPoint *)center {
  return [[[PythagorasFPoint alloc] initWithFloat:[self centerX] withFloat:[self centerY]] autorelease];
}

- (float)centerX {
  return [self x] + [self width] / 2;
}

- (float)centerY {
  return [self y] + [self height] / 2;
}

- (PythagorasFRectangle *)frame {
  return [self bounds];
}

- (PythagorasFRectangle *)frameWithPythagorasFRectangle:(PythagorasFRectangle *)target {
  return [self boundsWithPythagorasFRectangle:target];
}

- (BOOL)isEmpty {
  return [self width] <= 0 || [self height] <= 0;
}

- (BOOL)containsWithPythagorasFIPoint:(id<PythagorasFIPoint>)point {
  return [self containsWithFloat:[((id<PythagorasFIPoint>) NIL_CHK(point)) x] withFloat:[((id<PythagorasFIPoint>) NIL_CHK(point)) y]];
}

- (BOOL)containsWithPythagorasFIRectangle:(id<PythagorasFIRectangle>)rect {
  return [self containsWithFloat:[((id<PythagorasFIRectangle>) NIL_CHK(rect)) x] withFloat:[((id<PythagorasFIRectangle>) NIL_CHK(rect)) y] withFloat:[((id<PythagorasFIRectangle>) NIL_CHK(rect)) width] withFloat:[((id<PythagorasFIRectangle>) NIL_CHK(rect)) height]];
}

- (BOOL)intersectsWithPythagorasFIRectangle:(id<PythagorasFIRectangle>)rect {
  return [self intersectsWithFloat:[((id<PythagorasFIRectangle>) NIL_CHK(rect)) x] withFloat:[((id<PythagorasFIRectangle>) NIL_CHK(rect)) y] withFloat:[((id<PythagorasFIRectangle>) NIL_CHK(rect)) width] withFloat:[((id<PythagorasFIRectangle>) NIL_CHK(rect)) height]];
}

- (PythagorasFRectangle *)bounds {
  return [self boundsWithPythagorasFRectangle:[[[PythagorasFRectangle alloc] init] autorelease]];
}

- (PythagorasFRectangle *)boundsWithPythagorasFRectangle:(PythagorasFRectangle *)target {
  [((PythagorasFRectangle *) NIL_CHK(target)) setBoundsWithFloat:[self x] withFloat:[self y] withFloat:[self width] withFloat:[self height]];
  return target;
}

- (id<PythagorasFPathIterator>)pathIteratorWithPythagorasFTransform:(id<PythagorasFTransform>)t
                                                          withFloat:(float)flatness {
  return [[[PythagorasFFlatteningPathIterator alloc] initWithPythagorasFPathIterator:[self pathIteratorWithPythagorasFTransform:t] withFloat:flatness] autorelease];
}

- (float)height {
  // can't call an abstract method
  [self doesNotRecognizeSelector:_cmd];
  return 0;
}

- (float)width {
  // can't call an abstract method
  [self doesNotRecognizeSelector:_cmd];
  return 0;
}

- (float)x {
  // can't call an abstract method
  [self doesNotRecognizeSelector:_cmd];
  return 0;
}

- (float)y {
  // can't call an abstract method
  [self doesNotRecognizeSelector:_cmd];
  return 0;
}

- (BOOL)containsWithFloat:(float)param0
                withFloat:(float)param1 {
  // can't call an abstract method
  [self doesNotRecognizeSelector:_cmd];
  return 0;
}

- (BOOL)containsWithFloat:(float)param0
                withFloat:(float)param1
                withFloat:(float)param2
                withFloat:(float)param3 {
  // can't call an abstract method
  [self doesNotRecognizeSelector:_cmd];
  return 0;
}

- (BOOL)intersectsWithFloat:(float)param0
                  withFloat:(float)param1
                  withFloat:(float)param2
                  withFloat:(float)param3 {
  // can't call an abstract method
  [self doesNotRecognizeSelector:_cmd];
  return 0;
}

- (id<PythagorasFPathIterator>)pathIteratorWithPythagorasFTransform:(id<PythagorasFTransform>)param0 {
  // can't call an abstract method
  [self doesNotRecognizeSelector:_cmd];
  return 0;
}

- (id)init {
  return [super init];
}

- (void)dealloc {
  [super dealloc];
}

@end
