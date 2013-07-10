//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: pythagoras/d/GeometryUtil.java
//
//  Created by Thomas on 7/9/13.
//

#import "IOSDoubleArray.h"
#import "java/lang/Math.h"
#import "pythagoras/d/Crossing.h"
#import "GeometryUtil.h"

@implementation PythagorasDGeometryUtil

static double PythagorasDGeometryUtil_EPSILON_;

+ (double)EPSILON {
  return PythagorasDGeometryUtil_EPSILON_;
}

+ (int)intersectLinesWithParamsWithDouble:(double)x1
                               withDouble:(double)y1
                               withDouble:(double)x2
                               withDouble:(double)y2
                               withDouble:(double)x3
                               withDouble:(double)y3
                               withDouble:(double)x4
                               withDouble:(double)y4
                  withJavaLangDoubleArray:(IOSDoubleArray *)params {
  double dx = x4 - x3;
  double dy = y4 - y3;
  double d = dx * (y2 - y1) - dy * (x2 - x1);
  if ([JavaLangMath absWithDouble:d] < PythagorasDGeometryUtil_EPSILON_) {
    return 0;
  }
  [((IOSDoubleArray *) NIL_CHK(params)) replaceDoubleAtIndex:0 withDouble:(-dx * (y1 - y3) + dy * (x1 - x3)) / d];
  if (dx != 0) {
    [((IOSDoubleArray *) NIL_CHK(params)) replaceDoubleAtIndex:1 withDouble:([PythagorasDGeometryUtil lineWithDouble:[((IOSDoubleArray *) NIL_CHK(params)) doubleAtIndex:0] withDouble:x1 withDouble:x2] - x3) / dx];
  }
  else if (dy != 0) {
    [((IOSDoubleArray *) NIL_CHK(params)) replaceDoubleAtIndex:1 withDouble:([PythagorasDGeometryUtil lineWithDouble:[((IOSDoubleArray *) NIL_CHK(params)) doubleAtIndex:0] withDouble:y1 withDouble:y2] - y3) / dy];
  }
  else {
    [((IOSDoubleArray *) NIL_CHK(params)) replaceDoubleAtIndex:1 withDouble:0.0f];
  }
  if ([((IOSDoubleArray *) NIL_CHK(params)) doubleAtIndex:0] >= 0 && [((IOSDoubleArray *) NIL_CHK(params)) doubleAtIndex:0] <= 1 && [((IOSDoubleArray *) NIL_CHK(params)) doubleAtIndex:1] >= 0 && [((IOSDoubleArray *) NIL_CHK(params)) doubleAtIndex:1] <= 1) {
    return 1;
  }
  return 0;
}

+ (int)intersectLinesWithDouble:(double)x1
                     withDouble:(double)y1
                     withDouble:(double)x2
                     withDouble:(double)y2
                     withDouble:(double)x3
                     withDouble:(double)y3
                     withDouble:(double)x4
                     withDouble:(double)y4
        withJavaLangDoubleArray:(IOSDoubleArray *)point {
  double A1 = -(y2 - y1);
  double B1 = (x2 - x1);
  double C1 = x1 * y2 - x2 * y1;
  double A2 = -(y4 - y3);
  double B2 = (x4 - x3);
  double C2 = x3 * y4 - x4 * y3;
  double coefParallel = A1 * B2 - A2 * B1;
  if (x3 == x4 && y3 == y4 && (A1 * x3 + B1 * y3 + C1 == 0) && (x3 >= [JavaLangMath minWithDouble:x1 withDouble:x2]) && (x3 <= [JavaLangMath maxWithDouble:x1 withDouble:x2]) && (y3 >= [JavaLangMath minWithDouble:y1 withDouble:y2]) && (y3 <= [JavaLangMath maxWithDouble:y1 withDouble:y2])) {
    return 1;
  }
  if ([JavaLangMath absWithDouble:coefParallel] < PythagorasDGeometryUtil_EPSILON_) {
    return 0;
  }
  [((IOSDoubleArray *) NIL_CHK(point)) replaceDoubleAtIndex:0 withDouble:(B1 * C2 - B2 * C1) / coefParallel];
  [((IOSDoubleArray *) NIL_CHK(point)) replaceDoubleAtIndex:1 withDouble:(A2 * C1 - A1 * C2) / coefParallel];
  if ([((IOSDoubleArray *) NIL_CHK(point)) doubleAtIndex:0] >= [JavaLangMath minWithDouble:x1 withDouble:x2] && [((IOSDoubleArray *) NIL_CHK(point)) doubleAtIndex:0] >= [JavaLangMath minWithDouble:x3 withDouble:x4] && [((IOSDoubleArray *) NIL_CHK(point)) doubleAtIndex:0] <= [JavaLangMath maxWithDouble:x1 withDouble:x2] && [((IOSDoubleArray *) NIL_CHK(point)) doubleAtIndex:0] <= [JavaLangMath maxWithDouble:x3 withDouble:x4] && [((IOSDoubleArray *) NIL_CHK(point)) doubleAtIndex:1] >= [JavaLangMath minWithDouble:y1 withDouble:y2] && [((IOSDoubleArray *) NIL_CHK(point)) doubleAtIndex:1] >= [JavaLangMath minWithDouble:y3 withDouble:y4] && [((IOSDoubleArray *) NIL_CHK(point)) doubleAtIndex:1] <= [JavaLangMath maxWithDouble:y1 withDouble:y2] && [((IOSDoubleArray *) NIL_CHK(point)) doubleAtIndex:1] <= [JavaLangMath maxWithDouble:y3 withDouble:y4]) {
    return 1;
  }
  return 0;
}

+ (int)intersectLineAndQuadWithDouble:(double)x1
                           withDouble:(double)y1
                           withDouble:(double)x2
                           withDouble:(double)y2
                           withDouble:(double)qx1
                           withDouble:(double)qy1
                           withDouble:(double)qx2
                           withDouble:(double)qy2
                           withDouble:(double)qx3
                           withDouble:(double)qy3
              withJavaLangDoubleArray:(IOSDoubleArray *)params {
  IOSDoubleArray *eqn = [[[IOSDoubleArray alloc] initWithLength:3] autorelease];
  IOSDoubleArray *t = [[[IOSDoubleArray alloc] initWithLength:2] autorelease];
  IOSDoubleArray *s = [[[IOSDoubleArray alloc] initWithLength:2] autorelease];
  double dy = y2 - y1;
  double dx = x2 - x1;
  int quantity = 0;
  int count = 0;
  [((IOSDoubleArray *) NIL_CHK(eqn)) replaceDoubleAtIndex:0 withDouble:dy * (qx1 - x1) - dx * (qy1 - y1)];
  [((IOSDoubleArray *) NIL_CHK(eqn)) replaceDoubleAtIndex:1 withDouble:2 * dy * (qx2 - qx1) - 2 * dx * (qy2 - qy1)];
  [((IOSDoubleArray *) NIL_CHK(eqn)) replaceDoubleAtIndex:2 withDouble:dy * (qx1 - 2 * qx2 + qx3) - dx * (qy1 - 2 * qy2 + qy3)];
  if ((count = [PythagorasDCrossing solveQuadWithJavaLangDoubleArray:eqn withJavaLangDoubleArray:t]) == 0) {
    return 0;
  }
  for (int i = 0; i < count; i++) {
    if (dx != 0) {
      [((IOSDoubleArray *) NIL_CHK(s)) replaceDoubleAtIndex:i withDouble:([PythagorasDGeometryUtil quadWithDouble:[((IOSDoubleArray *) NIL_CHK(t)) doubleAtIndex:i] withDouble:qx1 withDouble:qx2 withDouble:qx3] - x1) / dx];
    }
    else if (dy != 0) {
      [((IOSDoubleArray *) NIL_CHK(s)) replaceDoubleAtIndex:i withDouble:([PythagorasDGeometryUtil quadWithDouble:[((IOSDoubleArray *) NIL_CHK(t)) doubleAtIndex:i] withDouble:qy1 withDouble:qy2 withDouble:qy3] - y1) / dy];
    }
    else {
      [((IOSDoubleArray *) NIL_CHK(s)) replaceDoubleAtIndex:i withDouble:0.0f];
    }
    if ([((IOSDoubleArray *) NIL_CHK(t)) doubleAtIndex:i] >= 0 && [((IOSDoubleArray *) NIL_CHK(t)) doubleAtIndex:i] <= 1 && [((IOSDoubleArray *) NIL_CHK(s)) doubleAtIndex:i] >= 0 && [((IOSDoubleArray *) NIL_CHK(s)) doubleAtIndex:i] <= 1) {
      [((IOSDoubleArray *) NIL_CHK(params)) replaceDoubleAtIndex:2 * quantity withDouble:[((IOSDoubleArray *) NIL_CHK(t)) doubleAtIndex:i]];
      [((IOSDoubleArray *) NIL_CHK(params)) replaceDoubleAtIndex:2 * quantity + 1 withDouble:[((IOSDoubleArray *) NIL_CHK(s)) doubleAtIndex:i]];
      ++quantity;
    }
  }
  return quantity;
}

