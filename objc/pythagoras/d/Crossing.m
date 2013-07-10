//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: pythagoras/d/Crossing.java
//
//  Created by Thomas on 7/9/13.
//

#import "IOSClass.h"
#import "IOSDoubleArray.h"
#import "java/lang/Math.h"
#import "pythagoras/d/IShape.h"
#import "pythagoras/d/PathIterator.h"
#import "pythagoras/d/Rectangle.h"
#import "Crossing.h"

@implementation PythagorasDCrossing

+ (int)CROSSING {
  return PythagorasDCrossing_CROSSING;
}

+ (int)UNKNOWN {
  return PythagorasDCrossing_UNKNOWN;
}

+ (double)DELTA {
  return PythagorasDCrossing_DELTA;
}

+ (double)ROOT_DELTA {
  return PythagorasDCrossing_ROOT_DELTA;
}

+ (int)solveQuadWithJavaLangDoubleArray:(IOSDoubleArray *)eqn
                withJavaLangDoubleArray:(IOSDoubleArray *)res {
  double a = [((IOSDoubleArray *) NIL_CHK(eqn)) doubleAtIndex:2];
  double b = [((IOSDoubleArray *) NIL_CHK(eqn)) doubleAtIndex:1];
  double c = [((IOSDoubleArray *) NIL_CHK(eqn)) doubleAtIndex:0];
  int rc = 0;
  if (a == 0.0f) {
    if (b == 0.0f) {
      return -1;
    }
    [((IOSDoubleArray *) NIL_CHK(res)) replaceDoubleAtIndex:rc++ withDouble:-c / b];
  }
  else {
    double d = b * b - 4.0f * a * c;
    if (d < 0.0f) {
      return 0;
    }
    d = [JavaLangMath sqrtWithDouble:d];
    [((IOSDoubleArray *) NIL_CHK(res)) replaceDoubleAtIndex:rc++ withDouble:(-b + d) / (a * 2.0f)];
    if (d != 0.0f) {
      [((IOSDoubleArray *) NIL_CHK(res)) replaceDoubleAtIndex:rc++ withDouble:(-b - d) / (a * 2.0f)];
    }
  }
  return [PythagorasDCrossing fixRootsWithJavaLangDoubleArray:res withInt:rc];
}

+ (int)solveCubicWithJavaLangDoubleArray:(IOSDoubleArray *)eqn
                 withJavaLangDoubleArray:(IOSDoubleArray *)res {
  double d = [((IOSDoubleArray *) NIL_CHK(eqn)) doubleAtIndex:3];
  if (d == 0) {
    return [PythagorasDCrossing solveQuadWithJavaLangDoubleArray:eqn withJavaLangDoubleArray:res];
  }
  double a = [((IOSDoubleArray *) NIL_CHK(eqn)) doubleAtIndex:2] / d;
  double b = [((IOSDoubleArray *) NIL_CHK(eqn)) doubleAtIndex:1] / d;
  double c = [((IOSDoubleArray *) NIL_CHK(eqn)) doubleAtIndex:0] / d;
  int rc = 0;
  double Q = (a * a - 3.0f * b) / 9.0f;
  double R = (2.0f * a * a * a - 9.0f * a * b + 27.0f * c) / 54.0f;
  double Q3 = Q * Q * Q;
  double R2 = R * R;
  double n = -a / 3.0f;
  if (R2 < Q3) {
    double t = [JavaLangMath acosWithDouble:R / [JavaLangMath sqrtWithDouble:Q3]] / 3.0f;
    double p = 2.0f * JavaLangMath_PI / 3.0f;
    double m = -2.0f * [JavaLangMath sqrtWithDouble:Q];
    [((IOSDoubleArray *) NIL_CHK(res)) replaceDoubleAtIndex:rc++ withDouble:m * [JavaLangMath cosWithDouble:t] + n];
    [((IOSDoubleArray *) NIL_CHK(res)) replaceDoubleAtIndex:rc++ withDouble:m * [JavaLangMath cosWithDouble:t + p] + n];
    [((IOSDoubleArray *) NIL_CHK(res)) replaceDoubleAtIndex:rc++ withDouble:m * [JavaLangMath cosWithDouble:t - p] + n];
  }
  else {
    double A = [JavaLangMath powWithDouble:[JavaLangMath absWithDouble:R] + [JavaLangMath sqrtWithDouble:R2 - Q3] withDouble:1.0f / 3.0f];
    if (R > 0.0f) {
      A = -A;
    }
    if (-PythagorasDCrossing_ROOT_DELTA < A && A < PythagorasDCrossing_ROOT_DELTA) {
      [((IOSDoubleArray *) NIL_CHK(res)) replaceDoubleAtIndex:rc++ withDouble:n];
    }
    else {
      double B = Q / A;
      [((IOSDoubleArray *) NIL_CHK(res)) replaceDoubleAtIndex:rc++ withDouble:A + B + n];
      double delta = R2 - Q3;
      if (-PythagorasDCrossing_ROOT_DELTA < delta && delta < PythagorasDCrossing_ROOT_DELTA) {
        [((IOSDoubleArray *) NIL_CHK(res)) replaceDoubleAtIndex:rc++ withDouble:-(A + B) / 2.0f + n];
      }
    }
  }
  return [PythagorasDCrossing fixRootsWithJavaLangDoubleArray:res withInt:rc];
}

+ (int)fixRootsWithJavaLangDoubleArray:(IOSDoubleArray *)res
                               withInt:(int)rc {
  int tc = 0;
  for (int i = 0; i < rc; i++) {
    out: {
      for (int j = i + 1; j < rc; j++) {
        if ([PythagorasDCrossing isZeroWithDouble:[((IOSDoubleArray *) NIL_CHK(res)) doubleAtIndex:i] - [((IOSDoubleArray *) NIL_CHK(res)) doubleAtIndex:j]]) {
          goto out;
        }
      }
      [((IOSDoubleArray *) NIL_CHK(res)) replaceDoubleAtIndex:tc++ withDouble:[((IOSDoubleArray *) NIL_CHK(res)) doubleAtIndex:i]];
    }
  }
  return tc;
}

