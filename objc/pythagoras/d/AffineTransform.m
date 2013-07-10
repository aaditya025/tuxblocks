//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: pythagoras/d/AffineTransform.java
//
//  Created by Thomas on 7/9/13.
//

#import "IOSDoubleArray.h"
#import "IOSObjectArray.h"
#import "java/lang/Math.h"
#import "pythagoras/d/AbstractTransform.h"
#import "pythagoras/d/IPoint.h"
#import "pythagoras/d/IVector.h"
#import "pythagoras/d/MathUtil.h"
#import "pythagoras/d/Point.h"
#import "pythagoras/d/Transform.h"
#import "pythagoras/d/Transforms.h"
#import "pythagoras/d/Vector.h"
#import "pythagoras/util/NoninvertibleTransformException.h"
#import "AffineTransform.h"

@implementation PythagorasDAffineTransform

@synthesize m00 = m00_;
@synthesize m01 = m01_;
@synthesize m10 = m10_;
@synthesize m11 = m11_;
@synthesize tx_ = tx__;
@synthesize ty_ = ty__;

+ (int)GENERALITY {
  return PythagorasDAffineTransform_GENERALITY;
}

- (id)init {
  return [self initPythagorasDAffineTransformWithDouble:1 withDouble:0 withDouble:0 withDouble:1 withDouble:0 withDouble:0];
}

- (id)initWithDouble:(double)scale_
          withDouble:(double)angle
          withDouble:(double)tx
          withDouble:(double)ty {
  return [self initPythagorasDAffineTransformWithDouble:scale_ withDouble:scale_ withDouble:angle withDouble:tx withDouble:ty];
}

- (id)initPythagorasDAffineTransformWithDouble:(double)scaleX
                                    withDouble:(double)scaleY
                                    withDouble:(double)angle
                                    withDouble:(double)tx
                                    withDouble:(double)ty {
  if ((self = [super init])) {
    double sina = [JavaLangMath sinWithDouble:angle], cosa = [JavaLangMath cosWithDouble:angle];
    self.m00 = cosa * scaleX;
    self.m01 = sina * scaleY;
    self.m10 = -sina * scaleX;
    self.m11 = cosa * scaleY;
    self.tx_ = tx;
    self.ty_ = ty;
  }
  return self;
}

- (id)initWithDouble:(double)scaleX
          withDouble:(double)scaleY
          withDouble:(double)angle
          withDouble:(double)tx
          withDouble:(double)ty {
  return [self initPythagorasDAffineTransformWithDouble:scaleX withDouble:scaleY withDouble:angle withDouble:tx withDouble:ty];
}

- (id)initPythagorasDAffineTransformWithDouble:(double)m00
                                    withDouble:(double)m01
                                    withDouble:(double)m10
                                    withDouble:(double)m11
                                    withDouble:(double)tx
                                    withDouble:(double)ty {
  if ((self = [super init])) {
    self.m00 = m00;
    self.m01 = m01;
    self.m10 = m10;
    self.m11 = m11;
    self.tx_ = tx;
    self.ty_ = ty;
  }
  return self;
}

- (id)initWithDouble:(double)m00
          withDouble:(double)m01
          withDouble:(double)m10
          withDouble:(double)m11
          withDouble:(double)tx
          withDouble:(double)ty {
  return [self initPythagorasDAffineTransformWithDouble:m00 withDouble:m01 withDouble:m10 withDouble:m11 withDouble:tx withDouble:ty];
}

- (double)uniformScale {
  double cp = m00_ * m11_ - m01_ * m10_;
  return (cp < 0.0f) ? -[JavaLangMath sqrtWithDouble:-cp] : [JavaLangMath sqrtWithDouble:cp];
}

- (double)scaleX {
  return [JavaLangMath sqrtWithDouble:m00_ * m00_ + m01_ * m01_];
}

- (double)scaleY {
  return [JavaLangMath sqrtWithDouble:m10_ * m10_ + m11_ * m11_];
}