+ (int)intersectLineAndCubicWithDouble:(double)x1
                            withDouble:(double)y1
                            withDouble:(double)x2
                            withDouble:(double)y2
                            withDouble:(double)cx1
                            withDouble:(double)cy1
                            withDouble:(double)cx2
                            withDouble:(double)cy2
                            withDouble:(double)cx3
                            withDouble:(double)cy3
                            withDouble:(double)cx4
                            withDouble:(double)cy4
               withJavaLangDoubleArray:(IOSDoubleArray *)params {
  IOSDoubleArray *eqn = [[[IOSDoubleArray alloc] initWithLength:4] autorelease];
  IOSDoubleArray *t = [[[IOSDoubleArray alloc] initWithLength:3] autorelease];
  IOSDoubleArray *s = [[[IOSDoubleArray alloc] initWithLength:3] autorelease];
  double dy = y2 - y1;
  double dx = x2 - x1;
  int quantity = 0;
  int count = 0;
  [((IOSDoubleArray *) NIL_CHK(eqn)) replaceDoubleAtIndex:0 withDouble:(cy1 - y1) * dx + (x1 - cx1) * dy];
  [((IOSDoubleArray *) NIL_CHK(eqn)) replaceDoubleAtIndex:1 withDouble:-3 * (cy1 - cy2) * dx + 3 * (cx1 - cx2) * dy];
  [((IOSDoubleArray *) NIL_CHK(eqn)) replaceDoubleAtIndex:2 withDouble:(3 * cy1 - 6 * cy2 + 3 * cy3) * dx - (3 * cx1 - 6 * cx2 + 3 * cx3) * dy];
  [((IOSDoubleArray *) NIL_CHK(eqn)) replaceDoubleAtIndex:3 withDouble:(-3 * cy1 + 3 * cy2 - 3 * cy3 + cy4) * dx + (3 * cx1 - 3 * cx2 + 3 * cx3 - cx4) * dy];
  if ((count = [PythagorasDCrossing solveCubicWithJavaLangDoubleArray:eqn withJavaLangDoubleArray:t]) == 0) {
    return 0;
  }
  for (int i = 0; i < count; i++) {
    if (dx != 0) {
      [((IOSDoubleArray *) NIL_CHK(s)) replaceDoubleAtIndex:i withDouble:([PythagorasDGeometryUtil cubicWithDouble:[((IOSDoubleArray *) NIL_CHK(t)) doubleAtIndex:i] withDouble:cx1 withDouble:cx2 withDouble:cx3 withDouble:cx4] - x1) / dx];
    }
    else if (dy != 0) {
      [((IOSDoubleArray *) NIL_CHK(s)) replaceDoubleAtIndex:i withDouble:([PythagorasDGeometryUtil cubicWithDouble:[((IOSDoubleArray *) NIL_CHK(t)) doubleAtIndex:i] withDouble:cy1 withDouble:cy2 withDouble:cy3 withDouble:cy4] - y1) / dy];
    }
    else {
      [((IOSDoubleArray *) NIL_CHK(s)) replaceDoubleAtIndex:i withDouble:0.0f];
    }
    if ([((IOSDoubleArray *) NIL_CHK(t)) doubleAtIndex:i] >= 0 && [((IOSDoubleArray *) NIL_CHK(t)) doubleAtIndex:i] <= 1 && [((IOSDoubleArray *) NIL_CHK(s)) doubleAtIndex:i] >= 0 && [((IOSDoubleArray *) NIL_CHK(s)) doubleAtIndex:i] <= 1) {
      [((IOSDoubleArray *) NIL_CHK(params)) replaceDoubleAtIndex:2 * quantity withDouble:[((IOSDoubleArray *) NIL_CHK(t)) doubleAtIndex:i]];
      [((IOSDoubleArray *) NIL_CHK(params)) replaceDoubleAtIndex:2 * quantity + 1 withDouble:[((IOSDoubleArray *) NIL_CHK(s)) doubleAtIndex:i]];
      ++quantity;
    }
  }
  return quantity;
}