+ (int)crossLineWithDouble:(double)x1
                withDouble:(double)y1
                withDouble:(double)x2
                withDouble:(double)y2
                withDouble:(double)x
                withDouble:(double)y {
  if ((x < x1 && x < x2) || (x > x1 && x > x2) || (y > y1 && y > y2) || (x1 == x2)) {
    return 0;
  }
  if (y < y1 && y < y2) {
  }
  else {
    if ((y2 - y1) * (x - x1) / (x2 - x1) <= y - y1) {
      return 0;
    }
  }
  if (x == x1) {
    return x1 < x2 ? 0 : -1;
  }
  if (x == x2) {
    return x1 < x2 ? 1 : 0;
  }
  return x1 < x2 ? 1 : -1;
}

+ (int)crossQuadWithDouble:(double)x1
                withDouble:(double)y1
                withDouble:(double)cx
                withDouble:(double)cy
                withDouble:(double)x2
                withDouble:(double)y2
                withDouble:(double)x
                withDouble:(double)y {
  if ((x < x1 && x < cx && x < x2) || (x > x1 && x > cx && x > x2) || (y > y1 && y > cy && y > y2) || (x1 == cx && cx == x2)) {
    return 0;
  }
  if (y < y1 && y < cy && y < y2 && x != x1 && x != x2) {
    if (x1 < x2) {
      return x1 < x && x < x2 ? 1 : 0;
    }
    return x2 < x && x < x1 ? -1 : 0;
  }
  PythagorasDCrossing_QuadCurve *c = [[[PythagorasDCrossing_QuadCurve alloc] initWithDouble:x1 withDouble:y1 withDouble:cx withDouble:cy withDouble:x2 withDouble:y2] autorelease];
  double px = x - x1, py = y - y1;
  IOSDoubleArray *res = [[[IOSDoubleArray alloc] initWithLength:3] autorelease];
  int rc = [((PythagorasDCrossing_QuadCurve *) NIL_CHK(c)) solvePointWithJavaLangDoubleArray:res withDouble:px];
  return [((PythagorasDCrossing_QuadCurve *) NIL_CHK(c)) crossWithJavaLangDoubleArray:res withInt:rc withDouble:py withDouble:py];
}

+ (int)crossCubicWithDouble:(double)x1
                 withDouble:(double)y1
                 withDouble:(double)cx1
                 withDouble:(double)cy1
                 withDouble:(double)cx2
                 withDouble:(double)cy2
                 withDouble:(double)x2
                 withDouble:(double)y2
                 withDouble:(double)x
                 withDouble:(double)y {
  if ((x < x1 && x < cx1 && x < cx2 && x < x2) || (x > x1 && x > cx1 && x > cx2 && x > x2) || (y > y1 && y > cy1 && y > cy2 && y > y2) || (x1 == cx1 && cx1 == cx2 && cx2 == x2)) {
    return 0;
  }
  if (y < y1 && y < cy1 && y < cy2 && y < y2 && x != x1 && x != x2) {
    if (x1 < x2) {
      return x1 < x && x < x2 ? 1 : 0;
    }
    return x2 < x && x < x1 ? -1 : 0;
  }
  PythagorasDCrossing_CubicCurveH *c = [[[PythagorasDCrossing_CubicCurveH alloc] initWithDouble:x1 withDouble:y1 withDouble:cx1 withDouble:cy1 withDouble:cx2 withDouble:cy2 withDouble:x2 withDouble:y2] autorelease];
  double px = x - x1, py = y - y1;
  IOSDoubleArray *res = [[[IOSDoubleArray alloc] initWithLength:3] autorelease];
  int rc = [((PythagorasDCrossing_CubicCurveH *) NIL_CHK(c)) solvePointWithJavaLangDoubleArray:res withDouble:px];
  return [((PythagorasDCrossing_CubicCurveH *) NIL_CHK(c)) crossWithJavaLangDoubleArray:res withInt:rc withDouble:py withDouble:py];
}

+ (int)crossPathWithPythagorasDPathIterator:(id<PythagorasDPathIterator>)p
                                 withDouble:(double)x
                                 withDouble:(double)y {
  int cross = 0;
  double mx, my, cx, cy;
  mx = my = cx = cy = 0.0f;
  IOSDoubleArray *coords = [[[IOSDoubleArray alloc] initWithLength:6] autorelease];
  while (![((id<PythagorasDPathIterator>) NIL_CHK(p)) isDone]) {
    switch ([((id<PythagorasDPathIterator>) NIL_CHK(p)) currentSegmentWithJavaLangDoubleArray:coords]) {
      case PythagorasDPathIterator_SEG_MOVETO:
      if (cx != mx || cy != my) {
        cross += [PythagorasDCrossing crossLineWithDouble:cx withDouble:cy withDouble:mx withDouble:my withDouble:x withDouble:y];
      }
      mx = cx = [((IOSDoubleArray *) NIL_CHK(coords)) doubleAtIndex:0];
      my = cy = [((IOSDoubleArray *) NIL_CHK(coords)) doubleAtIndex:1];
      break;
      case PythagorasDPathIterator_SEG_LINETO:
      cross += [PythagorasDCrossing crossLineWithDouble:cx withDouble:cy withDouble:cx = [((IOSDoubleArray *) NIL_CHK(coords)) doubleAtIndex:0] withDouble:cy = [((IOSDoubleArray *) NIL_CHK(coords)) doubleAtIndex:1] withDouble:x withDouble:y];
      break;
      case PythagorasDPathIterator_SEG_QUADTO:
      cross += [PythagorasDCrossing crossQuadWithDouble:cx withDouble:cy withDouble:[((IOSDoubleArray *) NIL_CHK(coords)) doubleAtIndex:0] withDouble:[((IOSDoubleArray *) NIL_CHK(coords)) doubleAtIndex:1] withDouble:cx = [((IOSDoubleArray *) NIL_CHK(coords)) doubleAtIndex:2] withDouble:cy = [((IOSDoubleArray *) NIL_CHK(coords)) doubleAtIndex:3] withDouble:x withDouble:y];
      break;
      case PythagorasDPathIterator_SEG_CUBICTO:
      cross += [PythagorasDCrossing crossCubicWithDouble:cx withDouble:cy withDouble:[((IOSDoubleArray *) NIL_CHK(coords)) doubleAtIndex:0] withDouble:[((IOSDoubleArray *) NIL_CHK(coords)) doubleAtIndex:1] withDouble:[((IOSDoubleArray *) NIL_CHK(coords)) doubleAtIndex:2] withDouble:[((IOSDoubleArray *) NIL_CHK(coords)) doubleAtIndex:3] withDouble:cx = [((IOSDoubleArray *) NIL_CHK(coords)) doubleAtIndex:4] withDouble:cy = [((IOSDoubleArray *) NIL_CHK(coords)) doubleAtIndex:5] withDouble:x withDouble:y];
      break;
      case PythagorasDPathIterator_SEG_CLOSE:
      if (cy != my || cx != mx) {
        cross += [PythagorasDCrossing crossLineWithDouble:cx withDouble:cy withDouble:cx = mx withDouble:cy = my withDouble:x withDouble:y];
      }
      break;
    }
    if (x == cx && y == cy) {
      cross = 0;
      cy = my;
      break;
    }
    [((id<PythagorasDPathIterator>) NIL_CHK(p)) next];
  }
  if (cy != my) {
    cross += [PythagorasDCrossing crossLineWithDouble:cx withDouble:cy withDouble:mx withDouble:my withDouble:x withDouble:y];
  }
  return cross;
}

