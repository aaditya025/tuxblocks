//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: pythagoras/d/Box.java
//
//  Created by Thomas on 7/9/13.
//

#import "IOSObjectArray.h"
#import "java/lang/Float.h"
#import "java/lang/Math.h"
#import "pythagoras/d/IBox.h"
#import "pythagoras/d/IMatrix4.h"
#import "pythagoras/d/IRay3.h"
#import "pythagoras/d/IVector3.h"
#import "pythagoras/d/MathUtil.h"
#import "pythagoras/d/Vector3.h"
#import "Box.h"

@implementation PythagorasDBox

static PythagorasDBox * PythagorasDBox_UNIT_;
static PythagorasDBox * PythagorasDBox_ZERO_;
static PythagorasDBox * PythagorasDBox_EMPTY_;
static PythagorasDBox * PythagorasDBox_MAX_VALUE_;

- (PythagorasDVector3 *)_minExtent {
  return _minExtent_;
}
- (void)set_minExtent:(PythagorasDVector3 *)_minExtent {
  JreOperatorRetainedAssign(&_minExtent_, self, _minExtent);
}
@synthesize _minExtent = _minExtent_;
- (PythagorasDVector3 *)_maxExtent {
  return _maxExtent_;
}
- (void)set_maxExtent:(PythagorasDVector3 *)_maxExtent {
  JreOperatorRetainedAssign(&_maxExtent_, self, _maxExtent);
}
@synthesize _maxExtent = _maxExtent_;

+ (PythagorasDBox *)UNIT {
  return PythagorasDBox_UNIT_;
}

+ (PythagorasDBox *)ZERO {
  return PythagorasDBox_ZERO_;
}

+ (PythagorasDBox *)EMPTY {
  return PythagorasDBox_EMPTY_;
}

+ (PythagorasDBox *)MAX_VALUE {
  return PythagorasDBox_MAX_VALUE_;
}

- (id)initWithPythagorasDIVector3:(id<PythagorasDIVector3>)minExtent
          withPythagorasDIVector3:(id<PythagorasDIVector3>)maxExtent {
  if ((self = [super init])) {
    JreOperatorRetainedAssign(&_minExtent_, self, [[[PythagorasDVector3 alloc] init] autorelease]);
    JreOperatorRetainedAssign(&_maxExtent_, self, [[[PythagorasDVector3 alloc] init] autorelease]);
    (void) [self setWithPythagorasDIVector3:minExtent withPythagorasDIVector3:maxExtent];
  }
  return self;
}

- (id)initWithPythagorasDIBox:(id<PythagorasDIBox>)other {
  if ((self = [super init])) {
    JreOperatorRetainedAssign(&_minExtent_, self, [[[PythagorasDVector3 alloc] init] autorelease]);
    JreOperatorRetainedAssign(&_maxExtent_, self, [[[PythagorasDVector3 alloc] init] autorelease]);
    (void) [self setWithPythagorasDIBox:other];
  }
  return self;
}

- (id)init {
  if ((self = [super init])) {
    JreOperatorRetainedAssign(&_minExtent_, self, [[[PythagorasDVector3 alloc] init] autorelease]);
    JreOperatorRetainedAssign(&_maxExtent_, self, [[[PythagorasDVector3 alloc] init] autorelease]);
    (void) [self setToEmpty];
  }
  return self;
}

- (PythagorasDBox *)setToEmpty {
  return [self setWithPythagorasDIVector3:[PythagorasDVector3 MAX_VALUE] withPythagorasDIVector3:[PythagorasDVector3 MIN_VALUE]];
}

- (PythagorasDBox *)setWithPythagorasDIBox:(id<PythagorasDIBox>)other {
  return [self setWithPythagorasDIVector3:[((id<PythagorasDIBox>) NIL_CHK(other)) minimumExtent] withPythagorasDIVector3:[((id<PythagorasDIBox>) NIL_CHK(other)) maximumExtent]];
}

- (PythagorasDBox *)setWithPythagorasDIVector3:(id<PythagorasDIVector3>)minExtent
                       withPythagorasDIVector3:(id<PythagorasDIVector3>)maxExtent {
  (void) [((PythagorasDVector3 *) NIL_CHK(_minExtent_)) setWithPythagorasDIVector3:minExtent];
  (void) [((PythagorasDVector3 *) NIL_CHK(_maxExtent_)) setWithPythagorasDIVector3:maxExtent];
  return self;
}

- (PythagorasDBox *)fromPointsWithPythagorasDIVector3Array:(IOSObjectArray *)points {
  (void) [self setToEmpty];
  {
    IOSObjectArray *a__ = points;
    int n__ = (int) [((IOSObjectArray *) NIL_CHK(a__)) count];
    for (int i__ = 0; i__ < n__; i__++) {
      id<PythagorasDIVector3> point = ((id<PythagorasDIVector3>) [((IOSObjectArray *) NIL_CHK(a__)) objectAtIndex:i__]);
      (void) [self addLocalWithPythagorasDIVector3:point];
    }
  }
  return self;
}