+ (int)intersectQuadsWithDouble:(double)x1
                     withDouble:(double)y1
                     withDouble:(double)x2
                     withDouble:(double)y2
                     withDouble:(double)x3
                     withDouble:(double)y3
                     withDouble:(double)qx1
                     withDouble:(double)qy1
                     withDouble:(double)qx2
                     withDouble:(double)qy2
                     withDouble:(double)qx3
                     withDouble:(double)qy3
        withJavaLangDoubleArray:(IOSDoubleArray *)params {
  IOSDoubleArray *initParams = [[[IOSDoubleArray alloc] initWithLength:2] autorelease];
  IOSDoubleArray *xCoefs1 = [[[IOSDoubleArray alloc] initWithLength:3] autorelease];
  IOSDoubleArray *yCoefs1 = [[[IOSDoubleArray alloc] initWithLength:3] autorelease];
  IOSDoubleArray *xCoefs2 = [[[IOSDoubleArray alloc] initWithLength:3] autorelease];
  IOSDoubleArray *yCoefs2 = [[[IOSDoubleArray alloc] initWithLength:3] autorelease];
  int quantity = 0;
  [((IOSDoubleArray *) NIL_CHK(xCoefs1)) replaceDoubleAtIndex:0 withDouble:x1 - 2 * x2 + x3];
  [((IOSDoubleArray *) NIL_CHK(xCoefs1)) replaceDoubleAtIndex:1 withDouble:-2 * x1 + 2 * x2];
  [((IOSDoubleArray *) NIL_CHK(xCoefs1)) replaceDoubleAtIndex:2 withDouble:x1];
  [((IOSDoubleArray *) NIL_CHK(yCoefs1)) replaceDoubleAtIndex:0 withDouble:y1 - 2 * y2 + y3];
  [((IOSDoubleArray *) NIL_CHK(yCoefs1)) replaceDoubleAtIndex:1 withDouble:-2 * y1 + 2 * y2];
  [((IOSDoubleArray *) NIL_CHK(yCoefs1)) replaceDoubleAtIndex:2 withDouble:y1];
  [((IOSDoubleArray *) NIL_CHK(xCoefs2)) replaceDoubleAtIndex:0 withDouble:qx1 - 2 * qx2 + qx3];
  [((IOSDoubleArray *) NIL_CHK(xCoefs2)) replaceDoubleAtIndex:1 withDouble:-2 * qx1 + 2 * qx2];
  [((IOSDoubleArray *) NIL_CHK(xCoefs2)) replaceDoubleAtIndex:2 withDouble:qx1];
  [((IOSDoubleArray *) NIL_CHK(yCoefs2)) replaceDoubleAtIndex:0 withDouble:qy1 - 2 * qy2 + qy3];
  [((IOSDoubleArray *) NIL_CHK(yCoefs2)) replaceDoubleAtIndex:1 withDouble:-2 * qy1 + 2 * qy2];
  [((IOSDoubleArray *) NIL_CHK(yCoefs2)) replaceDoubleAtIndex:2 withDouble:qy1];
  [((IOSDoubleArray *) NIL_CHK(params)) replaceDoubleAtIndex:0 withDouble:[((IOSDoubleArray *) NIL_CHK(params)) replaceDoubleAtIndex:1 withDouble:0.25f]];
  [PythagorasDGeometryUtil quadNewtonWithJavaLangDoubleArray:xCoefs1 withJavaLangDoubleArray:yCoefs1 withJavaLangDoubleArray:xCoefs2 withJavaLangDoubleArray:yCoefs2 withJavaLangDoubleArray:initParams];
  if ([((IOSDoubleArray *) NIL_CHK(initParams)) doubleAtIndex:0] <= 1 && [((IOSDoubleArray *) NIL_CHK(initParams)) doubleAtIndex:0] >= 0 && [((IOSDoubleArray *) NIL_CHK(initParams)) doubleAtIndex:1] >= 0 && [((IOSDoubleArray *) NIL_CHK(initParams)) doubleAtIndex:1] <= 1) {
    [((IOSDoubleArray *) NIL_CHK(params)) replaceDoubleAtIndex:2 * quantity withDouble:[((IOSDoubleArray *) NIL_CHK(initParams)) doubleAtIndex:0]];
    [((IOSDoubleArray *) NIL_CHK(params)) replaceDoubleAtIndex:2 * quantity + 1 withDouble:[((IOSDoubleArray *) NIL_CHK(initParams)) doubleAtIndex:1]];
    ++quantity;
  }
  [((IOSDoubleArray *) NIL_CHK(params)) replaceDoubleAtIndex:0 withDouble:[((IOSDoubleArray *) NIL_CHK(params)) replaceDoubleAtIndex:1 withDouble:0.75f]];
  [PythagorasDGeometryUtil quadNewtonWithJavaLangDoubleArray:xCoefs1 withJavaLangDoubleArray:yCoefs1 withJavaLangDoubleArray:xCoefs2 withJavaLangDoubleArray:yCoefs2 withJavaLangDoubleArray:params];
  if ([((IOSDoubleArray *) NIL_CHK(initParams)) doubleAtIndex:0] <= 1 && [((IOSDoubleArray *) NIL_CHK(initParams)) doubleAtIndex:0] >= 0 && [((IOSDoubleArray *) NIL_CHK(initParams)) doubleAtIndex:1] >= 0 && [((IOSDoubleArray *) NIL_CHK(initParams)) doubleAtIndex:1] <= 1) {
    [((IOSDoubleArray *) NIL_CHK(params)) replaceDoubleAtIndex:2 * quantity withDouble:[((IOSDoubleArray *) NIL_CHK(initParams)) doubleAtIndex:0]];
    [((IOSDoubleArray *) NIL_CHK(params)) replaceDoubleAtIndex:2 * quantity + 1 withDouble:[((IOSDoubleArray *) NIL_CHK(initParams)) doubleAtIndex:1]];
    ++quantity;
  }
  return quantity;
}