- (double)rotation {
  double n00 = m00_, n10 = m10_;
  double n01 = m01_, n11 = m11_;
  for (int ii = 0; ii < 10; ii++) {
    double o00 = n00, o10 = n10;
    double o01 = n01, o11 = n11;
    double det = o00 * o11 - o10 * o01;
    if ([JavaLangMath absWithDouble:det] == 0.0f) {
      @throw [[[PythagorasUtilNoninvertibleTransformException alloc] initWithNSString:[self description]] autorelease];
    }
    double hrdet = 0.5f / det;
    n00 = +o11 * hrdet + o00 * 0.5f;
    n10 = -o01 * hrdet + o10 * 0.5f;
    n01 = -o10 * hrdet + o01 * 0.5f;
    n11 = +o00 * hrdet + o11 * 0.5f;
    double d00 = n00 - o00, d10 = n10 - o10;
    double d01 = n01 - o01, d11 = n11 - o11;
    if (d00 * d00 + d10 * d10 + d01 * d01 + d11 * d11 < PythagorasDMathUtil_EPSILON) {
      break;
    }
  }
  return [JavaLangMath atan2WithDouble:n01 withDouble:n00];
}

- (double)tx {
  return self.tx_;
}

- (double)ty {
  return self.ty_;
}

- (void)getWithJavaLangDoubleArray:(IOSDoubleArray *)matrix {
  [((IOSDoubleArray *) NIL_CHK(matrix)) replaceDoubleAtIndex:0 withDouble:m00_];
  [((IOSDoubleArray *) NIL_CHK(matrix)) replaceDoubleAtIndex:1 withDouble:m01_];
  [((IOSDoubleArray *) NIL_CHK(matrix)) replaceDoubleAtIndex:2 withDouble:m10_];
  [((IOSDoubleArray *) NIL_CHK(matrix)) replaceDoubleAtIndex:3 withDouble:m11_];
  [((IOSDoubleArray *) NIL_CHK(matrix)) replaceDoubleAtIndex:4 withDouble:tx__];
  [((IOSDoubleArray *) NIL_CHK(matrix)) replaceDoubleAtIndex:5 withDouble:ty__];
}

- (id<PythagorasDTransform>)setUniformScaleWithDouble:(double)scale_ {
  return [self setScaleWithDouble:scale_ withDouble:scale_];
}

- (id<PythagorasDTransform>)setScaleXWithDouble:(double)scaleX {
  double mult = scaleX / [self scaleX];
  m00_ *= mult;
  m01_ *= mult;
  return self;
}

- (id<PythagorasDTransform>)setScaleYWithDouble:(double)scaleY {
  double mult = scaleY / [self scaleY];
  m10_ *= mult;
  m11_ *= mult;
  return self;
}

- (id<PythagorasDTransform>)setRotationWithDouble:(double)angle {
  double sx = [self scaleX], sy = [self scaleY];
  double sina = [JavaLangMath sinWithDouble:angle], cosa = [JavaLangMath cosWithDouble:angle];
  m00_ = cosa * sx;
  m01_ = sina * sx;
  m10_ = -sina * sy;
  m11_ = cosa * sy;
  return self;
}

- (id<PythagorasDTransform>)setTranslationWithDouble:(double)tx
                                          withDouble:(double)ty {
  self.tx_ = tx;
  self.ty_ = ty;
  return self;
}

- (id<PythagorasDTransform>)setTxWithDouble:(double)tx {
  self.tx_ = tx;
  return self;
}

- (id<PythagorasDTransform>)setTyWithDouble:(double)ty {
  self.ty_ = ty;
  return self;
}

- (id<PythagorasDTransform>)setTransformWithDouble:(double)m00
                                        withDouble:(double)m01
                                        withDouble:(double)m10
                                        withDouble:(double)m11
                                        withDouble:(double)tx
                                        withDouble:(double)ty {
  self.m00 = m00;
  self.m01 = m01;
  self.m10 = m10;
  self.m11 = m11;
  self.tx_ = tx;
  self.ty_ = ty;
  return self;
}

- (id<PythagorasDTransform>)uniformScaleWithDouble:(double)scale_ {
  return [self scale__WithDouble:scale_ withDouble:scale_];
}

- (id<PythagorasDTransform>)scale__WithDouble:(double)scaleX
                                   withDouble:(double)scaleY {
  return ((PythagorasDAffineTransform *) [PythagorasDTransforms multiplyWithPythagorasDAffineTransform:self withDouble:scaleX withDouble:0 withDouble:0 withDouble:scaleY withDouble:0 withDouble:0 withId:self]);
}