- (PythagorasDBox *)addLocalWithPythagorasDIVector3:(id<PythagorasDIVector3>)point {
  return [self addWithPythagorasDIVector3:point withPythagorasDBox:self];
}

- (PythagorasDBox *)addLocalWithPythagorasDIBox:(id<PythagorasDIBox>)other {
  return [self addWithPythagorasDIBox:other withPythagorasDBox:self];
}

- (PythagorasDBox *)intersectLocalWithPythagorasDIBox:(id<PythagorasDIBox>)other {
  return [self intersectWithPythagorasDIBox:other withPythagorasDBox:self];
}

- (PythagorasDBox *)projectLocalWithPythagorasDIMatrix4:(id<PythagorasDIMatrix4>)matrix {
  return [self projectWithPythagorasDIMatrix4:matrix withPythagorasDBox:self];
}

- (PythagorasDBox *)expandLocalWithDouble:(double)x
                               withDouble:(double)y
                               withDouble:(double)z {
  return [self expandWithDouble:x withDouble:y withDouble:z withPythagorasDBox:self];
}

- (id<PythagorasDIVector3>)minimumExtent {
  return _minExtent_;
}

- (id<PythagorasDIVector3>)maximumExtent {
  return _maxExtent_;
}

- (PythagorasDVector3 *)center {
  return [self centerWithPythagorasDVector3:[[[PythagorasDVector3 alloc] init] autorelease]];
}

- (PythagorasDVector3 *)centerWithPythagorasDVector3:(PythagorasDVector3 *)result {
  return [[((PythagorasDVector3 *) NIL_CHK(_minExtent_)) addWithPythagorasDIVector3:_maxExtent_ withPythagorasDVector3:result] multLocalWithDouble:0.5f];
}

- (double)diagonalLength {
  return [((PythagorasDVector3 *) NIL_CHK(_minExtent_)) distanceWithPythagorasDIVector3:_maxExtent_];
}

- (double)longestEdge {
  return [JavaLangMath maxWithDouble:[JavaLangMath maxWithDouble:((PythagorasDVector3 *) NIL_CHK(_maxExtent_)).x_ - ((PythagorasDVector3 *) NIL_CHK(_minExtent_)).x_ withDouble:((PythagorasDVector3 *) NIL_CHK(_maxExtent_)).y_ - ((PythagorasDVector3 *) NIL_CHK(_minExtent_)).y_] withDouble:((PythagorasDVector3 *) NIL_CHK(_maxExtent_)).z_ - ((PythagorasDVector3 *) NIL_CHK(_minExtent_)).z_];
}

- (BOOL)isEmpty {
  return ((PythagorasDVector3 *) NIL_CHK(_minExtent_)).x_ > ((PythagorasDVector3 *) NIL_CHK(_maxExtent_)).x_ || ((PythagorasDVector3 *) NIL_CHK(_minExtent_)).y_ > ((PythagorasDVector3 *) NIL_CHK(_maxExtent_)).y_ || ((PythagorasDVector3 *) NIL_CHK(_minExtent_)).z_ > ((PythagorasDVector3 *) NIL_CHK(_maxExtent_)).z_;
}

- (PythagorasDBox *)addWithPythagorasDIVector3:(id<PythagorasDIVector3>)point {
  return [self addWithPythagorasDIVector3:point withPythagorasDBox:[[[PythagorasDBox alloc] init] autorelease]];
}

- (PythagorasDBox *)addWithPythagorasDIVector3:(id<PythagorasDIVector3>)point
                            withPythagorasDBox:(PythagorasDBox *)result {
  (void) [((PythagorasDVector3 *) NIL_CHK(result._minExtent)) setWithDouble:[JavaLangMath minWithDouble:((PythagorasDVector3 *) NIL_CHK(_minExtent_)).x_ withDouble:[((id<PythagorasDIVector3>) NIL_CHK(point)) x]] withDouble:[JavaLangMath minWithDouble:((PythagorasDVector3 *) NIL_CHK(_minExtent_)).y_ withDouble:[((id<PythagorasDIVector3>) NIL_CHK(point)) y]] withDouble:[JavaLangMath minWithDouble:((PythagorasDVector3 *) NIL_CHK(_minExtent_)).z_ withDouble:[((id<PythagorasDIVector3>) NIL_CHK(point)) z]]];
  (void) [((PythagorasDVector3 *) NIL_CHK(result._maxExtent)) setWithDouble:[JavaLangMath maxWithDouble:((PythagorasDVector3 *) NIL_CHK(_maxExtent_)).x_ withDouble:[((id<PythagorasDIVector3>) NIL_CHK(point)) x]] withDouble:[JavaLangMath maxWithDouble:((PythagorasDVector3 *) NIL_CHK(_maxExtent_)).y_ withDouble:[((id<PythagorasDIVector3>) NIL_CHK(point)) y]] withDouble:[JavaLangMath maxWithDouble:((PythagorasDVector3 *) NIL_CHK(_maxExtent_)).z_ withDouble:[((id<PythagorasDIVector3>) NIL_CHK(point)) z]]];
  return result;
}