+ (int)intersectQuadAndCubicWithDouble:(double)qx1
                            withDouble:(double)qy1
                            withDouble:(double)qx2
                            withDouble:(double)qy2
                            withDouble:(double)qx3
                            withDouble:(double)qy3
                            withDouble:(double)cx1
                            withDouble:(double)cy1
                            withDouble:(double)cx2
                            withDouble:(double)cy2
                            withDouble:(double)cx3
                            withDouble:(double)cy3
                            withDouble:(double)cx4
                            withDouble:(double)cy4
               withJavaLangDoubleArray:(IOSDoubleArray *)params {
  int quantity = 0;
  IOSDoubleArray *initParams = [[[IOSDoubleArray alloc] initWithLength:3] autorelease];
  IOSDoubleArray *xCoefs1 = [[[IOSDoubleArray alloc] initWithLength:3] autorelease];
  IOSDoubleArray *yCoefs1 = [[[IOSDoubleArray alloc] initWithLength:3] autorelease];
  IOSDoubleArray *xCoefs2 = [[[IOSDoubleArray alloc] initWithLength:4] autorelease];
  IOSDoubleArray *yCoefs2 = [[[IOSDoubleArray alloc] initWithLength:4] autorelease];
  [((IOSDoubleArray *) NIL_CHK(xCoefs1)) replaceDoubleAtIndex:0 withDouble:qx1 - 2 * qx2 + qx3];
  [((IOSDoubleArray *) NIL_CHK(xCoefs1)) replaceDoubleAtIndex:1 withDouble:2 * qx2 - 2 * qx1];
  [((IOSDoubleArray *) NIL_CHK(xCoefs1)) replaceDoubleAtIndex:2 withDouble:qx1];
  [((IOSDoubleArray *) NIL_CHK(yCoefs1)) replaceDoubleAtIndex:0 withDouble:qy1 - 2 * qy2 + qy3];
  [((IOSDoubleArray *) NIL_CHK(yCoefs1)) replaceDoubleAtIndex:1 withDouble:2 * qy2 - 2 * qy1];
  [((IOSDoubleArray *) NIL_CHK(yCoefs1)) replaceDoubleAtIndex:2 withDouble:qy1];
  [((IOSDoubleArray *) NIL_CHK(xCoefs2)) replaceDoubleAtIndex:0 withDouble:-cx1 + 3 * cx2 - 3 * cx3 + cx4];
  [((IOSDoubleArray *) NIL_CHK(xCoefs2)) replaceDoubleAtIndex:1 withDouble:3 * cx1 - 6 * cx2 + 3 * cx3];
  [((IOSDoubleArray *) NIL_CHK(xCoefs2)) replaceDoubleAtIndex:2 withDouble:-3 * cx1 + 3 * cx2];
  [((IOSDoubleArray *) NIL_CHK(xCoefs2)) replaceDoubleAtIndex:3 withDouble:cx1];
  [((IOSDoubleArray *) NIL_CHK(yCoefs2)) replaceDoubleAtIndex:0 withDouble:-cy1 + 3 * cy2 - 3 * cy3 + cy4];
  [((IOSDoubleArray *) NIL_CHK(yCoefs2)) replaceDoubleAtIndex:1 withDouble:3 * cy1 - 6 * cy2 + 3 * cy3];
  [((IOSDoubleArray *) NIL_CHK(yCoefs2)) replaceDoubleAtIndex:2 withDouble:-3 * cy1 + 3 * cy2];
  [((IOSDoubleArray *) NIL_CHK(yCoefs2)) replaceDoubleAtIndex:3 withDouble:cy1];
  [((IOSDoubleArray *) NIL_CHK(params)) replaceDoubleAtIndex:0 withDouble:[((IOSDoubleArray *) NIL_CHK(params)) replaceDoubleAtIndex:1 withDouble:0.25f]];
  [PythagorasDGeometryUtil quadAndCubicNewtonWithJavaLangDoubleArray:xCoefs1 withJavaLangDoubleArray:yCoefs1 withJavaLangDoubleArray:xCoefs2 withJavaLangDoubleArray:yCoefs2 withJavaLangDoubleArray:initParams];
  if ([((IOSDoubleArray *) NIL_CHK(initParams)) doubleAtIndex:0] <= 1 && [((IOSDoubleArray *) NIL_CHK(initParams)) doubleAtIndex:0] >= 0 && [((IOSDoubleArray *) NIL_CHK(initParams)) doubleAtIndex:1] >= 0 && [((IOSDoubleArray *) NIL_CHK(initParams)) doubleAtIndex:1] <= 1) {
    [((IOSDoubleArray *) NIL_CHK(params)) replaceDoubleAtIndex:2 * quantity withDouble:[((IOSDoubleArray *) NIL_CHK(initParams)) doubleAtIndex:0]];
    [((IOSDoubleArray *) NIL_CHK(params)) replaceDoubleAtIndex:2 * quantity + 1 withDouble:[((IOSDoubleArray *) NIL_CHK(initParams)) doubleAtIndex:1]];
    ++quantity;
  }
  [((IOSDoubleArray *) NIL_CHK(params)) replaceDoubleAtIndex:0 withDouble:[((IOSDoubleArray *) NIL_CHK(params)) replaceDoubleAtIndex:1 withDouble:0.5f]];
  [PythagorasDGeometryUtil quadAndCubicNewtonWithJavaLangDoubleArray:xCoefs1 withJavaLangDoubleArray:yCoefs1 withJavaLangDoubleArray:xCoefs2 withJavaLangDoubleArray:yCoefs2 withJavaLangDoubleArray:params];
  if ([((IOSDoubleArray *) NIL_CHK(initParams)) doubleAtIndex:0] <= 1 && [((IOSDoubleArray *) NIL_CHK(initParams)) doubleAtIndex:0] >= 0 && [((IOSDoubleArray *) NIL_CHK(initParams)) doubleAtIndex:1] >= 0 && [((IOSDoubleArray *) NIL_CHK(initParams)) doubleAtIndex:1] <= 1) {
    [((IOSDoubleArray *) NIL_CHK(params)) replaceDoubleAtIndex:2 * quantity withDouble:[((IOSDoubleArray *) NIL_CHK(initParams)) doubleAtIndex:0]];
    [((IOSDoubleArray *) NIL_CHK(params)) replaceDoubleAtIndex:2 * quantity + 1 withDouble:[((IOSDoubleArray *) NIL_CHK(initParams)) doubleAtIndex:1]];
    ++quantity;
  }
  [((IOSDoubleArray *) NIL_CHK(params)) replaceDoubleAtIndex:0 withDouble:[((IOSDoubleArray *) NIL_CHK(params)) replaceDoubleAtIndex:1 withDouble:0.75f]];
  [PythagorasDGeometryUtil quadAndCubicNewtonWithJavaLangDoubleArray:xCoefs1 withJavaLangDoubleArray:yCoefs1 withJavaLangDoubleArray:xCoefs2 withJavaLangDoubleArray:yCoefs2 withJavaLangDoubleArray:params];
  if ([((IOSDoubleArray *) NIL_CHK(initParams)) doubleAtIndex:0] <= 1 && [((IOSDoubleArray *) NIL_CHK(initParams)) doubleAtIndex:0] >= 0 && [((IOSDoubleArray *) NIL_CHK(initParams)) doubleAtIndex:1] >= 0 && [((IOSDoubleArray *) NIL_CHK(initParams)) doubleAtIndex:1] <= 1) {
    [((IOSDoubleArray *) NIL_CHK(params)) replaceDoubleAtIndex:2 * quantity withDouble:[((IOSDoubleArray *) NIL_CHK(initParams)) doubleAtIndex:0]];
    [((IOSDoubleArray *) NIL_CHK(params)) replaceDoubleAtIndex:2 * quantity + 1 withDouble:[((IOSDoubleArray *) NIL_CHK(initParams)) doubleAtIndex:1]];
    ++quantity;
  }
  return quantity;
}