+ (int)crossShapeWithPythagorasDIShape:(id<PythagorasDIShape>)s
                            withDouble:(double)x
                            withDouble:(double)y {
  if (![[((id<PythagorasDIShape>) NIL_CHK(s)) bounds] containsWithDouble:x withDouble:y]) {
    return 0;
  }
  return [PythagorasDCrossing crossPathWithPythagorasDPathIterator:[((id<PythagorasDIShape>) NIL_CHK(s)) pathIteratorWithPythagorasDTransform:nil] withDouble:x withDouble:y];
}

+ (BOOL)isZeroWithDouble:(double)val {
  return -PythagorasDCrossing_DELTA < val && val < PythagorasDCrossing_DELTA;
}

+ (int)intersectLineWithDouble:(double)x1
                    withDouble:(double)y1
                    withDouble:(double)x2
                    withDouble:(double)y2
                    withDouble:(double)rx1
                    withDouble:(double)ry1
                    withDouble:(double)rx2
                    withDouble:(double)ry2 {
  if ((rx2 < x1 && rx2 < x2) || (rx1 > x1 && rx1 > x2) || (ry1 > y1 && ry1 > y2)) {
    return 0;
  }
  if (ry2 < y1 && ry2 < y2) {
  }
  else {
    if (x1 == x2) {
      return PythagorasDCrossing_CROSSING;
    }
    double bx1, bx2;
    if (x1 < x2) {
      bx1 = x1 < rx1 ? rx1 : x1;
      bx2 = x2 < rx2 ? x2 : rx2;
    }
    else {
      bx1 = x2 < rx1 ? rx1 : x2;
      bx2 = x1 < rx2 ? x1 : rx2;
    }
    double k = (y2 - y1) / (x2 - x1);
    double by1 = k * (bx1 - x1) + y1;
    double by2 = k * (bx2 - x1) + y1;
    if (by1 < ry1 && by2 < ry1) {
      return 0;
    }
    if (by1 > ry2 && by2 > ry2) {
    }
    else {
      return PythagorasDCrossing_CROSSING;
    }
  }
  if (x1 == x2) {
    return 0;
  }
  if (rx1 == x1) {
    return x1 < x2 ? 0 : -1;
  }
  if (rx1 == x2) {
    return x1 < x2 ? 1 : 0;
  }
  if (x1 < x2) {
    return x1 < rx1 && rx1 < x2 ? 1 : 0;
  }
  return x2 < rx1 && rx1 < x1 ? -1 : 0;
}