- (PythagorasDBox *)addWithPythagorasDIBox:(id<PythagorasDIBox>)other {
  return [self addWithPythagorasDIBox:other withPythagorasDBox:[[[PythagorasDBox alloc] init] autorelease]];
}

- (PythagorasDBox *)addWithPythagorasDIBox:(id<PythagorasDIBox>)other
                        withPythagorasDBox:(PythagorasDBox *)result {
  id<PythagorasDIVector3> omin = [((id<PythagorasDIBox>) NIL_CHK(other)) minimumExtent], omax = [((id<PythagorasDIBox>) NIL_CHK(other)) maximumExtent];
  (void) [((PythagorasDVector3 *) NIL_CHK(result._minExtent)) setWithDouble:[JavaLangMath minWithDouble:((PythagorasDVector3 *) NIL_CHK(_minExtent_)).x_ withDouble:[((id<PythagorasDIVector3>) NIL_CHK(omin)) x]] withDouble:[JavaLangMath minWithDouble:((PythagorasDVector3 *) NIL_CHK(_minExtent_)).y_ withDouble:[((id<PythagorasDIVector3>) NIL_CHK(omin)) y]] withDouble:[JavaLangMath minWithDouble:((PythagorasDVector3 *) NIL_CHK(_minExtent_)).z_ withDouble:[((id<PythagorasDIVector3>) NIL_CHK(omin)) z]]];
  (void) [((PythagorasDVector3 *) NIL_CHK(result._maxExtent)) setWithDouble:[JavaLangMath maxWithDouble:((PythagorasDVector3 *) NIL_CHK(_maxExtent_)).x_ withDouble:[((id<PythagorasDIVector3>) NIL_CHK(omax)) x]] withDouble:[JavaLangMath maxWithDouble:((PythagorasDVector3 *) NIL_CHK(_maxExtent_)).y_ withDouble:[((id<PythagorasDIVector3>) NIL_CHK(omax)) y]] withDouble:[JavaLangMath maxWithDouble:((PythagorasDVector3 *) NIL_CHK(_maxExtent_)).z_ withDouble:[((id<PythagorasDIVector3>) NIL_CHK(omax)) z]]];
  return result;
}

- (PythagorasDBox *)intersectWithPythagorasDIBox:(id<PythagorasDIBox>)other {
  return [self intersectWithPythagorasDIBox:other withPythagorasDBox:[[[PythagorasDBox alloc] init] autorelease]];
}

- (PythagorasDBox *)intersectWithPythagorasDIBox:(id<PythagorasDIBox>)other
                              withPythagorasDBox:(PythagorasDBox *)result {
  id<PythagorasDIVector3> omin = [((id<PythagorasDIBox>) NIL_CHK(other)) minimumExtent], omax = [((id<PythagorasDIBox>) NIL_CHK(other)) maximumExtent];
  (void) [((PythagorasDVector3 *) NIL_CHK(result._minExtent)) setWithDouble:[JavaLangMath maxWithDouble:((PythagorasDVector3 *) NIL_CHK(_minExtent_)).x_ withDouble:[((id<PythagorasDIVector3>) NIL_CHK(omin)) x]] withDouble:[JavaLangMath maxWithDouble:((PythagorasDVector3 *) NIL_CHK(_minExtent_)).y_ withDouble:[((id<PythagorasDIVector3>) NIL_CHK(omin)) y]] withDouble:[JavaLangMath maxWithDouble:((PythagorasDVector3 *) NIL_CHK(_minExtent_)).z_ withDouble:[((id<PythagorasDIVector3>) NIL_CHK(omin)) z]]];
  (void) [((PythagorasDVector3 *) NIL_CHK(result._maxExtent)) setWithDouble:[JavaLangMath minWithDouble:((PythagorasDVector3 *) NIL_CHK(_maxExtent_)).x_ withDouble:[((id<PythagorasDIVector3>) NIL_CHK(omax)) x]] withDouble:[JavaLangMath minWithDouble:((PythagorasDVector3 *) NIL_CHK(_maxExtent_)).y_ withDouble:[((id<PythagorasDIVector3>) NIL_CHK(omax)) y]] withDouble:[JavaLangMath minWithDouble:((PythagorasDVector3 *) NIL_CHK(_maxExtent_)).z_ withDouble:[((id<PythagorasDIVector3>) NIL_CHK(omax)) z]]];
  return result;
}

- (PythagorasDBox *)projectWithPythagorasDIMatrix4:(id<PythagorasDIMatrix4>)matrix {
  return [self projectWithPythagorasDIMatrix4:matrix withPythagorasDBox:[[[PythagorasDBox alloc] init] autorelease]];
}