+ (int)intersectCubicsWithDouble:(double)x1
                      withDouble:(double)y1
                      withDouble:(double)x2
                      withDouble:(double)y2
                      withDouble:(double)x3
                      withDouble:(double)y3
                      withDouble:(double)x4
                      withDouble:(double)y4
                      withDouble:(double)cx1
                      withDouble:(double)cy1
                      withDouble:(double)cx2
                      withDouble:(double)cy2
                      withDouble:(double)cx3
                      withDouble:(double)cy3
                      withDouble:(double)cx4
                      withDouble:(double)cy4
         withJavaLangDoubleArray:(IOSDoubleArray *)params {
  int quantity = 0;
  IOSDoubleArray *initParams = [[[IOSDoubleArray alloc] initWithLength:3] autorelease];
  IOSDoubleArray *xCoefs1 = [[[IOSDoubleArray alloc] initWithLength:4] autorelease];
  IOSDoubleArray *yCoefs1 = [[[IOSDoubleArray alloc] initWithLength:4] autorelease];
  IOSDoubleArray *xCoefs2 = [[[IOSDoubleArray alloc] initWithLength:4] autorelease];
  IOSDoubleArray *yCoefs2 = [[[IOSDoubleArray alloc] initWithLength:4] autorelease];
  [((IOSDoubleArray *) NIL_CHK(xCoefs1)) replaceDoubleAtIndex:0 withDouble:-x1 + 3 * x2 - 3 * x3 + x4];
  [((IOSDoubleArray *) NIL_CHK(xCoefs1)) replaceDoubleAtIndex:1 withDouble:3 * x1 - 6 * x2 + 3 * x3];
  [((IOSDoubleArray *) NIL_CHK(xCoefs1)) replaceDoubleAtIndex:2 withDouble:-3 * x1 + 3 * x2];
  [((IOSDoubleArray *) NIL_CHK(xCoefs1)) replaceDoubleAtIndex:3 withDouble:x1];
  [((IOSDoubleArray *) NIL_CHK(yCoefs1)) replaceDoubleAtIndex:0 withDouble:-y1 + 3 * y2 - 3 * y3 + y4];
  [((IOSDoubleArray *) NIL_CHK(yCoefs1)) replaceDoubleAtIndex:1 withDouble:3 * y1 - 6 * y2 + 3 * y3];
  [((IOSDoubleArray *) NIL_CHK(yCoefs1)) replaceDoubleAtIndex:2 withDouble:-3 * y1 + 3 * y2];
  [((IOSDoubleArray *) NIL_CHK(yCoefs1)) replaceDoubleAtIndex:3 withDouble:y1];
  [((IOSDoubleArray *) NIL_CHK(xCoefs2)) replaceDoubleAtIndex:0 withDouble:-cx1 + 3 * cx2 - 3 * cx3 + cx4];
  [((IOSDoubleArray *) NIL_CHK(xCoefs2)) replaceDoubleAtIndex:1 withDouble:3 * cx1 - 6 * cx2 + 3 * cx3];
  [((IOSDoubleArray *) NIL_CHK(xCoefs2)) replaceDoubleAtIndex:2 withDouble:-3 * cx1 + 3 * cx2];
  [((IOSDoubleArray *) NIL_CHK(xCoefs2)) replaceDoubleAtIndex:3 withDouble:cx1];
  [((IOSDoubleArray *) NIL_CHK(yCoefs2)) replaceDoubleAtIndex:0 withDouble:-cy1 + 3 * cy2 - 3 * cy3 + cy4];
  [((IOSDoubleArray *) NIL_CHK(yCoefs2)) replaceDoubleAtIndex:1 withDouble:3 * cy1 - 6 * cy2 + 3 * cy3];
  [((IOSDoubleArray *) NIL_CHK(yCoefs2)) replaceDoubleAtIndex:2 withDouble:-3 * cy1 + 3 * cy2];
  [((IOSDoubleArray *) NIL_CHK(yCoefs2)) replaceDoubleAtIndex:3 withDouble:cy1];
  [((IOSDoubleArray *) NIL_CHK(params)) replaceDoubleAtIndex:0 withDouble:[((IOSDoubleArray *) NIL_CHK(params)) replaceDoubleAtIndex:1 withDouble:0.25f]];
  [PythagorasDGeometryUtil cubicNewtonWithJavaLangDoubleArray:xCoefs1 withJavaLangDoubleArray:yCoefs1 withJavaLangDoubleArray:xCoefs2 withJavaLangDoubleArray:yCoefs2 withJavaLangDoubleArray:initParams];
  if ([((IOSDoubleArray *) NIL_CHK(initParams)) doubleAtIndex:0] <= 1 && [((IOSDoubleArray *) NIL_CHK(initParams)) doubleAtIndex:0] >= 0 && [((IOSDoubleArray *) NIL_CHK(initParams)) doubleAtIndex:1] >= 0 && [((IOSDoubleArray *) NIL_CHK(initParams)) doubleAtIndex:1] <= 1) {
    [((IOSDoubleArray *) NIL_CHK(params)) replaceDoubleAtIndex:2 * quantity withDouble:[((IOSDoubleArray *) NIL_CHK(initParams)) doubleAtIndex:0]];
    [((IOSDoubleArray *) NIL_CHK(params)) replaceDoubleAtIndex:2 * quantity + 1 withDouble:[((IOSDoubleArray *) NIL_CHK(initParams)) doubleAtIndex:1]];
    ++quantity;
  }
  [((IOSDoubleArray *) NIL_CHK(params)) replaceDoubleAtIndex:0 withDouble:[((IOSDoubleArray *) NIL_CHK(params)) replaceDoubleAtIndex:1 withDouble:0.5f]];
  [PythagorasDGeometryUtil cubicNewtonWithJavaLangDoubleArray:xCoefs1 withJavaLangDoubleArray:yCoefs1 withJavaLangDoubleArray:xCoefs2 withJavaLangDoubleArray:yCoefs2 withJavaLangDoubleArray:params];
  if ([((IOSDoubleArray *) NIL_CHK(initParams)) doubleAtIndex:0] <= 1 && [((IOSDoubleArray *) NIL_CHK(initParams)) doubleAtIndex:0] >= 0 && [((IOSDoubleArray *) NIL_CHK(initParams)) doubleAtIndex:1] >= 0 && [((IOSDoubleArray *) NIL_CHK(initParams)) doubleAtIndex:1] <= 1) {
    [((IOSDoubleArray *) NIL_CHK(params)) replaceDoubleAtIndex:2 * quantity withDouble:[((IOSDoubleArray *) NIL_CHK(initParams)) doubleAtIndex:0]];
    [((IOSDoubleArray *) NIL_CHK(params)) replaceDoubleAtIndex:2 * quantity + 1 withDouble:[((IOSDoubleArray *) NIL_CHK(initParams)) doubleAtIndex:1]];
    ++quantity;
  }
  [((IOSDoubleArray *) NIL_CHK(params)) replaceDoubleAtIndex:0 withDouble:[((IOSDoubleArray *) NIL_CHK(params)) replaceDoubleAtIndex:1 withDouble:0.75f]];
  [PythagorasDGeometryUtil cubicNewtonWithJavaLangDoubleArray:xCoefs1 withJavaLangDoubleArray:yCoefs1 withJavaLangDoubleArray:xCoefs2 withJavaLangDoubleArray:yCoefs2 withJavaLangDoubleArray:params];
  if ([((IOSDoubleArray *) NIL_CHK(initParams)) doubleAtIndex:0] <= 1 && [((IOSDoubleArray *) NIL_CHK(initParams)) doubleAtIndex:0] >= 0 && [((IOSDoubleArray *) NIL_CHK(initParams)) doubleAtIndex:1] >= 0 && [((IOSDoubleArray *) NIL_CHK(initParams)) doubleAtIndex:1] <= 1) {
    [((IOSDoubleArray *) NIL_CHK(params)) replaceDoubleAtIndex:2 * quantity withDouble:[((IOSDoubleArray *) NIL_CHK(initParams)) doubleAtIndex:0]];
    [((IOSDoubleArray *) NIL_CHK(params)) replaceDoubleAtIndex:2 * quantity + 1 withDouble:[((IOSDoubleArray *) NIL_CHK(initParams)) doubleAtIndex:1]];
    ++quantity;
  }
  return quantity;
}

+ (double)lineWithDouble:(double)t
              withDouble:(double)x1
              withDouble:(double)x2 {
  return x1 * (1.0f - t) + x2 * t;
}

+ (double)quadWithDouble:(double)t
              withDouble:(double)x1
              withDouble:(double)x2
              withDouble:(double)x3 {
  return x1 * (1.0f - t) * (1.0f - t) + 2.0f * x2 * t * (1.0f - t) + x3 * t * t;
}

+ (double)cubicWithDouble:(double)t
               withDouble:(double)x1
               withDouble:(double)x2
               withDouble:(double)x3
               withDouble:(double)x4 {
  return x1 * (1.0f - t) * (1.0f - t) * (1.0f - t) + 3.0f * x2 * (1.0f - t) * (1.0f - t) * t + 3.0f * x3 * (1.0f - t) * t * t + x4 * t * t * t;
}

+ (void)subQuadWithJavaLangDoubleArray:(IOSDoubleArray *)coef
                            withDouble:(double)t0
                              withBOOL:(BOOL)left {
  if (left) {
    [((IOSDoubleArray *) NIL_CHK(coef)) replaceDoubleAtIndex:2 withDouble:(1 - t0) * [((IOSDoubleArray *) NIL_CHK(coef)) doubleAtIndex:0] + t0 * [((IOSDoubleArray *) NIL_CHK(coef)) doubleAtIndex:2]];
    [((IOSDoubleArray *) NIL_CHK(coef)) replaceDoubleAtIndex:3 withDouble:(1 - t0) * [((IOSDoubleArray *) NIL_CHK(coef)) doubleAtIndex:1] + t0 * [((IOSDoubleArray *) NIL_CHK(coef)) doubleAtIndex:3]];
  }
  else {
    [((IOSDoubleArray *) NIL_CHK(coef)) replaceDoubleAtIndex:2 withDouble:(1 - t0) * [((IOSDoubleArray *) NIL_CHK(coef)) doubleAtIndex:2] + t0 * [((IOSDoubleArray *) NIL_CHK(coef)) doubleAtIndex:4]];
    [((IOSDoubleArray *) NIL_CHK(coef)) replaceDoubleAtIndex:3 withDouble:(1 - t0) * [((IOSDoubleArray *) NIL_CHK(coef)) doubleAtIndex:3] + t0 * [((IOSDoubleArray *) NIL_CHK(coef)) doubleAtIndex:5]];
  }
}