+ (int)intersectQuadWithDouble:(double)x1
                    withDouble:(double)y1
                    withDouble:(double)cx
                    withDouble:(double)cy
                    withDouble:(double)x2
                    withDouble:(double)y2
                    withDouble:(double)rx1
                    withDouble:(double)ry1
                    withDouble:(double)rx2
                    withDouble:(double)ry2 {
  if ((rx2 < x1 && rx2 < cx && rx2 < x2) || (rx1 > x1 && rx1 > cx && rx1 > x2) || (ry1 > y1 && ry1 > cy && ry1 > y2)) {
    return 0;
  }
  if (ry2 < y1 && ry2 < cy && ry2 < y2 && rx1 != x1 && rx1 != x2) {
    if (x1 < x2) {
      return x1 < rx1 && rx1 < x2 ? 1 : 0;
    }
    return x2 < rx1 && rx1 < x1 ? -1 : 0;
  }
  PythagorasDCrossing_QuadCurve *c = [[[PythagorasDCrossing_QuadCurve alloc] initWithDouble:x1 withDouble:y1 withDouble:cx withDouble:cy withDouble:x2 withDouble:y2] autorelease];
  double px1 = rx1 - x1;
  double py1 = ry1 - y1;
  double px2 = rx2 - x1;
  double py2 = ry2 - y1;
  IOSDoubleArray *res1 = [[[IOSDoubleArray alloc] initWithLength:3] autorelease];
  IOSDoubleArray *res2 = [[[IOSDoubleArray alloc] initWithLength:3] autorelease];
  int rc1 = [((PythagorasDCrossing_QuadCurve *) NIL_CHK(c)) solvePointWithJavaLangDoubleArray:res1 withDouble:px1];
  int rc2 = [((PythagorasDCrossing_QuadCurve *) NIL_CHK(c)) solvePointWithJavaLangDoubleArray:res2 withDouble:px2];
  if (rc1 == 0 && rc2 == 0) {
    return 0;
  }
  double minX = px1 - PythagorasDCrossing_DELTA;
  double maxX = px2 + PythagorasDCrossing_DELTA;
  IOSDoubleArray *bound = [[[IOSDoubleArray alloc] initWithLength:28] autorelease];
  int bc = 0;
  bc = [((PythagorasDCrossing_QuadCurve *) NIL_CHK(c)) addBoundWithJavaLangDoubleArray:bound withInt:bc withJavaLangDoubleArray:res1 withInt:rc1 withDouble:minX withDouble:maxX withBOOL:NO withInt:0];
  bc = [((PythagorasDCrossing_QuadCurve *) NIL_CHK(c)) addBoundWithJavaLangDoubleArray:bound withInt:bc withJavaLangDoubleArray:res2 withInt:rc2 withDouble:minX withDouble:maxX withBOOL:NO withInt:1];
  rc2 = [((PythagorasDCrossing_QuadCurve *) NIL_CHK(c)) solveExtremeWithJavaLangDoubleArray:res2];
  bc = [((PythagorasDCrossing_QuadCurve *) NIL_CHK(c)) addBoundWithJavaLangDoubleArray:bound withInt:bc withJavaLangDoubleArray:res2 withInt:rc2 withDouble:minX withDouble:maxX withBOOL:YES withInt:2];
  if (rx1 < x1 && x1 < rx2) {
    [((IOSDoubleArray *) NIL_CHK(bound)) replaceDoubleAtIndex:bc++ withDouble:0.0f];
    [((IOSDoubleArray *) NIL_CHK(bound)) replaceDoubleAtIndex:bc++ withDouble:0.0f];
    [((IOSDoubleArray *) NIL_CHK(bound)) replaceDoubleAtIndex:bc++ withDouble:0.0f];
    [((IOSDoubleArray *) NIL_CHK(bound)) replaceDoubleAtIndex:bc++ withDouble:4];
  }
  if (rx1 < x2 && x2 < rx2) {
    [((IOSDoubleArray *) NIL_CHK(bound)) replaceDoubleAtIndex:bc++ withDouble:1.0f];
    [((IOSDoubleArray *) NIL_CHK(bound)) replaceDoubleAtIndex:bc++ withDouble:((PythagorasDCrossing_QuadCurve *) NIL_CHK(c)).ax];
    [((IOSDoubleArray *) NIL_CHK(bound)) replaceDoubleAtIndex:bc++ withDouble:((PythagorasDCrossing_QuadCurve *) NIL_CHK(c)).ay];
    [((IOSDoubleArray *) NIL_CHK(bound)) replaceDoubleAtIndex:bc++ withDouble:5];
  }
  int cross = [PythagorasDCrossing crossBoundWithJavaLangDoubleArray:bound withInt:bc withDouble:py1 withDouble:py2];
  if (cross != PythagorasDCrossing_UNKNOWN) {
    return cross;
  }
  return [((PythagorasDCrossing_QuadCurve *) NIL_CHK(c)) crossWithJavaLangDoubleArray:res1 withInt:rc1 withDouble:py1 withDouble:py2];
}