- (PythagorasDBox *)projectWithPythagorasDIMatrix4:(id<PythagorasDIMatrix4>)matrix
                                withPythagorasDBox:(PythagorasDBox *)result {
  double minx = +JavaLangFloat_MAX_VALUE, miny = +JavaLangFloat_MAX_VALUE, minz = +JavaLangFloat_MAX_VALUE;
  double maxx = -JavaLangFloat_MAX_VALUE, maxy = -JavaLangFloat_MAX_VALUE, maxz = -JavaLangFloat_MAX_VALUE;
  for (int ii = 0; ii < 8; ii++) {
    double x = ((ii & (1 << 2)) == 0) ? ((PythagorasDVector3 *) NIL_CHK(_minExtent_)).x_ : ((PythagorasDVector3 *) NIL_CHK(_maxExtent_)).x_;
    double y = ((ii & (1 << 1)) == 0) ? ((PythagorasDVector3 *) NIL_CHK(_minExtent_)).y_ : ((PythagorasDVector3 *) NIL_CHK(_maxExtent_)).y_;
    double z = ((ii & (1 << 0)) == 0) ? ((PythagorasDVector3 *) NIL_CHK(_minExtent_)).z_ : ((PythagorasDVector3 *) NIL_CHK(_maxExtent_)).z_;
    double rw = 1.0f / ([((id<PythagorasDIMatrix4>) NIL_CHK(matrix)) m03] * x + [((id<PythagorasDIMatrix4>) NIL_CHK(matrix)) m13] * y + [((id<PythagorasDIMatrix4>) NIL_CHK(matrix)) m23] * z + [((id<PythagorasDIMatrix4>) NIL_CHK(matrix)) m33]);
    double px = ([((id<PythagorasDIMatrix4>) NIL_CHK(matrix)) m00] * x + [((id<PythagorasDIMatrix4>) NIL_CHK(matrix)) m10] * y + [((id<PythagorasDIMatrix4>) NIL_CHK(matrix)) m20] * z + [((id<PythagorasDIMatrix4>) NIL_CHK(matrix)) m30]) * rw;
    double py = ([((id<PythagorasDIMatrix4>) NIL_CHK(matrix)) m01] * x + [((id<PythagorasDIMatrix4>) NIL_CHK(matrix)) m11] * y + [((id<PythagorasDIMatrix4>) NIL_CHK(matrix)) m21] * z + [((id<PythagorasDIMatrix4>) NIL_CHK(matrix)) m31]) * rw;
    double pz = ([((id<PythagorasDIMatrix4>) NIL_CHK(matrix)) m02] * x + [((id<PythagorasDIMatrix4>) NIL_CHK(matrix)) m12] * y + [((id<PythagorasDIMatrix4>) NIL_CHK(matrix)) m22] * z + [((id<PythagorasDIMatrix4>) NIL_CHK(matrix)) m32]) * rw;
    minx = [JavaLangMath minWithDouble:minx withDouble:px];
    miny = [JavaLangMath minWithDouble:miny withDouble:py];
    minz = [JavaLangMath minWithDouble:minz withDouble:pz];
    maxx = [JavaLangMath maxWithDouble:maxx withDouble:px];
    maxy = [JavaLangMath maxWithDouble:maxy withDouble:py];
    maxz = [JavaLangMath maxWithDouble:maxz withDouble:pz];
  }
  (void) [((PythagorasDVector3 *) NIL_CHK(result._minExtent)) setWithDouble:minx withDouble:miny withDouble:minz];
  (void) [((PythagorasDVector3 *) NIL_CHK(result._maxExtent)) setWithDouble:maxx withDouble:maxy withDouble:maxz];
  return result;
}

- (PythagorasDBox *)expandWithDouble:(double)x
                          withDouble:(double)y
                          withDouble:(double)z {
  return [self expandWithDouble:x withDouble:y withDouble:z withPythagorasDBox:[[[PythagorasDBox alloc] init] autorelease]];
}

- (PythagorasDBox *)expandWithDouble:(double)x
                          withDouble:(double)y
                          withDouble:(double)z
                  withPythagorasDBox:(PythagorasDBox *)result {
  (void) [((PythagorasDVector3 *) NIL_CHK(result._minExtent)) setWithDouble:((PythagorasDVector3 *) NIL_CHK(_minExtent_)).x_ - x withDouble:((PythagorasDVector3 *) NIL_CHK(_minExtent_)).y_ - y withDouble:((PythagorasDVector3 *) NIL_CHK(_minExtent_)).z_ - z];
  (void) [((PythagorasDVector3 *) NIL_CHK(result._maxExtent)) setWithDouble:((PythagorasDVector3 *) NIL_CHK(_maxExtent_)).x_ + x withDouble:((PythagorasDVector3 *) NIL_CHK(_maxExtent_)).y_ + y withDouble:((PythagorasDVector3 *) NIL_CHK(_maxExtent_)).z_ + z];
  return result;
}

