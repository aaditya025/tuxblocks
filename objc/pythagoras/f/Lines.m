//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: pythagoras/f/Lines.java
//
//  Created by Thomas on 7/9/13.
//

#import "pythagoras/f/FloatMath.h"
#import "Lines.h"

@implementation PythagorasFLines

+ (BOOL)linesIntersectWithFloat:(float)x1
                      withFloat:(float)y1
                      withFloat:(float)x2
                      withFloat:(float)y2
                      withFloat:(float)x3
                      withFloat:(float)y3
                      withFloat:(float)x4
                      withFloat:(float)y4 {
  x2 -= x1;
  y2 -= y1;
  x3 -= x1;
  y3 -= y1;
  x4 -= x1;
  y4 -= y1;
  float AvB = x2 * y3 - x3 * y2;
  float AvC = x2 * y4 - x4 * y2;
  if (AvB == 0 && AvC == 0) {
    if (x2 != 0) {
      return (x4 * x3 <= 0) || ((x3 * x2 >= 0) && (x2 > 0 ? x3 <= x2 || x4 <= x2 : x3 >= x2 || x4 >= x2));
    }
    if (y2 != 0) {
      return (y4 * y3 <= 0) || ((y3 * y2 >= 0) && (y2 > 0 ? y3 <= y2 || y4 <= y2 : y3 >= y2 || y4 >= y2));
    }
    return NO;
  }
  float BvC = x3 * y4 - x4 * y3;
  return (AvB * AvC <= 0) && (BvC * (AvB + BvC - AvC) <= 0);
}

+ (BOOL)lineIntersectsRectWithFloat:(float)x1
                          withFloat:(float)y1
                          withFloat:(float)x2
                          withFloat:(float)y2
                          withFloat:(float)rx
                          withFloat:(float)ry
                          withFloat:(float)rw
                          withFloat:(float)rh {
  float rr = rx + rw, rb = ry + rh;
  return (rx <= x1 && x1 <= rr && ry <= y1 && y1 <= rb) || (rx <= x2 && x2 <= rr && ry <= y2 && y2 <= rb) || [PythagorasFLines linesIntersectWithFloat:rx withFloat:ry withFloat:rr withFloat:rb withFloat:x1 withFloat:y1 withFloat:x2 withFloat:y2] || [PythagorasFLines linesIntersectWithFloat:rr withFloat:ry withFloat:rx withFloat:rb withFloat:x1 withFloat:y1 withFloat:x2 withFloat:y2];
}

+ (float)pointLineDistSqWithFloat:(float)px
                        withFloat:(float)py
                        withFloat:(float)x1
                        withFloat:(float)y1
                        withFloat:(float)x2
                        withFloat:(float)y2 {
  x2 -= x1;
  y2 -= y1;
  px -= x1;
  py -= y1;
  float s = px * y2 - py * x2;
  return (s * s) / (x2 * x2 + y2 * y2);
}

+ (float)pointLineDistWithFloat:(float)px
                      withFloat:(float)py
                      withFloat:(float)x1
                      withFloat:(float)y1
                      withFloat:(float)x2
                      withFloat:(float)y2 {
  return [PythagorasFFloatMath sqrtWithFloat:[PythagorasFLines pointLineDistSqWithFloat:px withFloat:py withFloat:x1 withFloat:y1 withFloat:x2 withFloat:y2]];
}

+ (float)pointSegDistSqWithFloat:(float)px
                       withFloat:(float)py
                       withFloat:(float)x1
                       withFloat:(float)y1
                       withFloat:(float)x2
                       withFloat:(float)y2 {
  x2 -= x1;
  y2 -= y1;
  px -= x1;
  py -= y1;
  float dist;
  if (px * x2 + py * y2 <= 0.0) {
    dist = px * px + py * py;
  }
  else {
    px = x2 - px;
    py = y2 - py;
    if (px * x2 + py * y2 <= 0.0) {
      dist = px * px + py * py;
    }
    else {
      dist = px * y2 - py * x2;
      dist = dist * dist / (x2 * x2 + y2 * y2);
    }
  }
  if (dist < 0) {
    dist = 0;
  }
  return dist;
}

+ (float)pointSegDistWithFloat:(float)px
                     withFloat:(float)py
                     withFloat:(float)x1
                     withFloat:(float)y1
                     withFloat:(float)x2
                     withFloat:(float)y2 {
  return [PythagorasFFloatMath sqrtWithFloat:[PythagorasFLines pointSegDistSqWithFloat:px withFloat:py withFloat:x1 withFloat:y1 withFloat:x2 withFloat:y2]];
}

+ (int)relativeCCWWithFloat:(float)px
                  withFloat:(float)py
                  withFloat:(float)x1
                  withFloat:(float)y1
                  withFloat:(float)x2
                  withFloat:(float)y2 {
  x2 -= x1;
  y2 -= y1;
  px -= x1;
  py -= y1;
  float t = px * y2 - py * x2;
  if (t == 0.0f) {
    t = px * x2 + py * y2;
    if (t > 0.0f) {
      px -= x2;
      py -= y2;
      t = px * x2 + py * y2;
      if (t < 0.0f) {
        t = 0.0f;
      }
    }
  }
  return (t < 0.0f) ? -1 : (t > 0.0f ? 1 : 0);
}

- (id)init {
  return [super init];
}

- (void)dealloc {
  [super dealloc];
}

@end