+ (int)intersectCubicWithDouble:(double)x1
                     withDouble:(double)y1
                     withDouble:(double)cx1
                     withDouble:(double)cy1
                     withDouble:(double)cx2
                     withDouble:(double)cy2
                     withDouble:(double)x2
                     withDouble:(double)y2
                     withDouble:(double)rx1
                     withDouble:(double)ry1
                     withDouble:(double)rx2
                     withDouble:(double)ry2 {
  if ((rx2 < x1 && rx2 < cx1 && rx2 < cx2 && rx2 < x2) || (rx1 > x1 && rx1 > cx1 && rx1 > cx2 && rx1 > x2) || (ry1 > y1 && ry1 > cy1 && ry1 > cy2 && ry1 > y2)) {
    return 0;
  }
  if (ry2 < y1 && ry2 < cy1 && ry2 < cy2 && ry2 < y2 && rx1 != x1 && rx1 != x2) {
    if (x1 < x2) {
      return x1 < rx1 && rx1 < x2 ? 1 : 0;
    }
    return x2 < rx1 && rx1 < x1 ? -1 : 0;
  }
  PythagorasDCrossing_CubicCurveH *c = [[[PythagorasDCrossing_CubicCurveH alloc] initWithDouble:x1 withDouble:y1 withDouble:cx1 withDouble:cy1 withDouble:cx2 withDouble:cy2 withDouble:x2 withDouble:y2] autorelease];
  double px1 = rx1 - x1;
  double py1 = ry1 - y1;
  double px2 = rx2 - x1;
  double py2 = ry2 - y1;
  IOSDoubleArray *res1 = [[[IOSDoubleArray alloc] initWithLength:3] autorelease];
  IOSDoubleArray *res2 = [[[IOSDoubleArray alloc] initWithLength:3] autorelease];
  int rc1 = [((PythagorasDCrossing_CubicCurveH *) NIL_CHK(c)) solvePointWithJavaLangDoubleArray:res1 withDouble:px1];
  int rc2 = [((PythagorasDCrossing_CubicCurveH *) NIL_CHK(c)) solvePointWithJavaLangDoubleArray:res2 withDouble:px2];
  if (rc1 == 0 && rc2 == 0) {
    return 0;
  }
  double minX = px1 - PythagorasDCrossing_DELTA;
  double maxX = px2 + PythagorasDCrossing_DELTA;
  IOSDoubleArray *bound = [[[IOSDoubleArray alloc] initWithLength:40] autorelease];
  int bc = 0;
  bc = [((PythagorasDCrossing_CubicCurveH *) NIL_CHK(c)) addBoundWithJavaLangDoubleArray:bound withInt:bc withJavaLangDoubleArray:res1 withInt:rc1 withDouble:minX withDouble:maxX withBOOL:NO withInt:0];
  bc = [((PythagorasDCrossing_CubicCurveH *) NIL_CHK(c)) addBoundWithJavaLangDoubleArray:bound withInt:bc withJavaLangDoubleArray:res2 withInt:rc2 withDouble:minX withDouble:maxX withBOOL:NO withInt:1];
  rc2 = [((PythagorasDCrossing_CubicCurveH *) NIL_CHK(c)) solveExtremeXWithJavaLangDoubleArray:res2];
  bc = [((PythagorasDCrossing_CubicCurveH *) NIL_CHK(c)) addBoundWithJavaLangDoubleArray:bound withInt:bc withJavaLangDoubleArray:res2 withInt:rc2 withDouble:minX withDouble:maxX withBOOL:YES withInt:2];
  rc2 = [((PythagorasDCrossing_CubicCurveH *) NIL_CHK(c)) solveExtremeYWithJavaLangDoubleArray:res2];
  bc = [((PythagorasDCrossing_CubicCurveH *) NIL_CHK(c)) addBoundWithJavaLangDoubleArray:bound withInt:bc withJavaLangDoubleArray:res2 withInt:rc2 withDouble:minX withDouble:maxX withBOOL:YES withInt:4];
  if (rx1 < x1 && x1 < rx2) {
    [((IOSDoubleArray *) NIL_CHK(bound)) replaceDoubleAtIndex:bc++ withDouble:0.0f];
    [((IOSDoubleArray *) NIL_CHK(bound)) replaceDoubleAtIndex:bc++ withDouble:0.0f];
    [((IOSDoubleArray *) NIL_CHK(bound)) replaceDoubleAtIndex:bc++ withDouble:0.0f];
    [((IOSDoubleArray *) NIL_CHK(bound)) replaceDoubleAtIndex:bc++ withDouble:6];
  }
  if (rx1 < x2 && x2 < rx2) {
    [((IOSDoubleArray *) NIL_CHK(bound)) replaceDoubleAtIndex:bc++ withDouble:1.0f];
    [((IOSDoubleArray *) NIL_CHK(bound)) replaceDoubleAtIndex:bc++ withDouble:((PythagorasDCrossing_CubicCurveH *) NIL_CHK(c)).ax];
    [((IOSDoubleArray *) NIL_CHK(bound)) replaceDoubleAtIndex:bc++ withDouble:((PythagorasDCrossing_CubicCurveH *) NIL_CHK(c)).ay];
    [((IOSDoubleArray *) NIL_CHK(bound)) replaceDoubleAtIndex:bc++ withDouble:7];
  }
  int cross = [PythagorasDCrossing crossBoundWithJavaLangDoubleArray:bound withInt:bc withDouble:py1 withDouble:py2];
  if (cross != PythagorasDCrossing_UNKNOWN) {
    return cross;
  }
  return [((PythagorasDCrossing_CubicCurveH *) NIL_CHK(c)) crossWithJavaLangDoubleArray:res1 withInt:rc1 withDouble:py1 withDouble:py2];
}

+ (int)intersectPathWithPythagorasDPathIterator:(id<PythagorasDPathIterator>)p
                                     withDouble:(double)x
                                     withDouble:(double)y
                                     withDouble:(double)w
                                     withDouble:(double)h {
  int cross = 0;
  int count;
  double mx, my, cx, cy;
  mx = my = cx = cy = 0.0f;
  IOSDoubleArray *coords = [[[IOSDoubleArray alloc] initWithLength:6] autorelease];
  double rx1 = x;
  double ry1 = y;
  double rx2 = x + w;
  double ry2 = y + h;
  while (![((id<PythagorasDPathIterator>) NIL_CHK(p)) isDone]) {
    count = 0;
    switch ([((id<PythagorasDPathIterator>) NIL_CHK(p)) currentSegmentWithJavaLangDoubleArray:coords]) {
      case PythagorasDPathIterator_SEG_MOVETO:
      if (cx != mx || cy != my) {
        count = [PythagorasDCrossing intersectLineWithDouble:cx withDouble:cy withDouble:mx withDouble:my withDouble:rx1 withDouble:ry1 withDouble:rx2 withDouble:ry2];
      }
      mx = cx = [((IOSDoubleArray *) NIL_CHK(coords)) doubleAtIndex:0];
      my = cy = [((IOSDoubleArray *) NIL_CHK(coords)) doubleAtIndex:1];
      break;
      case PythagorasDPathIterator_SEG_LINETO:
      count = [PythagorasDCrossing intersectLineWithDouble:cx withDouble:cy withDouble:cx = [((IOSDoubleArray *) NIL_CHK(coords)) doubleAtIndex:0] withDouble:cy = [((IOSDoubleArray *) NIL_CHK(coords)) doubleAtIndex:1] withDouble:rx1 withDouble:ry1 withDouble:rx2 withDouble:ry2];
      break;
      case PythagorasDPathIterator_SEG_QUADTO:
      count = [PythagorasDCrossing intersectQuadWithDouble:cx withDouble:cy withDouble:[((IOSDoubleArray *) NIL_CHK(coords)) doubleAtIndex:0] withDouble:[((IOSDoubleArray *) NIL_CHK(coords)) doubleAtIndex:1] withDouble:cx = [((IOSDoubleArray *) NIL_CHK(coords)) doubleAtIndex:2] withDouble:cy = [((IOSDoubleArray *) NIL_CHK(coords)) doubleAtIndex:3] withDouble:rx1 withDouble:ry1 withDouble:rx2 withDouble:ry2];
      break;
      case PythagorasDPathIterator_SEG_CUBICTO:
      count = [PythagorasDCrossing intersectCubicWithDouble:cx withDouble:cy withDouble:[((IOSDoubleArray *) NIL_CHK(coords)) doubleAtIndex:0] withDouble:[((IOSDoubleArray *) NIL_CHK(coords)) doubleAtIndex:1] withDouble:[((IOSDoubleArray *) NIL_CHK(coords)) doubleAtIndex:2] withDouble:[((IOSDoubleArray *) NIL_CHK(coords)) doubleAtIndex:3] withDouble:cx = [((IOSDoubleArray *) NIL_CHK(coords)) doubleAtIndex:4] withDouble:cy = [((IOSDoubleArray *) NIL_CHK(coords)) doubleAtIndex:5] withDouble:rx1 withDouble:ry1 withDouble:rx2 withDouble:ry2];
      break;
      case PythagorasDPathIterator_SEG_CLOSE:
      if (cy != my || cx != mx) {
        count = [PythagorasDCrossing intersectLineWithDouble:cx withDouble:cy withDouble:mx withDouble:my withDouble:rx1 withDouble:ry1 withDouble:rx2 withDouble:ry2];
      }
      cx = mx;
      cy = my;
      break;
    }
    if (count == PythagorasDCrossing_CROSSING) {
      return PythagorasDCrossing_CROSSING;
    }
    cross += count;
    [((id<PythagorasDPathIterator>) NIL_CHK(p)) next];
  }
  if (cy != my) {
    count = [PythagorasDCrossing intersectLineWithDouble:cx withDouble:cy withDouble:mx withDouble:my withDouble:rx1 withDouble:ry1 withDouble:rx2 withDouble:ry2];
    if (count == PythagorasDCrossing_CROSSING) {
      return PythagorasDCrossing_CROSSING;
    }
    cross += count;
  }
  return cross;
}