+ (void)subCubicWithJavaLangDoubleArray:(IOSDoubleArray *)coef
                             withDouble:(double)t0
                               withBOOL:(BOOL)left {
  if (left) {
    [((IOSDoubleArray *) NIL_CHK(coef)) replaceDoubleAtIndex:2 withDouble:(1 - t0) * [((IOSDoubleArray *) NIL_CHK(coef)) doubleAtIndex:0] + t0 * [((IOSDoubleArray *) NIL_CHK(coef)) doubleAtIndex:2]];
    [((IOSDoubleArray *) NIL_CHK(coef)) replaceDoubleAtIndex:3 withDouble:(1 - t0) * [((IOSDoubleArray *) NIL_CHK(coef)) doubleAtIndex:1] + t0 * [((IOSDoubleArray *) NIL_CHK(coef)) doubleAtIndex:3]];
  }
  else {
    [((IOSDoubleArray *) NIL_CHK(coef)) replaceDoubleAtIndex:4 withDouble:(1 - t0) * [((IOSDoubleArray *) NIL_CHK(coef)) doubleAtIndex:4] + t0 * [((IOSDoubleArray *) NIL_CHK(coef)) doubleAtIndex:6]];
    [((IOSDoubleArray *) NIL_CHK(coef)) replaceDoubleAtIndex:5 withDouble:(1 - t0) * [((IOSDoubleArray *) NIL_CHK(coef)) doubleAtIndex:5] + t0 * [((IOSDoubleArray *) NIL_CHK(coef)) doubleAtIndex:7]];
  }
}

+ (void)cubicNewtonWithJavaLangDoubleArray:(IOSDoubleArray *)xCoefs1
                   withJavaLangDoubleArray:(IOSDoubleArray *)yCoefs1
                   withJavaLangDoubleArray:(IOSDoubleArray *)xCoefs2
                   withJavaLangDoubleArray:(IOSDoubleArray *)yCoefs2
                   withJavaLangDoubleArray:(IOSDoubleArray *)params {
  double t = 0.0f, s = 0.0f;
  double t1 = [((IOSDoubleArray *) NIL_CHK(params)) doubleAtIndex:0];
  double s1 = [((IOSDoubleArray *) NIL_CHK(params)) doubleAtIndex:1];
  double d, dt, ds;
  while ([JavaLangMath sqrtWithDouble:(t - t1) * (t - t1) + (s - s1) * (s - s1)] > PythagorasDGeometryUtil_EPSILON_) {
    d = -(3 * t * t * [((IOSDoubleArray *) NIL_CHK(xCoefs1)) doubleAtIndex:0] + 2 * t * [((IOSDoubleArray *) NIL_CHK(xCoefs1)) doubleAtIndex:1] + [((IOSDoubleArray *) NIL_CHK(xCoefs1)) doubleAtIndex:2]) * (3 * s * s * [((IOSDoubleArray *) NIL_CHK(yCoefs2)) doubleAtIndex:0] + 2 * s * [((IOSDoubleArray *) NIL_CHK(yCoefs2)) doubleAtIndex:1] + [((IOSDoubleArray *) NIL_CHK(yCoefs2)) doubleAtIndex:2]) + (3 * t * t * [((IOSDoubleArray *) NIL_CHK(yCoefs1)) doubleAtIndex:0] + 2 * t * [((IOSDoubleArray *) NIL_CHK(yCoefs1)) doubleAtIndex:1] + [((IOSDoubleArray *) NIL_CHK(yCoefs1)) doubleAtIndex:2]) * (3 * s * s * [((IOSDoubleArray *) NIL_CHK(xCoefs2)) doubleAtIndex:0] + 2 * s * [((IOSDoubleArray *) NIL_CHK(xCoefs2)) doubleAtIndex:1] + [((IOSDoubleArray *) NIL_CHK(xCoefs2)) doubleAtIndex:2]);
    dt = (t * t * t * [((IOSDoubleArray *) NIL_CHK(xCoefs1)) doubleAtIndex:0] + t * t * [((IOSDoubleArray *) NIL_CHK(xCoefs1)) doubleAtIndex:1] + t * [((IOSDoubleArray *) NIL_CHK(xCoefs1)) doubleAtIndex:2] + [((IOSDoubleArray *) NIL_CHK(xCoefs1)) doubleAtIndex:3] - s * s * s * [((IOSDoubleArray *) NIL_CHK(xCoefs2)) doubleAtIndex:0] - s * s * [((IOSDoubleArray *) NIL_CHK(xCoefs2)) doubleAtIndex:1] - s * [((IOSDoubleArray *) NIL_CHK(xCoefs2)) doubleAtIndex:2] - [((IOSDoubleArray *) NIL_CHK(xCoefs2)) doubleAtIndex:3]) * (-3 * s * s * [((IOSDoubleArray *) NIL_CHK(yCoefs2)) doubleAtIndex:0] - 2 * s * [((IOSDoubleArray *) NIL_CHK(yCoefs2)) doubleAtIndex:1] - [((IOSDoubleArray *) NIL_CHK(yCoefs2)) doubleAtIndex:2]) + (t * t * t * [((IOSDoubleArray *) NIL_CHK(yCoefs1)) doubleAtIndex:0] + t * t * [((IOSDoubleArray *) NIL_CHK(yCoefs1)) doubleAtIndex:1] + t * [((IOSDoubleArray *) NIL_CHK(yCoefs1)) doubleAtIndex:2] + [((IOSDoubleArray *) NIL_CHK(yCoefs1)) doubleAtIndex:3] - s * s * s * [((IOSDoubleArray *) NIL_CHK(yCoefs2)) doubleAtIndex:0] - s * s * [((IOSDoubleArray *) NIL_CHK(yCoefs2)) doubleAtIndex:1] - s * [((IOSDoubleArray *) NIL_CHK(yCoefs2)) doubleAtIndex:2] - [((IOSDoubleArray *) NIL_CHK(yCoefs2)) doubleAtIndex:3]) * (3 * s * s * [((IOSDoubleArray *) NIL_CHK(xCoefs2)) doubleAtIndex:0] + 2 * s * [((IOSDoubleArray *) NIL_CHK(xCoefs2)) doubleAtIndex:1] + [((IOSDoubleArray *) NIL_CHK(xCoefs2)) doubleAtIndex:2]);
    ds = (3 * t * t * [((IOSDoubleArray *) NIL_CHK(xCoefs1)) doubleAtIndex:0] + 2 * t * [((IOSDoubleArray *) NIL_CHK(xCoefs1)) doubleAtIndex:1] + [((IOSDoubleArray *) NIL_CHK(xCoefs1)) doubleAtIndex:2]) * (t * t * t * [((IOSDoubleArray *) NIL_CHK(yCoefs1)) doubleAtIndex:0] + t * t * [((IOSDoubleArray *) NIL_CHK(yCoefs1)) doubleAtIndex:1] + t * [((IOSDoubleArray *) NIL_CHK(yCoefs1)) doubleAtIndex:2] + [((IOSDoubleArray *) NIL_CHK(yCoefs1)) doubleAtIndex:3] - s * s * s * [((IOSDoubleArray *) NIL_CHK(yCoefs2)) doubleAtIndex:0] - s * s * [((IOSDoubleArray *) NIL_CHK(yCoefs2)) doubleAtIndex:1] - s * [((IOSDoubleArray *) NIL_CHK(yCoefs2)) doubleAtIndex:2] - [((IOSDoubleArray *) NIL_CHK(yCoefs2)) doubleAtIndex:3]) - (3 * t * t * [((IOSDoubleArray *) NIL_CHK(yCoefs1)) doubleAtIndex:0] + 2 * t * [((IOSDoubleArray *) NIL_CHK(yCoefs1)) doubleAtIndex:1] + [((IOSDoubleArray *) NIL_CHK(yCoefs1)) doubleAtIndex:2]) * (t * t * t * [((IOSDoubleArray *) NIL_CHK(xCoefs1)) doubleAtIndex:0] + t * t * [((IOSDoubleArray *) NIL_CHK(xCoefs1)) doubleAtIndex:1] + t * [((IOSDoubleArray *) NIL_CHK(xCoefs1)) doubleAtIndex:2] + [((IOSDoubleArray *) NIL_CHK(xCoefs1)) doubleAtIndex:3] - s * s * s * [((IOSDoubleArray *) NIL_CHK(xCoefs2)) doubleAtIndex:0] - s * s * [((IOSDoubleArray *) NIL_CHK(xCoefs2)) doubleAtIndex:1] - s * [((IOSDoubleArray *) NIL_CHK(xCoefs2)) doubleAtIndex:2] - [((IOSDoubleArray *) NIL_CHK(xCoefs2)) doubleAtIndex:3]);
    t1 = t - dt / d;
    s1 = s - ds / d;
  }
  [((IOSDoubleArray *) NIL_CHK(params)) replaceDoubleAtIndex:0 withDouble:t1];
  [((IOSDoubleArray *) NIL_CHK(params)) replaceDoubleAtIndex:1 withDouble:s1];
}