- (id<PythagorasDTransform>)scaleXWithDouble:(double)scaleX {
  return ((PythagorasDAffineTransform *) [PythagorasDTransforms multiplyWithPythagorasDAffineTransform:self withDouble:scaleX withDouble:0 withDouble:0 withDouble:1 withDouble:0 withDouble:0 withId:self]);
}

- (id<PythagorasDTransform>)scaleYWithDouble:(double)scaleY {
  return ((PythagorasDAffineTransform *) [PythagorasDTransforms multiplyWithPythagorasDAffineTransform:self withDouble:1 withDouble:0 withDouble:0 withDouble:scaleY withDouble:0 withDouble:0 withId:self]);
}

- (id<PythagorasDTransform>)rotateWithDouble:(double)angle {
  double sina = [JavaLangMath sinWithDouble:angle], cosa = [JavaLangMath cosWithDouble:angle];
  return ((PythagorasDAffineTransform *) [PythagorasDTransforms multiplyWithPythagorasDAffineTransform:self withDouble:cosa withDouble:sina withDouble:-sina withDouble:cosa withDouble:0 withDouble:0 withId:self]);
}

- (id<PythagorasDTransform>)translateWithDouble:(double)tx
                                     withDouble:(double)ty {
  return ((PythagorasDAffineTransform *) [PythagorasDTransforms multiplyWithPythagorasDAffineTransform:self withDouble:1 withDouble:0 withDouble:0 withDouble:1 withDouble:tx withDouble:ty withId:self]);
}

- (id<PythagorasDTransform>)translateXWithDouble:(double)tx {
  return ((PythagorasDAffineTransform *) [PythagorasDTransforms multiplyWithPythagorasDAffineTransform:self withDouble:1 withDouble:0 withDouble:0 withDouble:1 withDouble:tx withDouble:0 withId:self]);
}

- (id<PythagorasDTransform>)translateYWithDouble:(double)ty {
  return ((PythagorasDAffineTransform *) [PythagorasDTransforms multiplyWithPythagorasDAffineTransform:self withDouble:1 withDouble:0 withDouble:0 withDouble:1 withDouble:0 withDouble:ty withId:self]);
}

- (id<PythagorasDTransform>)invert {
  double det = m00_ * m11_ - m10_ * m01_;
  if ([JavaLangMath absWithDouble:det] == 0.0f) {
    @throw [[[PythagorasUtilNoninvertibleTransformException alloc] initWithNSString:[self description]] autorelease];
  }
  double rdet = 1.0f / det;
  return [[[PythagorasDAffineTransform alloc] initWithDouble:+m11_ * rdet withDouble:-m10_ * rdet withDouble:-m01_ * rdet withDouble:+m00_ * rdet withDouble:(m10_ * ty__ - m11_ * tx__) * rdet withDouble:(m01_ * tx__ - m00_ * ty__) * rdet] autorelease];
}

- (id<PythagorasDTransform>)concatenateWithPythagorasDTransform:(id<PythagorasDTransform>)other {
  if ([self generality] < [((id<PythagorasDTransform>) NIL_CHK(other)) generality]) {
    return [((id<PythagorasDTransform>) NIL_CHK(other)) preConcatenateWithPythagorasDTransform:self];
  }
  if ([(id) other isKindOfClass:[PythagorasDAffineTransform class]]) {
    return ((PythagorasDAffineTransform *) [PythagorasDTransforms multiplyWithPythagorasDAffineTransform:self withPythagorasDAffineTransform:(PythagorasDAffineTransform *) other withId:[[[PythagorasDAffineTransform alloc] init] autorelease]]);
  }
  else {
    PythagorasDAffineTransform *oaff = [[[PythagorasDAffineTransform alloc] initWithPythagorasDTransform:other] autorelease];
    return ((PythagorasDAffineTransform *) [PythagorasDTransforms multiplyWithPythagorasDAffineTransform:self withPythagorasDAffineTransform:oaff withId:oaff]);
  }
}