+ (int)intersectShapeWithPythagorasDIShape:(id<PythagorasDIShape>)s
                                withDouble:(double)x
                                withDouble:(double)y
                                withDouble:(double)w
                                withDouble:(double)h {
  if (![[((id<PythagorasDIShape>) NIL_CHK(s)) bounds] intersectsWithDouble:x withDouble:y withDouble:w withDouble:h]) {
    return 0;
  }
  return [PythagorasDCrossing intersectPathWithPythagorasDPathIterator:[((id<PythagorasDIShape>) NIL_CHK(s)) pathIteratorWithPythagorasDTransform:nil] withDouble:x withDouble:y withDouble:w withDouble:h];
}

+ (BOOL)isInsideNonZeroWithInt:(int)cross {
  return cross != 0;
}

+ (BOOL)isInsideEvenOddWithInt:(int)cross {
  return (cross & 1) != 0;
}

+ (void)sortBoundWithJavaLangDoubleArray:(IOSDoubleArray *)bound
                                 withInt:(int)bc {
  for (int i = 0; i < bc - 4; i += 4) {
    int k = i;
    for (int j = i + 4; j < bc; j += 4) {
      if ([((IOSDoubleArray *) NIL_CHK(bound)) doubleAtIndex:k] > [((IOSDoubleArray *) NIL_CHK(bound)) doubleAtIndex:j]) {
        k = j;
      }
    }
    if (k != i) {
      double tmp = [((IOSDoubleArray *) NIL_CHK(bound)) doubleAtIndex:i];
      [((IOSDoubleArray *) NIL_CHK(bound)) replaceDoubleAtIndex:i withDouble:[((IOSDoubleArray *) NIL_CHK(bound)) doubleAtIndex:k]];
      [((IOSDoubleArray *) NIL_CHK(bound)) replaceDoubleAtIndex:k withDouble:tmp];
      tmp = [((IOSDoubleArray *) NIL_CHK(bound)) doubleAtIndex:i + 1];
      [((IOSDoubleArray *) NIL_CHK(bound)) replaceDoubleAtIndex:i + 1 withDouble:[((IOSDoubleArray *) NIL_CHK(bound)) doubleAtIndex:k + 1]];
      [((IOSDoubleArray *) NIL_CHK(bound)) replaceDoubleAtIndex:k + 1 withDouble:tmp];
      tmp = [((IOSDoubleArray *) NIL_CHK(bound)) doubleAtIndex:i + 2];
      [((IOSDoubleArray *) NIL_CHK(bound)) replaceDoubleAtIndex:i + 2 withDouble:[((IOSDoubleArray *) NIL_CHK(bound)) doubleAtIndex:k + 2]];
      [((IOSDoubleArray *) NIL_CHK(bound)) replaceDoubleAtIndex:k + 2 withDouble:tmp];
      tmp = [((IOSDoubleArray *) NIL_CHK(bound)) doubleAtIndex:i + 3];
      [((IOSDoubleArray *) NIL_CHK(bound)) replaceDoubleAtIndex:i + 3 withDouble:[((IOSDoubleArray *) NIL_CHK(bound)) doubleAtIndex:k + 3]];
      [((IOSDoubleArray *) NIL_CHK(bound)) replaceDoubleAtIndex:k + 3 withDouble:tmp];
    }
  }
}

+ (int)crossBoundWithJavaLangDoubleArray:(IOSDoubleArray *)bound
                                 withInt:(int)bc
                              withDouble:(double)py1
                              withDouble:(double)py2 {
  if (bc == 0) {
    return 0;
  }
  int up = 0;
  int down = 0;
  for (int i = 2; i < bc; i += 4) {
    if ([((IOSDoubleArray *) NIL_CHK(bound)) doubleAtIndex:i] < py1) {
      up++;
      continue;
    }
    if ([((IOSDoubleArray *) NIL_CHK(bound)) doubleAtIndex:i] > py2) {
      down++;
      continue;
    }
    return PythagorasDCrossing_CROSSING;
  }
  if (down == 0) {
    return 0;
  }
  if (up != 0) {
    [PythagorasDCrossing sortBoundWithJavaLangDoubleArray:bound withInt:bc];
    BOOL sign = [((IOSDoubleArray *) NIL_CHK(bound)) doubleAtIndex:2] > py2;
    for (int i = 6; i < bc; i += 4) {
      BOOL sign2 = [((IOSDoubleArray *) NIL_CHK(bound)) doubleAtIndex:i] > py2;
      if (sign != sign2 && [((IOSDoubleArray *) NIL_CHK(bound)) doubleAtIndex:i + 1] != [((IOSDoubleArray *) NIL_CHK(bound)) doubleAtIndex:i - 3]) {
        return PythagorasDCrossing_CROSSING;
      }
      sign = sign2;
    }
  }
  return PythagorasDCrossing_UNKNOWN;
}