- (PythagorasDVector3 *)vertexWithInt:(int)code
               withPythagorasDVector3:(PythagorasDVector3 *)result {
  return [((PythagorasDVector3 *) NIL_CHK(result)) setWithDouble:((code & (1 << 2)) == 0) ? ((PythagorasDVector3 *) NIL_CHK(_minExtent_)).x_ : ((PythagorasDVector3 *) NIL_CHK(_maxExtent_)).x_ withDouble:((code & (1 << 1)) == 0) ? ((PythagorasDVector3 *) NIL_CHK(_minExtent_)).y_ : ((PythagorasDVector3 *) NIL_CHK(_maxExtent_)).y_ withDouble:((code & (1 << 0)) == 0) ? ((PythagorasDVector3 *) NIL_CHK(_minExtent_)).z_ : ((PythagorasDVector3 *) NIL_CHK(_maxExtent_)).z_];
}

- (BOOL)containsWithPythagorasDIVector3:(id<PythagorasDIVector3>)point {
  return [self containsWithDouble:[((id<PythagorasDIVector3>) NIL_CHK(point)) x] withDouble:[((id<PythagorasDIVector3>) NIL_CHK(point)) y] withDouble:[((id<PythagorasDIVector3>) NIL_CHK(point)) z]];
}

- (BOOL)containsWithDouble:(double)x
                withDouble:(double)y
                withDouble:(double)z {
  return (x >= ((PythagorasDVector3 *) NIL_CHK(_minExtent_)).x_ && x <= ((PythagorasDVector3 *) NIL_CHK(_maxExtent_)).x_ && y >= ((PythagorasDVector3 *) NIL_CHK(_minExtent_)).y_ && y <= ((PythagorasDVector3 *) NIL_CHK(_maxExtent_)).y_ && z >= ((PythagorasDVector3 *) NIL_CHK(_minExtent_)).z_ && z <= ((PythagorasDVector3 *) NIL_CHK(_maxExtent_)).z_);
}

- (double)extentDistanceWithPythagorasDIBox:(id<PythagorasDIBox>)other {
  return [((id<PythagorasDIVector3>) [((id<PythagorasDIBox>) NIL_CHK(other)) minimumExtent]) manhattanDistanceWithPythagorasDIVector3:_minExtent_] + [((id<PythagorasDIVector3>) [((id<PythagorasDIBox>) NIL_CHK(other)) maximumExtent]) manhattanDistanceWithPythagorasDIVector3:_maxExtent_];
}

- (BOOL)containsWithPythagorasDIBox:(id<PythagorasDIBox>)other {
  id<PythagorasDIVector3> omin = [((id<PythagorasDIBox>) NIL_CHK(other)) minimumExtent], omax = [((id<PythagorasDIBox>) NIL_CHK(other)) maximumExtent];
  return [((id<PythagorasDIVector3>) NIL_CHK(omin)) x] >= ((PythagorasDVector3 *) NIL_CHK(_minExtent_)).x_ && [((id<PythagorasDIVector3>) NIL_CHK(omax)) x] <= ((PythagorasDVector3 *) NIL_CHK(_maxExtent_)).x_ && [((id<PythagorasDIVector3>) NIL_CHK(omin)) y] >= ((PythagorasDVector3 *) NIL_CHK(_minExtent_)).y_ && [((id<PythagorasDIVector3>) NIL_CHK(omax)) y] <= ((PythagorasDVector3 *) NIL_CHK(_maxExtent_)).y_ && [((id<PythagorasDIVector3>) NIL_CHK(omin)) z] >= ((PythagorasDVector3 *) NIL_CHK(_minExtent_)).z_ && [((id<PythagorasDIVector3>) NIL_CHK(omax)) z] <= ((PythagorasDVector3 *) NIL_CHK(_maxExtent_)).z_;
}

- (BOOL)intersectsWithPythagorasDIBox:(id<PythagorasDIBox>)other {
  id<PythagorasDIVector3> omin = [((id<PythagorasDIBox>) NIL_CHK(other)) minimumExtent], omax = [((id<PythagorasDIBox>) NIL_CHK(other)) maximumExtent];
  return ((PythagorasDVector3 *) NIL_CHK(_maxExtent_)).x_ >= [((id<PythagorasDIVector3>) NIL_CHK(omin)) x] && ((PythagorasDVector3 *) NIL_CHK(_minExtent_)).x_ <= [((id<PythagorasDIVector3>) NIL_CHK(omax)) x] && ((PythagorasDVector3 *) NIL_CHK(_maxExtent_)).y_ >= [((id<PythagorasDIVector3>) NIL_CHK(omin)) y] && ((PythagorasDVector3 *) NIL_CHK(_minExtent_)).y_ <= [((id<PythagorasDIVector3>) NIL_CHK(omax)) y] && ((PythagorasDVector3 *) NIL_CHK(_maxExtent_)).z_ >= [((id<PythagorasDIVector3>) NIL_CHK(omin)) z] && ((PythagorasDVector3 *) NIL_CHK(_minExtent_)).z_ <= [((id<PythagorasDIVector3>) NIL_CHK(omax)) z];
}