- (id<PythagorasDTransform>)preConcatenateWithPythagorasDTransform:(id<PythagorasDTransform>)other {
  if ([self generality] < [((id<PythagorasDTransform>) NIL_CHK(other)) generality]) {
    return [((id<PythagorasDTransform>) NIL_CHK(other)) concatenateWithPythagorasDTransform:self];
  }
  if ([(id) other isKindOfClass:[PythagorasDAffineTransform class]]) {
    return ((PythagorasDAffineTransform *) [PythagorasDTransforms multiplyWithPythagorasDAffineTransform:(PythagorasDAffineTransform *) other withPythagorasDAffineTransform:self withId:[[[PythagorasDAffineTransform alloc] init] autorelease]]);
  }
  else {
    PythagorasDAffineTransform *oaff = [[[PythagorasDAffineTransform alloc] initWithPythagorasDTransform:other] autorelease];
    return ((PythagorasDAffineTransform *) [PythagorasDTransforms multiplyWithPythagorasDAffineTransform:oaff withPythagorasDAffineTransform:self withId:oaff]);
  }
}

- (id<PythagorasDTransform>)lerpWithPythagorasDTransform:(id<PythagorasDTransform>)other
                                              withDouble:(double)t {
  if ([self generality] < [((id<PythagorasDTransform>) NIL_CHK(other)) generality]) {
    return [((id<PythagorasDTransform>) NIL_CHK(other)) lerpWithPythagorasDTransform:self withDouble:-t];
  }
  PythagorasDAffineTransform *ot = ([(id) other isKindOfClass:[PythagorasDAffineTransform class]]) ? (PythagorasDAffineTransform *) other : [[[PythagorasDAffineTransform alloc] initWithPythagorasDTransform:other] autorelease];
  return [[[PythagorasDAffineTransform alloc] initWithDouble:m00_ + t * (((PythagorasDAffineTransform *) NIL_CHK(ot)).m00 - m00_) withDouble:m01_ + t * (((PythagorasDAffineTransform *) NIL_CHK(ot)).m01 - m01_) withDouble:m10_ + t * (((PythagorasDAffineTransform *) NIL_CHK(ot)).m10 - m10_) withDouble:m11_ + t * (((PythagorasDAffineTransform *) NIL_CHK(ot)).m11 - m11_) withDouble:tx__ + t * (((PythagorasDAffineTransform *) NIL_CHK(ot)).tx_ - tx__) withDouble:ty__ + t * (((PythagorasDAffineTransform *) NIL_CHK(ot)).ty_ - ty__)] autorelease];
}

- (PythagorasDPoint *)transformWithPythagorasDIPoint:(id<PythagorasDIPoint>)p
                                withPythagorasDPoint:(PythagorasDPoint *)into {
  double x = [((id<PythagorasDIPoint>) NIL_CHK(p)) x], y = [((id<PythagorasDIPoint>) NIL_CHK(p)) y];
  return [((PythagorasDPoint *) NIL_CHK(into)) setWithDouble:m00_ * x + m10_ * y + tx__ withDouble:m01_ * x + m11_ * y + ty__];
}

- (void)transformWithPythagorasDIPointArray:(IOSObjectArray *)src
                                    withInt:(int)srcOff
                  withPythagorasDPointArray:(IOSObjectArray *)dst
                                    withInt:(int)dstOff
                                    withInt:(int)count {
  for (int ii = 0; ii < count; ii++) {
    (void) [self transformWithPythagorasDIPoint:((id<PythagorasDIPoint>) [((IOSObjectArray *) NIL_CHK(src)) objectAtIndex:srcOff++]) withPythagorasDPoint:((PythagorasDPoint *) [((IOSObjectArray *) NIL_CHK(dst)) objectAtIndex:dstOff++])];
  }
}

- (void)transformWithJavaLangDoubleArray:(IOSDoubleArray *)src
                                 withInt:(int)srcOff
                 withJavaLangDoubleArray:(IOSDoubleArray *)dst
                                 withInt:(int)dstOff
                                 withInt:(int)count {
  for (int ii = 0; ii < count; ii++) {
    double x = [((IOSDoubleArray *) NIL_CHK(src)) doubleAtIndex:srcOff++], y = [((IOSDoubleArray *) NIL_CHK(src)) doubleAtIndex:srcOff++];
    [((IOSDoubleArray *) NIL_CHK(dst)) replaceDoubleAtIndex:dstOff++ withDouble:m00_ * x + m10_ * y + tx__];
    [((IOSDoubleArray *) NIL_CHK(dst)) replaceDoubleAtIndex:dstOff++ withDouble:m01_ * x + m11_ * y + ty__];
  }
}