- (id)init {
  return [super init];
}

- (void)dealloc {
  [super dealloc];
}

@end
@implementation PythagorasDCrossing_QuadCurve

@synthesize ax = ax_;
@synthesize ay = ay_;
@synthesize bx = bx_;
@synthesize by = by_;
@synthesize Ax = Ax_;
@synthesize Ay = Ay_;
@synthesize Bx = Bx_;
@synthesize By = By_;

- (id)initWithDouble:(double)x1
          withDouble:(double)y1
          withDouble:(double)cx
          withDouble:(double)cy
          withDouble:(double)x2
          withDouble:(double)y2 {
  if ((self = [super init])) {
    ax_ = x2 - x1;
    ay_ = y2 - y1;
    bx_ = cx - x1;
    by_ = cy - y1;
    Bx_ = bx_ + bx_;
    Ax_ = ax_ - Bx_;
    By_ = by_ + by_;
    Ay_ = ay_ - By_;
  }
  return self;
}

- (int)crossWithJavaLangDoubleArray:(IOSDoubleArray *)res
                            withInt:(int)rc
                         withDouble:(double)py1
                         withDouble:(double)py2 {
  int cross = 0;
  for (int i = 0; i < rc; i++) {
    double t = [((IOSDoubleArray *) NIL_CHK(res)) doubleAtIndex:i];
    if (t < -PythagorasDCrossing_DELTA || t > 1 + PythagorasDCrossing_DELTA) {
      continue;
    }
    if (t < PythagorasDCrossing_DELTA) {
      if (py1 < 0.0f && (bx_ != 0.0f ? bx_ : ax_ - bx_) < 0.0f) {
        cross--;
      }
      continue;
    }
    if (t > 1 - PythagorasDCrossing_DELTA) {
      if (py1 < ay_ && (ax_ != bx_ ? ax_ - bx_ : bx_) > 0.0f) {
        cross++;
      }
      continue;
    }
    double ry = t * (t * Ay_ + By_);
    if (ry > py2) {
      double rxt = t * Ax_ + bx_;
      if (rxt > -PythagorasDCrossing_DELTA && rxt < PythagorasDCrossing_DELTA) {
        continue;
      }
      cross += rxt > 0.0f ? 1 : -1;
    }
  }
  return cross;
}

- (int)solvePointWithJavaLangDoubleArray:(IOSDoubleArray *)res
                              withDouble:(double)px {
  IOSDoubleArray *eqn = [IOSDoubleArray arrayWithDoubles:(double[]){ -px, Bx_, Ax_ } count:3];
  return [PythagorasDCrossing solveQuadWithJavaLangDoubleArray:eqn withJavaLangDoubleArray:res];
}

- (int)solveExtremeWithJavaLangDoubleArray:(IOSDoubleArray *)res {
  int rc = 0;
  if (Ax_ != 0.0f) {
    [((IOSDoubleArray *) NIL_CHK(res)) replaceDoubleAtIndex:rc++ withDouble:-Bx_ / (Ax_ + Ax_)];
  }
  if (Ay_ != 0.0f) {
    [((IOSDoubleArray *) NIL_CHK(res)) replaceDoubleAtIndex:rc++ withDouble:-By_ / (Ay_ + Ay_)];
  }
  return rc;
}

- (int)addBoundWithJavaLangDoubleArray:(IOSDoubleArray *)bound
                               withInt:(int)bc
               withJavaLangDoubleArray:(IOSDoubleArray *)res
                               withInt:(int)rc
                            withDouble:(double)minX
                            withDouble:(double)maxX
                              withBOOL:(BOOL)changeId
                               withInt:(int)id_ {
  for (int i = 0; i < rc; i++) {
    double t = [((IOSDoubleArray *) NIL_CHK(res)) doubleAtIndex:i];
    if (t > -PythagorasDCrossing_DELTA && t < 1 + PythagorasDCrossing_DELTA) {
      double rx = t * (t * Ax_ + Bx_);
      if (minX <= rx && rx <= maxX) {
        [((IOSDoubleArray *) NIL_CHK(bound)) replaceDoubleAtIndex:bc++ withDouble:t];
        [((IOSDoubleArray *) NIL_CHK(bound)) replaceDoubleAtIndex:bc++ withDouble:rx];
        [((IOSDoubleArray *) NIL_CHK(bound)) replaceDoubleAtIndex:bc++ withDouble:t * (t * Ay_ + By_)];
        [((IOSDoubleArray *) NIL_CHK(bound)) replaceDoubleAtIndex:bc++ withDouble:id_];
        if (changeId) {
          id_++;
        }
      }
    }
  }
  return bc;
}

- (void)dealloc {
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  PythagorasDCrossing_QuadCurve *typedCopy = (PythagorasDCrossing_QuadCurve *) copy;
  typedCopy.ax = ax_;
  typedCopy.ay = ay_;
  typedCopy.bx = bx_;
  typedCopy.by = by_;
  typedCopy.Ax = Ax_;
  typedCopy.Ay = Ay_;
  typedCopy.Bx = Bx_;
  typedCopy.By = By_;
}

@end
@implementation PythagorasDCrossing_CubicCurveH

@synthesize ax = ax_;
@synthesize ay = ay_;
@synthesize bx = bx_;
@synthesize by = by_;
@synthesize cx = cx_;
@synthesize cy = cy_;
@synthesize Ax = Ax_;
@synthesize Ay = Ay_;
@synthesize Bx = Bx_;
@synthesize By = By_;
@synthesize Cx = Cx_;
@synthesize Cy = Cy_;
@synthesize Ax3 = Ax3_;
@synthesize Bx2 = Bx2_;