+ (void)quadAndCubicNewtonWithJavaLangDoubleArray:(IOSDoubleArray *)xCoefs1
                          withJavaLangDoubleArray:(IOSDoubleArray *)yCoefs1
                          withJavaLangDoubleArray:(IOSDoubleArray *)xCoefs2
                          withJavaLangDoubleArray:(IOSDoubleArray *)yCoefs2
                          withJavaLangDoubleArray:(IOSDoubleArray *)params {
  double t = 0.0f, s = 0.0f;
  double t1 = [((IOSDoubleArray *) NIL_CHK(params)) doubleAtIndex:0];
  double s1 = [((IOSDoubleArray *) NIL_CHK(params)) doubleAtIndex:1];
  double d, dt, ds;
  while ([JavaLangMath sqrtWithDouble:(t - t1) * (t - t1) + (s - s1) * (s - s1)] > PythagorasDGeometryUtil_EPSILON_) {
    d = -(2 * t * [((IOSDoubleArray *) NIL_CHK(xCoefs1)) doubleAtIndex:0] + [((IOSDoubleArray *) NIL_CHK(xCoefs1)) doubleAtIndex:1]) * (3 * s * s * [((IOSDoubleArray *) NIL_CHK(yCoefs2)) doubleAtIndex:0] + 2 * s * [((IOSDoubleArray *) NIL_CHK(yCoefs2)) doubleAtIndex:1] + [((IOSDoubleArray *) NIL_CHK(yCoefs2)) doubleAtIndex:2]) + (2 * t * [((IOSDoubleArray *) NIL_CHK(yCoefs1)) doubleAtIndex:0] + [((IOSDoubleArray *) NIL_CHK(yCoefs1)) doubleAtIndex:1]) * (3 * s * s * [((IOSDoubleArray *) NIL_CHK(xCoefs2)) doubleAtIndex:0] + 2 * s * [((IOSDoubleArray *) NIL_CHK(xCoefs2)) doubleAtIndex:1] + [((IOSDoubleArray *) NIL_CHK(xCoefs2)) doubleAtIndex:2]);
    dt = (t * t * [((IOSDoubleArray *) NIL_CHK(xCoefs1)) doubleAtIndex:0] + t * [((IOSDoubleArray *) NIL_CHK(xCoefs1)) doubleAtIndex:1] + [((IOSDoubleArray *) NIL_CHK(xCoefs1)) doubleAtIndex:2] + -s * s * s * [((IOSDoubleArray *) NIL_CHK(xCoefs2)) doubleAtIndex:0] - s * s * [((IOSDoubleArray *) NIL_CHK(xCoefs2)) doubleAtIndex:1] - s * [((IOSDoubleArray *) NIL_CHK(xCoefs2)) doubleAtIndex:2] - [((IOSDoubleArray *) NIL_CHK(xCoefs2)) doubleAtIndex:3]) * (-3 * s * s * [((IOSDoubleArray *) NIL_CHK(yCoefs2)) doubleAtIndex:0] - 2 * s * [((IOSDoubleArray *) NIL_CHK(yCoefs2)) doubleAtIndex:1] - [((IOSDoubleArray *) NIL_CHK(yCoefs2)) doubleAtIndex:2]) + (t * t * [((IOSDoubleArray *) NIL_CHK(yCoefs1)) doubleAtIndex:0] + t * [((IOSDoubleArray *) NIL_CHK(yCoefs1)) doubleAtIndex:1] + [((IOSDoubleArray *) NIL_CHK(yCoefs1)) doubleAtIndex:2] - s * s * s * [((IOSDoubleArray *) NIL_CHK(yCoefs2)) doubleAtIndex:0] - s * s * [((IOSDoubleArray *) NIL_CHK(yCoefs2)) doubleAtIndex:1] - s * [((IOSDoubleArray *) NIL_CHK(yCoefs2)) doubleAtIndex:2] - [((IOSDoubleArray *) NIL_CHK(yCoefs2)) doubleAtIndex:3]) * (3 * s * s * [((IOSDoubleArray *) NIL_CHK(xCoefs2)) doubleAtIndex:0] + 2 * s * [((IOSDoubleArray *) NIL_CHK(xCoefs2)) doubleAtIndex:1] + [((IOSDoubleArray *) NIL_CHK(xCoefs2)) doubleAtIndex:2]);
    ds = (2 * t * [((IOSDoubleArray *) NIL_CHK(xCoefs1)) doubleAtIndex:0] + [((IOSDoubleArray *) NIL_CHK(xCoefs1)) doubleAtIndex:1]) * (t * t * [((IOSDoubleArray *) NIL_CHK(yCoefs1)) doubleAtIndex:0] + t * [((IOSDoubleArray *) NIL_CHK(yCoefs1)) doubleAtIndex:1] + [((IOSDoubleArray *) NIL_CHK(yCoefs1)) doubleAtIndex:2] - s * s * s * [((IOSDoubleArray *) NIL_CHK(yCoefs2)) doubleAtIndex:0] - s * s * [((IOSDoubleArray *) NIL_CHK(yCoefs2)) doubleAtIndex:1] - s * [((IOSDoubleArray *) NIL_CHK(yCoefs2)) doubleAtIndex:2] - [((IOSDoubleArray *) NIL_CHK(yCoefs2)) doubleAtIndex:3]) - (2 * t * [((IOSDoubleArray *) NIL_CHK(yCoefs1)) doubleAtIndex:0] + [((IOSDoubleArray *) NIL_CHK(yCoefs1)) doubleAtIndex:1]) * (t * t * [((IOSDoubleArray *) NIL_CHK(xCoefs1)) doubleAtIndex:0] + t * [((IOSDoubleArray *) NIL_CHK(xCoefs1)) doubleAtIndex:1] + [((IOSDoubleArray *) NIL_CHK(xCoefs1)) doubleAtIndex:2] - s * s * s * [((IOSDoubleArray *) NIL_CHK(xCoefs2)) doubleAtIndex:0] - s * s * [((IOSDoubleArray *) NIL_CHK(xCoefs2)) doubleAtIndex:1] - s * [((IOSDoubleArray *) NIL_CHK(xCoefs2)) doubleAtIndex:2] - [((IOSDoubleArray *) NIL_CHK(xCoefs2)) doubleAtIndex:3]);
    t1 = t - dt / d;
    s1 = s - ds / d;
  }
  [((IOSDoubleArray *) NIL_CHK(params)) replaceDoubleAtIndex:0 withDouble:t1];
  [((IOSDoubleArray *) NIL_CHK(params)) replaceDoubleAtIndex:1 withDouble:s1];
}