- (BOOL)intersectsWithPythagorasDIRay3:(id<PythagorasDIRay3>)ray {
  id<PythagorasDIVector3> dir = [((id<PythagorasDIRay3>) NIL_CHK(ray)) direction];
  return [JavaLangMath absWithDouble:[((id<PythagorasDIVector3>) NIL_CHK(dir)) x]] > PythagorasDMathUtil_EPSILON && ([self intersectsXWithPythagorasDIRay3:ray withDouble:((PythagorasDVector3 *) NIL_CHK(_minExtent_)).x_] || [self intersectsXWithPythagorasDIRay3:ray withDouble:((PythagorasDVector3 *) NIL_CHK(_maxExtent_)).x_]) || [JavaLangMath absWithDouble:[((id<PythagorasDIVector3>) NIL_CHK(dir)) y]] > PythagorasDMathUtil_EPSILON && ([self intersectsYWithPythagorasDIRay3:ray withDouble:((PythagorasDVector3 *) NIL_CHK(_minExtent_)).y_] || [self intersectsYWithPythagorasDIRay3:ray withDouble:((PythagorasDVector3 *) NIL_CHK(_maxExtent_)).y_]) || [JavaLangMath absWithDouble:[((id<PythagorasDIVector3>) NIL_CHK(dir)) z]] > PythagorasDMathUtil_EPSILON && ([self intersectsZWithPythagorasDIRay3:ray withDouble:((PythagorasDVector3 *) NIL_CHK(_minExtent_)).z_] || [self intersectsZWithPythagorasDIRay3:ray withDouble:((PythagorasDVector3 *) NIL_CHK(_maxExtent_)).z_]);
}

- (BOOL)intersectionWithPythagorasDIRay3:(id<PythagorasDIRay3>)ray
                  withPythagorasDVector3:(PythagorasDVector3 *)result {
  id<PythagorasDIVector3> origin = [((id<PythagorasDIRay3>) NIL_CHK(ray)) origin];
  if ([self containsWithPythagorasDIVector3:origin]) {
    (void) [((PythagorasDVector3 *) NIL_CHK(result)) setWithPythagorasDIVector3:origin];
    return YES;
  }
  id<PythagorasDIVector3> dir = [((id<PythagorasDIRay3>) NIL_CHK(ray)) direction];
  double t = JavaLangFloat_MAX_VALUE;
  if ([JavaLangMath absWithDouble:[((id<PythagorasDIVector3>) NIL_CHK(dir)) x]] > PythagorasDMathUtil_EPSILON) {
    t = [JavaLangMath minWithDouble:t withDouble:[self intersectionXWithPythagorasDIRay3:ray withDouble:((PythagorasDVector3 *) NIL_CHK(_minExtent_)).x_]];
    t = [JavaLangMath minWithDouble:t withDouble:[self intersectionXWithPythagorasDIRay3:ray withDouble:((PythagorasDVector3 *) NIL_CHK(_maxExtent_)).x_]];
  }
  if ([JavaLangMath absWithDouble:[((id<PythagorasDIVector3>) NIL_CHK(dir)) y]] > PythagorasDMathUtil_EPSILON) {
    t = [JavaLangMath minWithDouble:t withDouble:[self intersectionYWithPythagorasDIRay3:ray withDouble:((PythagorasDVector3 *) NIL_CHK(_minExtent_)).y_]];
    t = [JavaLangMath minWithDouble:t withDouble:[self intersectionYWithPythagorasDIRay3:ray withDouble:((PythagorasDVector3 *) NIL_CHK(_maxExtent_)).y_]];
  }
  if ([JavaLangMath absWithDouble:[((id<PythagorasDIVector3>) NIL_CHK(dir)) z]] > PythagorasDMathUtil_EPSILON) {
    t = [JavaLangMath minWithDouble:t withDouble:[self intersectionZWithPythagorasDIRay3:ray withDouble:((PythagorasDVector3 *) NIL_CHK(_minExtent_)).z_]];
    t = [JavaLangMath minWithDouble:t withDouble:[self intersectionZWithPythagorasDIRay3:ray withDouble:((PythagorasDVector3 *) NIL_CHK(_maxExtent_)).z_]];
  }
  if (t == JavaLangFloat_MAX_VALUE) {
    return NO;
  }
  (void) [((id<PythagorasDIVector3>) NIL_CHK(origin)) addScaledWithPythagorasDIVector3:dir withDouble:t withPythagorasDVector3:result];
  return YES;
}

- (NSString *)description {
  return [NSString stringWithFormat:@"[min=%@, max=%@]", _minExtent_, _maxExtent_];
}

- (NSUInteger)hash {
  return [((PythagorasDVector3 *) NIL_CHK(_minExtent_)) hash] + 31 * [((PythagorasDVector3 *) NIL_CHK(_maxExtent_)) hash];
}

- (BOOL)isEqual:(id)other {
  if (!([other isKindOfClass:[PythagorasDBox class]])) {
    return NO;
  }
  PythagorasDBox *obox = (PythagorasDBox *) other;
  return [((PythagorasDVector3 *) NIL_CHK(_minExtent_)) isEqual:((PythagorasDBox *) NIL_CHK(obox))._minExtent] && [((PythagorasDVector3 *) NIL_CHK(_maxExtent_)) isEqual:((PythagorasDBox *) NIL_CHK(obox))._maxExtent];
}