- (id)initWithDouble:(double)x1
          withDouble:(double)y1
          withDouble:(double)cx1
          withDouble:(double)cy1
          withDouble:(double)cx2
          withDouble:(double)cy2
          withDouble:(double)x2
          withDouble:(double)y2 {
  if ((self = [super init])) {
    ax_ = x2 - x1;
    ay_ = y2 - y1;
    bx_ = cx1 - x1;
    by_ = cy1 - y1;
    cx_ = cx2 - x1;
    cy_ = cy2 - y1;
    Cx_ = bx_ + bx_ + bx_;
    Bx_ = cx_ + cx_ + cx_ - Cx_ - Cx_;
    Ax_ = ax_ - Bx_ - Cx_;
    Cy_ = by_ + by_ + by_;
    By_ = cy_ + cy_ + cy_ - Cy_ - Cy_;
    Ay_ = ay_ - By_ - Cy_;
    Ax3_ = Ax_ + Ax_ + Ax_;
    Bx2_ = Bx_ + Bx_;
  }
  return self;
}

- (int)crossWithJavaLangDoubleArray:(IOSDoubleArray *)res
                            withInt:(int)rc
                         withDouble:(double)py1
                         withDouble:(double)py2 {
  int cross = 0;
  for (int i = 0; i < rc; i++) {
    double t = [((IOSDoubleArray *) NIL_CHK(res)) doubleAtIndex:i];
    if (t < -PythagorasDCrossing_DELTA || t > 1 + PythagorasDCrossing_DELTA) {
      continue;
    }
    if (t < PythagorasDCrossing_DELTA) {
      if (py1 < 0.0f && (bx_ != 0.0f ? bx_ : (cx_ != bx_ ? cx_ - bx_ : ax_ - cx_)) < 0.0f) {
        cross--;
      }
      continue;
    }
    if (t > 1 - PythagorasDCrossing_DELTA) {
      if (py1 < ay_ && (ax_ != cx_ ? ax_ - cx_ : (cx_ != bx_ ? cx_ - bx_ : bx_)) > 0.0f) {
        cross++;
      }
      continue;
    }
    double ry = t * (t * (t * Ay_ + By_) + Cy_);
    if (ry > py2) {
      double rxt = t * (t * Ax3_ + Bx2_) + Cx_;
      if (rxt > -PythagorasDCrossing_DELTA && rxt < PythagorasDCrossing_DELTA) {
        rxt = t * (Ax3_ + Ax3_) + Bx2_;
        if (rxt < -PythagorasDCrossing_DELTA || rxt > PythagorasDCrossing_DELTA) {
          continue;
        }
        rxt = ax_;
      }
      cross += rxt > 0.0f ? 1 : -1;
    }
  }
  return cross;
}

- (int)solvePointWithJavaLangDoubleArray:(IOSDoubleArray *)res
                              withDouble:(double)px {
  IOSDoubleArray *eqn = [IOSDoubleArray arrayWithDoubles:(double[]){ -px, Cx_, Bx_, Ax_ } count:4];
  return [PythagorasDCrossing solveCubicWithJavaLangDoubleArray:eqn withJavaLangDoubleArray:res];
}

- (int)solveExtremeXWithJavaLangDoubleArray:(IOSDoubleArray *)res {
  IOSDoubleArray *eqn = [IOSDoubleArray arrayWithDoubles:(double[]){ Cx_, Bx2_, Ax3_ } count:3];
  return [PythagorasDCrossing solveQuadWithJavaLangDoubleArray:eqn withJavaLangDoubleArray:res];
}

- (int)solveExtremeYWithJavaLangDoubleArray:(IOSDoubleArray *)res {
  IOSDoubleArray *eqn = [IOSDoubleArray arrayWithDoubles:(double[]){ Cy_, By_ + By_, Ay_ + Ay_ + Ay_ } count:3];
  return [PythagorasDCrossing solveQuadWithJavaLangDoubleArray:eqn withJavaLangDoubleArray:res];
}

- (int)addBoundWithJavaLangDoubleArray:(IOSDoubleArray *)bound
                               withInt:(int)bc
               withJavaLangDoubleArray:(IOSDoubleArray *)res
                               withInt:(int)rc
                            withDouble:(double)minX
                            withDouble:(double)maxX
                              withBOOL:(BOOL)changeId
                               withInt:(int)id_ {
  for (int i = 0; i < rc; i++) {
    double t = [((IOSDoubleArray *) NIL_CHK(res)) doubleAtIndex:i];
    if (t > -PythagorasDCrossing_DELTA && t < 1 + PythagorasDCrossing_DELTA) {
      double rx = t * (t * (t * Ax_ + Bx_) + Cx_);
      if (minX <= rx && rx <= maxX) {
        [((IOSDoubleArray *) NIL_CHK(bound)) replaceDoubleAtIndex:bc++ withDouble:t];
        [((IOSDoubleArray *) NIL_CHK(bound)) replaceDoubleAtIndex:bc++ withDouble:rx];
        [((IOSDoubleArray *) NIL_CHK(bound)) replaceDoubleAtIndex:bc++ withDouble:t * (t * (t * Ay_ + By_) + Cy_)];
        [((IOSDoubleArray *) NIL_CHK(bound)) replaceDoubleAtIndex:bc++ withDouble:id_];
        if (changeId) {
          id_++;
        }
      }
    }
  }
  return bc;
}

- (void)dealloc {
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  PythagorasDCrossing_CubicCurveH *typedCopy = (PythagorasDCrossing_CubicCurveH *) copy;
  typedCopy.ax = ax_;
  typedCopy.ay = ay_;
  typedCopy.bx = bx_;
  typedCopy.by = by_;
  typedCopy.cx = cx_;
  typedCopy.cy = cy_;
  typedCopy.Ax = Ax_;
  typedCopy.Ay = Ay_;
  typedCopy.Bx = Bx_;
  typedCopy.By = By_;
  typedCopy.Cx = Cx_;
  typedCopy.Cy = Cy_;
  typedCopy.Ax3 = Ax3_;
  typedCopy.Bx2 = Bx2_;
}

@end