- (PythagorasDPoint *)inverseTransformWithPythagorasDIPoint:(id<PythagorasDIPoint>)p
                                       withPythagorasDPoint:(PythagorasDPoint *)into {
  double x = [((id<PythagorasDIPoint>) NIL_CHK(p)) x] - tx__, y = [((id<PythagorasDIPoint>) NIL_CHK(p)) y] - ty__;
  double det = m00_ * m11_ - m01_ * m10_;
  if ([JavaLangMath absWithDouble:det] == 0.0f) {
    @throw [[[PythagorasUtilNoninvertibleTransformException alloc] initWithNSString:[self description]] autorelease];
  }
  double rdet = 1 / det;
  return [((PythagorasDPoint *) NIL_CHK(into)) setWithDouble:(x * m11_ - y * m10_) * rdet withDouble:(y * m00_ - x * m01_) * rdet];
}

- (PythagorasDVector *)transformPointWithPythagorasDIVector:(id<PythagorasDIVector>)v
                                      withPythagorasDVector:(PythagorasDVector *)into {
  double x = [((id<PythagorasDIVector>) NIL_CHK(v)) x], y = [((id<PythagorasDIVector>) NIL_CHK(v)) y];
  return [((PythagorasDVector *) NIL_CHK(into)) setWithDouble:m00_ * x + m10_ * y + tx__ withDouble:m01_ * x + m11_ * y + ty__];
}

- (PythagorasDVector *)transformWithPythagorasDIVector:(id<PythagorasDIVector>)v
                                 withPythagorasDVector:(PythagorasDVector *)into {
  double x = [((id<PythagorasDIVector>) NIL_CHK(v)) x], y = [((id<PythagorasDIVector>) NIL_CHK(v)) y];
  return [((PythagorasDVector *) NIL_CHK(into)) setWithDouble:m00_ * x + m10_ * y withDouble:m01_ * x + m11_ * y];
}

- (PythagorasDVector *)inverseTransformWithPythagorasDIVector:(id<PythagorasDIVector>)v
                                        withPythagorasDVector:(PythagorasDVector *)into {
  double x = [((id<PythagorasDIVector>) NIL_CHK(v)) x], y = [((id<PythagorasDIVector>) NIL_CHK(v)) y];
  double det = m00_ * m11_ - m01_ * m10_;
  if ([JavaLangMath absWithDouble:det] == 0.0f) {
    @throw [[[PythagorasUtilNoninvertibleTransformException alloc] initWithNSString:[self description]] autorelease];
  }
  double rdet = 1 / det;
  return [((PythagorasDVector *) NIL_CHK(into)) setWithDouble:(x * m11_ - y * m10_) * rdet withDouble:(y * m00_ - x * m01_) * rdet];
}

- (id<PythagorasDTransform>)copy__ OBJC_METHOD_FAMILY_NONE {
  return [[[PythagorasDAffineTransform alloc] initWithDouble:m00_ withDouble:m01_ withDouble:m10_ withDouble:m11_ withDouble:tx__ withDouble:ty__] autorelease];
}

- (int)generality {
  return PythagorasDAffineTransform_GENERALITY;
}

- (NSString *)description {
  return [NSString stringWithFormat:@"affine [%@ %@ %@ %@ %@]", [PythagorasDMathUtil toStringWithDouble:m00_], [PythagorasDMathUtil toStringWithDouble:m01_], [PythagorasDMathUtil toStringWithDouble:m10_], [PythagorasDMathUtil toStringWithDouble:m11_], [self translation]];
}

- (id)initWithPythagorasDTransform:(id<PythagorasDTransform>)other {
  return [self initPythagorasDAffineTransformWithDouble:[((id<PythagorasDTransform>) NIL_CHK(other)) scaleX] withDouble:[((id<PythagorasDTransform>) NIL_CHK(other)) scaleY] withDouble:[((id<PythagorasDTransform>) NIL_CHK(other)) rotation] withDouble:[((id<PythagorasDTransform>) NIL_CHK(other)) tx] withDouble:[((id<PythagorasDTransform>) NIL_CHK(other)) ty]];
}

- (void)dealloc {
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  PythagorasDAffineTransform *typedCopy = (PythagorasDAffineTransform *) copy;
  typedCopy.m00 = m00_;
  typedCopy.m01 = m01_;
  typedCopy.m10 = m10_;
  typedCopy.m11 = m11_;
  typedCopy.tx_ = tx__;
  typedCopy.ty_ = ty__;
}

@end