- (BOOL)intersectsXWithPythagorasDIRay3:(id<PythagorasDIRay3>)ray
                             withDouble:(double)x {
  id<PythagorasDIVector3> origin = [((id<PythagorasDIRay3>) NIL_CHK(ray)) origin], dir = [((id<PythagorasDIRay3>) NIL_CHK(ray)) direction];
  double t = (x - [((id<PythagorasDIVector3>) NIL_CHK(origin)) x]) / [((id<PythagorasDIVector3>) NIL_CHK(dir)) x];
  if (t < 0.0f) {
    return NO;
  }
  double iy = [((id<PythagorasDIVector3>) NIL_CHK(origin)) y] + t * [((id<PythagorasDIVector3>) NIL_CHK(dir)) y], iz = [((id<PythagorasDIVector3>) NIL_CHK(origin)) z] + t * [((id<PythagorasDIVector3>) NIL_CHK(dir)) z];
  return iy >= ((PythagorasDVector3 *) NIL_CHK(_minExtent_)).y_ && iy <= ((PythagorasDVector3 *) NIL_CHK(_maxExtent_)).y_ && iz >= ((PythagorasDVector3 *) NIL_CHK(_minExtent_)).z_ && iz <= ((PythagorasDVector3 *) NIL_CHK(_maxExtent_)).z_;
}

- (BOOL)intersectsYWithPythagorasDIRay3:(id<PythagorasDIRay3>)ray
                             withDouble:(double)y {
  id<PythagorasDIVector3> origin = [((id<PythagorasDIRay3>) NIL_CHK(ray)) origin], dir = [((id<PythagorasDIRay3>) NIL_CHK(ray)) direction];
  double t = (y - [((id<PythagorasDIVector3>) NIL_CHK(origin)) y]) / [((id<PythagorasDIVector3>) NIL_CHK(dir)) y];
  if (t < 0.0f) {
    return NO;
  }
  double ix = [((id<PythagorasDIVector3>) NIL_CHK(origin)) x] + t * [((id<PythagorasDIVector3>) NIL_CHK(dir)) x], iz = [((id<PythagorasDIVector3>) NIL_CHK(origin)) z] + t * [((id<PythagorasDIVector3>) NIL_CHK(dir)) z];
  return ix >= ((PythagorasDVector3 *) NIL_CHK(_minExtent_)).x_ && ix <= ((PythagorasDVector3 *) NIL_CHK(_maxExtent_)).x_ && iz >= ((PythagorasDVector3 *) NIL_CHK(_minExtent_)).z_ && iz <= ((PythagorasDVector3 *) NIL_CHK(_maxExtent_)).z_;
}

- (BOOL)intersectsZWithPythagorasDIRay3:(id<PythagorasDIRay3>)ray
                             withDouble:(double)z {
  id<PythagorasDIVector3> origin = [((id<PythagorasDIRay3>) NIL_CHK(ray)) origin], dir = [((id<PythagorasDIRay3>) NIL_CHK(ray)) direction];
  double t = (z - [((id<PythagorasDIVector3>) NIL_CHK(origin)) z]) / [((id<PythagorasDIVector3>) NIL_CHK(dir)) z];
  if (t < 0.0f) {
    return NO;
  }
  double ix = [((id<PythagorasDIVector3>) NIL_CHK(origin)) x] + t * [((id<PythagorasDIVector3>) NIL_CHK(dir)) x], iy = [((id<PythagorasDIVector3>) NIL_CHK(origin)) y] + t * [((id<PythagorasDIVector3>) NIL_CHK(dir)) y];
  return ix >= ((PythagorasDVector3 *) NIL_CHK(_minExtent_)).x_ && ix <= ((PythagorasDVector3 *) NIL_CHK(_maxExtent_)).x_ && iy >= ((PythagorasDVector3 *) NIL_CHK(_minExtent_)).y_ && iy <= ((PythagorasDVector3 *) NIL_CHK(_maxExtent_)).y_;
}

- (double)intersectionXWithPythagorasDIRay3:(id<PythagorasDIRay3>)ray
                                 withDouble:(double)x {
  id<PythagorasDIVector3> origin = [((id<PythagorasDIRay3>) NIL_CHK(ray)) origin], dir = [((id<PythagorasDIRay3>) NIL_CHK(ray)) direction];
  double t = (x - [((id<PythagorasDIVector3>) NIL_CHK(origin)) x]) / [((id<PythagorasDIVector3>) NIL_CHK(dir)) x];
  if (t < 0.0f) {
    return JavaLangFloat_MAX_VALUE;
  }
  double iy = [((id<PythagorasDIVector3>) NIL_CHK(origin)) y] + t * [((id<PythagorasDIVector3>) NIL_CHK(dir)) y], iz = [((id<PythagorasDIVector3>) NIL_CHK(origin)) z] + t * [((id<PythagorasDIVector3>) NIL_CHK(dir)) z];
  return (iy >= ((PythagorasDVector3 *) NIL_CHK(_minExtent_)).y_ && iy <= ((PythagorasDVector3 *) NIL_CHK(_maxExtent_)).y_ && iz >= ((PythagorasDVector3 *) NIL_CHK(_minExtent_)).z_ && iz <= ((PythagorasDVector3 *) NIL_CHK(_maxExtent_)).z_) ? t : JavaLangFloat_MAX_VALUE;
}