+ (void)quadNewtonWithJavaLangDoubleArray:(IOSDoubleArray *)xCoefs1
                  withJavaLangDoubleArray:(IOSDoubleArray *)yCoefs1
                  withJavaLangDoubleArray:(IOSDoubleArray *)xCoefs2
                  withJavaLangDoubleArray:(IOSDoubleArray *)yCoefs2
                  withJavaLangDoubleArray:(IOSDoubleArray *)params {
  double t = 0.0f, s = 0.0f;
  double t1 = [((IOSDoubleArray *) NIL_CHK(params)) doubleAtIndex:0];
  double s1 = [((IOSDoubleArray *) NIL_CHK(params)) doubleAtIndex:1];
  double d, dt, ds;
  while ([JavaLangMath sqrtWithDouble:(t - t1) * (t - t1) + (s - s1) * (s - s1)] > PythagorasDGeometryUtil_EPSILON_) {
    t = t1;
    s = s1;
    d = -(2 * t * [((IOSDoubleArray *) NIL_CHK(xCoefs1)) doubleAtIndex:0] + [((IOSDoubleArray *) NIL_CHK(xCoefs1)) doubleAtIndex:1]) * (2 * s * [((IOSDoubleArray *) NIL_CHK(yCoefs2)) doubleAtIndex:0] + [((IOSDoubleArray *) NIL_CHK(yCoefs2)) doubleAtIndex:1]) + (2 * s * [((IOSDoubleArray *) NIL_CHK(xCoefs2)) doubleAtIndex:0] + [((IOSDoubleArray *) NIL_CHK(xCoefs2)) doubleAtIndex:1]) * (2 * t * [((IOSDoubleArray *) NIL_CHK(yCoefs1)) doubleAtIndex:0] + [((IOSDoubleArray *) NIL_CHK(yCoefs1)) doubleAtIndex:1]);
    dt = -(t * t * [((IOSDoubleArray *) NIL_CHK(xCoefs1)) doubleAtIndex:0] + t * [((IOSDoubleArray *) NIL_CHK(xCoefs1)) doubleAtIndex:1] + [((IOSDoubleArray *) NIL_CHK(xCoefs1)) doubleAtIndex:1] - s * s * [((IOSDoubleArray *) NIL_CHK(xCoefs2)) doubleAtIndex:0] - s * [((IOSDoubleArray *) NIL_CHK(xCoefs2)) doubleAtIndex:1] - [((IOSDoubleArray *) NIL_CHK(xCoefs2)) doubleAtIndex:2]) * (2 * s * [((IOSDoubleArray *) NIL_CHK(yCoefs2)) doubleAtIndex:0] + [((IOSDoubleArray *) NIL_CHK(yCoefs2)) doubleAtIndex:1]) + (2 * s * [((IOSDoubleArray *) NIL_CHK(xCoefs2)) doubleAtIndex:0] + [((IOSDoubleArray *) NIL_CHK(xCoefs2)) doubleAtIndex:1]) * (t * t * [((IOSDoubleArray *) NIL_CHK(yCoefs1)) doubleAtIndex:0] + t * [((IOSDoubleArray *) NIL_CHK(yCoefs1)) doubleAtIndex:1] + [((IOSDoubleArray *) NIL_CHK(yCoefs1)) doubleAtIndex:2] - s * s * [((IOSDoubleArray *) NIL_CHK(yCoefs2)) doubleAtIndex:0] - s * [((IOSDoubleArray *) NIL_CHK(yCoefs2)) doubleAtIndex:1] - [((IOSDoubleArray *) NIL_CHK(yCoefs2)) doubleAtIndex:2]);
    ds = (2 * t * [((IOSDoubleArray *) NIL_CHK(xCoefs1)) doubleAtIndex:0] + [((IOSDoubleArray *) NIL_CHK(xCoefs1)) doubleAtIndex:1]) * (t * t * [((IOSDoubleArray *) NIL_CHK(yCoefs1)) doubleAtIndex:0] + t * [((IOSDoubleArray *) NIL_CHK(yCoefs1)) doubleAtIndex:1] + [((IOSDoubleArray *) NIL_CHK(yCoefs1)) doubleAtIndex:2] - s * s * [((IOSDoubleArray *) NIL_CHK(yCoefs2)) doubleAtIndex:0] - s * [((IOSDoubleArray *) NIL_CHK(yCoefs2)) doubleAtIndex:1] - [((IOSDoubleArray *) NIL_CHK(yCoefs2)) doubleAtIndex:2]) - (2 * t * [((IOSDoubleArray *) NIL_CHK(yCoefs1)) doubleAtIndex:0] + [((IOSDoubleArray *) NIL_CHK(yCoefs1)) doubleAtIndex:1]) * (t * t * [((IOSDoubleArray *) NIL_CHK(xCoefs1)) doubleAtIndex:0] + t * [((IOSDoubleArray *) NIL_CHK(xCoefs1)) doubleAtIndex:1] + [((IOSDoubleArray *) NIL_CHK(xCoefs1)) doubleAtIndex:2] - s * s * [((IOSDoubleArray *) NIL_CHK(xCoefs2)) doubleAtIndex:0] - s * [((IOSDoubleArray *) NIL_CHK(xCoefs2)) doubleAtIndex:1] - [((IOSDoubleArray *) NIL_CHK(xCoefs2)) doubleAtIndex:2]);
    t1 = t - dt / d;
    s1 = s - ds / d;
  }
  [((IOSDoubleArray *) NIL_CHK(params)) replaceDoubleAtIndex:0 withDouble:t1];
  [((IOSDoubleArray *) NIL_CHK(params)) replaceDoubleAtIndex:1 withDouble:s1];
}

- (id)init {
  return [super init];
}

+ (void)initialize {
  if (self == [PythagorasDGeometryUtil class]) {
    PythagorasDGeometryUtil_EPSILON_ = [JavaLangMath powWithDouble:10 withDouble:-14];
  }
}

- (void)dealloc {
  [super dealloc];
}

@end