- (double)intersectionYWithPythagorasDIRay3:(id<PythagorasDIRay3>)ray
                                 withDouble:(double)y {
  id<PythagorasDIVector3> origin = [((id<PythagorasDIRay3>) NIL_CHK(ray)) origin], dir = [((id<PythagorasDIRay3>) NIL_CHK(ray)) direction];
  double t = (y - [((id<PythagorasDIVector3>) NIL_CHK(origin)) y]) / [((id<PythagorasDIVector3>) NIL_CHK(dir)) y];
  if (t < 0.0f) {
    return JavaLangFloat_MAX_VALUE;
  }
  double ix = [((id<PythagorasDIVector3>) NIL_CHK(origin)) x] + t * [((id<PythagorasDIVector3>) NIL_CHK(dir)) x], iz = [((id<PythagorasDIVector3>) NIL_CHK(origin)) z] + t * [((id<PythagorasDIVector3>) NIL_CHK(dir)) z];
  return (ix >= ((PythagorasDVector3 *) NIL_CHK(_minExtent_)).x_ && ix <= ((PythagorasDVector3 *) NIL_CHK(_maxExtent_)).x_ && iz >= ((PythagorasDVector3 *) NIL_CHK(_minExtent_)).z_ && iz <= ((PythagorasDVector3 *) NIL_CHK(_maxExtent_)).z_) ? t : JavaLangFloat_MAX_VALUE;
}

- (double)intersectionZWithPythagorasDIRay3:(id<PythagorasDIRay3>)ray
                                 withDouble:(double)z {
  id<PythagorasDIVector3> origin = [((id<PythagorasDIRay3>) NIL_CHK(ray)) origin], dir = [((id<PythagorasDIRay3>) NIL_CHK(ray)) direction];
  double t = (z - [((id<PythagorasDIVector3>) NIL_CHK(origin)) z]) / [((id<PythagorasDIVector3>) NIL_CHK(dir)) z];
  if (t < 0.0f) {
    return JavaLangFloat_MAX_VALUE;
  }
  double ix = [((id<PythagorasDIVector3>) NIL_CHK(origin)) x] + t * [((id<PythagorasDIVector3>) NIL_CHK(dir)) x], iy = [((id<PythagorasDIVector3>) NIL_CHK(origin)) y] + t * [((id<PythagorasDIVector3>) NIL_CHK(dir)) y];
  return (ix >= ((PythagorasDVector3 *) NIL_CHK(_minExtent_)).x_ && ix <= ((PythagorasDVector3 *) NIL_CHK(_maxExtent_)).x_ && iy >= ((PythagorasDVector3 *) NIL_CHK(_minExtent_)).y_ && iy <= ((PythagorasDVector3 *) NIL_CHK(_maxExtent_)).y_) ? t : JavaLangFloat_MAX_VALUE;
}

+ (void)initialize {
  if (self == [PythagorasDBox class]) {
    JreOperatorRetainedAssign(&PythagorasDBox_UNIT_, self, [[[PythagorasDBox alloc] initWithPythagorasDIVector3:[((id<PythagorasDIVector3>) NIL_CHK([PythagorasDVector3 UNIT_XYZ])) negate] withPythagorasDIVector3:[PythagorasDVector3 UNIT_XYZ]] autorelease]);
    JreOperatorRetainedAssign(&PythagorasDBox_ZERO_, self, [[[PythagorasDBox alloc] initWithPythagorasDIVector3:[PythagorasDVector3 ZERO] withPythagorasDIVector3:[PythagorasDVector3 ZERO]] autorelease]);
    JreOperatorRetainedAssign(&PythagorasDBox_EMPTY_, self, [[[PythagorasDBox alloc] initWithPythagorasDIVector3:[PythagorasDVector3 MAX_VALUE] withPythagorasDIVector3:[PythagorasDVector3 MIN_VALUE]] autorelease]);
    JreOperatorRetainedAssign(&PythagorasDBox_MAX_VALUE_, self, [[[PythagorasDBox alloc] initWithPythagorasDIVector3:[PythagorasDVector3 MIN_VALUE] withPythagorasDIVector3:[PythagorasDVector3 MAX_VALUE]] autorelease]);
  }
}

- (void)dealloc {
  JreOperatorRetainedAssign(&_maxExtent_, self, nil);
  JreOperatorRetainedAssign(&_minExtent_, self, nil);
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  PythagorasDBox *typedCopy = (PythagorasDBox *) copy;
  typedCopy._minExtent = _minExtent_;
  typedCopy._maxExtent = _maxExtent_;
}

@end
