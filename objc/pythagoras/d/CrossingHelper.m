//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: pythagoras/d/CrossingHelper.java
//
//  Created by Thomas on 7/9/13.
//

#import "IOSDoubleArray.h"
#import "IOSIntArray.h"
#import "IOSObjectArray.h"
#import "java/lang/IndexOutOfBoundsException.h"
#import "java/util/ArrayList.h"
#import "java/util/Iterator.h"
#import "java/util/List.h"
#import "pythagoras/d/GeometryUtil.h"
#import "pythagoras/d/IntersectPoint.h"
#import "CrossingHelper.h"

@implementation PythagorasDCrossingHelper

- (IOSObjectArray *)coords {
  return coords_;
}
- (void)setCoords:(IOSObjectArray *)coords {
  JreOperatorRetainedAssign(&coords_, self, coords);
}
@synthesize coords = coords_;
- (IOSIntArray *)sizes {
  return sizes_;
}
- (void)setSizes:(IOSIntArray *)sizes {
  JreOperatorRetainedAssign(&sizes_, self, sizes);
}
@synthesize sizes = sizes_;
- (id<JavaUtilList>)isectPoints {
  return isectPoints_;
}
- (void)setIsectPoints:(id<JavaUtilList>)isectPoints {
  JreOperatorRetainedAssign(&isectPoints_, self, isectPoints);
}
@synthesize isectPoints = isectPoints_;

- (id)initWithJavaLangDoubleArray:(IOSObjectArray *)coords
         withJavaLangIntegerArray:(IOSIntArray *)sizes {
  if ((self = [super init])) {
    JreOperatorRetainedAssign(&isectPoints_, self, [[[JavaUtilArrayList alloc] init] autorelease]);
    self.coords = coords;
    self.sizes = sizes;
  }
  return self;
}

- (IOSObjectArray *)findCrossing {
  int pointCount1 = [((IOSIntArray *) NIL_CHK(sizes_)) intAtIndex:0] / 2;
  int pointCount2 = [((IOSIntArray *) NIL_CHK(sizes_)) intAtIndex:1] / 2;
  IOSIntArray *indices = [[[IOSIntArray alloc] initWithLength:pointCount1 + pointCount2] autorelease];
  for (int i = 0; i < pointCount1 + pointCount2; i++) {
    [((IOSIntArray *) NIL_CHK(indices)) replaceIntAtIndex:i withInt:i];
  }
  [PythagorasDCrossingHelper sortWithJavaLangDoubleArray:((IOSDoubleArray *) [((IOSObjectArray *) NIL_CHK(coords_)) objectAtIndex:0]) withInt:pointCount1 withJavaLangDoubleArray:((IOSDoubleArray *) [((IOSObjectArray *) NIL_CHK(coords_)) objectAtIndex:1]) withInt:pointCount2 withJavaLangIntegerArray:indices];
  id<JavaUtilList> edges = [[[JavaUtilArrayList alloc] init] autorelease];
  PythagorasDCrossingHelper_Edge *edge;
  int begIndex, endIndex;
  int areaNumber;
  for (int i = 0; i < (int) [((IOSIntArray *) NIL_CHK(indices)) count]; i++) {
    if ([((IOSIntArray *) NIL_CHK(indices)) intAtIndex:i] < pointCount1) {
      begIndex = [((IOSIntArray *) NIL_CHK(indices)) intAtIndex:i];
      endIndex = [((IOSIntArray *) NIL_CHK(indices)) intAtIndex:i] - 1;
      if (endIndex < 0) {
        endIndex = pointCount1 - 1;
      }
      areaNumber = 0;
    }
    else if ([((IOSIntArray *) NIL_CHK(indices)) intAtIndex:i] < pointCount1 + pointCount2) {
      begIndex = [((IOSIntArray *) NIL_CHK(indices)) intAtIndex:i] - pointCount1;
      endIndex = [((IOSIntArray *) NIL_CHK(indices)) intAtIndex:i] - 1 - pointCount1;
      if (endIndex < 0) {
        endIndex = pointCount2 - 1;
      }
      areaNumber = 1;
    }
    else {
      @throw [[[JavaLangIndexOutOfBoundsException alloc] init] autorelease];
    }
    if (![self removeEdgeWithJavaUtilList:edges withInt:begIndex withInt:endIndex]) {
      edge = [[[PythagorasDCrossingHelper_Edge alloc] initWithInt:begIndex withInt:endIndex withInt:areaNumber] autorelease];
      [self intersectShapeWithJavaUtilList:edges withJavaLangDoubleArray:((IOSDoubleArray *) [((IOSObjectArray *) NIL_CHK(coords_)) objectAtIndex:0]) withInt:pointCount1 withJavaLangDoubleArray:((IOSDoubleArray *) [((IOSObjectArray *) NIL_CHK(coords_)) objectAtIndex:1]) withInt:pointCount2 withPythagorasDCrossingHelper_Edge:edge];
      [((id<JavaUtilList>) NIL_CHK(edges)) addWithId:edge];
    }
    begIndex = [((IOSIntArray *) NIL_CHK(indices)) intAtIndex:i];
    endIndex = [((IOSIntArray *) NIL_CHK(indices)) intAtIndex:i] + 1;
    if ((begIndex < pointCount1) && (endIndex == pointCount1)) {
      endIndex = 0;
    }
    else if ((begIndex >= pointCount1) && (endIndex == (pointCount2 + pointCount1))) {
      endIndex = pointCount1;
    }
    if (endIndex < pointCount1) {
      areaNumber = 0;
    }
    else {
      areaNumber = 1;
      endIndex -= pointCount1;
      begIndex -= pointCount1;
    }
    if (![self removeEdgeWithJavaUtilList:edges withInt:begIndex withInt:endIndex]) {
      edge = [[[PythagorasDCrossingHelper_Edge alloc] initWithInt:begIndex withInt:endIndex withInt:areaNumber] autorelease];
      [self intersectShapeWithJavaUtilList:edges withJavaLangDoubleArray:((IOSDoubleArray *) [((IOSObjectArray *) NIL_CHK(coords_)) objectAtIndex:0]) withInt:pointCount1 withJavaLangDoubleArray:((IOSDoubleArray *) [((IOSObjectArray *) NIL_CHK(coords_)) objectAtIndex:1]) withInt:pointCount2 withPythagorasDCrossingHelper_Edge:edge];
      [((id<JavaUtilList>) NIL_CHK(edges)) addWithId:edge];
    }
  }
  return [((id<JavaUtilList>) NIL_CHK(isectPoints_)) toArrayWithNSObjectArray:[[[IOSObjectArray alloc] initWithLength:[((id<JavaUtilList>) NIL_CHK(isectPoints_)) size] type:[IOSClass classWithClass:[PythagorasDIntersectPoint class]]] autorelease]];
}

- (BOOL)removeEdgeWithJavaUtilList:(id<JavaUtilList>)edges
                           withInt:(int)begIndex
                           withInt:(int)endIndex {
  {
    id<JavaUtilIterator> iter__ = ((id<JavaUtilIterator>) [((id<JavaUtilList>) NIL_CHK(edges)) iterator]);
    while ([((id<JavaUtilIterator>) NIL_CHK(iter__)) hasNext]) {
      PythagorasDCrossingHelper_Edge *edge = ((PythagorasDCrossingHelper_Edge *) [((id<JavaUtilIterator>) NIL_CHK(iter__)) next]);
      if ([((PythagorasDCrossingHelper_Edge *) NIL_CHK(edge)) reverseCompareWithInt:begIndex withInt:endIndex]) {
        [((id<JavaUtilList>) NIL_CHK(edges)) removeWithId:edge];
        return YES;
      }
    }
  }
  return NO;
}

- (void)intersectShapeWithJavaUtilList:(id<JavaUtilList>)edges
               withJavaLangDoubleArray:(IOSDoubleArray *)coords1
                               withInt:(int)length1
               withJavaLangDoubleArray:(IOSDoubleArray *)coords2
                               withInt:(int)length2
    withPythagorasDCrossingHelper_Edge:(PythagorasDCrossingHelper_Edge *)initEdge {
  int areaOfEdge1, areaOfEdge2;
  int initBegin, initEnd;
  int addBegin, addEnd;
  double x1, y1, x2, y2, x3, y3, x4, y4;
  IOSDoubleArray *point = [[[IOSDoubleArray alloc] initWithLength:2] autorelease];
  PythagorasDCrossingHelper_Edge *edge;
  if (((PythagorasDCrossingHelper_Edge *) NIL_CHK(initEdge)).areaNumber == 0) {
    x1 = [((IOSDoubleArray *) NIL_CHK(coords1)) doubleAtIndex:2 * ((PythagorasDCrossingHelper_Edge *) NIL_CHK(initEdge)).begIndex];
    y1 = [((IOSDoubleArray *) NIL_CHK(coords1)) doubleAtIndex:2 * ((PythagorasDCrossingHelper_Edge *) NIL_CHK(initEdge)).begIndex + 1];
    x2 = [((IOSDoubleArray *) NIL_CHK(coords1)) doubleAtIndex:2 * ((PythagorasDCrossingHelper_Edge *) NIL_CHK(initEdge)).endIndex];
    y2 = [((IOSDoubleArray *) NIL_CHK(coords1)) doubleAtIndex:2 * ((PythagorasDCrossingHelper_Edge *) NIL_CHK(initEdge)).endIndex + 1];
    areaOfEdge1 = 0;
  }
  else {
    x1 = [((IOSDoubleArray *) NIL_CHK(coords2)) doubleAtIndex:2 * ((PythagorasDCrossingHelper_Edge *) NIL_CHK(initEdge)).begIndex];
    y1 = [((IOSDoubleArray *) NIL_CHK(coords2)) doubleAtIndex:2 * ((PythagorasDCrossingHelper_Edge *) NIL_CHK(initEdge)).begIndex + 1];
    x2 = [((IOSDoubleArray *) NIL_CHK(coords2)) doubleAtIndex:2 * ((PythagorasDCrossingHelper_Edge *) NIL_CHK(initEdge)).endIndex];
    y2 = [((IOSDoubleArray *) NIL_CHK(coords2)) doubleAtIndex:2 * ((PythagorasDCrossingHelper_Edge *) NIL_CHK(initEdge)).endIndex + 1];
    areaOfEdge1 = 1;
  }
  for (id<JavaUtilIterator> iter = ((id<JavaUtilIterator>) [((id<JavaUtilList>) NIL_CHK(edges)) iterator]); [((id<JavaUtilIterator>) NIL_CHK(iter)) hasNext]; ) {
    edge = ((PythagorasDCrossingHelper_Edge *) [((id<JavaUtilIterator>) NIL_CHK(iter)) next]);
    if (((PythagorasDCrossingHelper_Edge *) NIL_CHK(edge)).areaNumber == 0) {
      x3 = [((IOSDoubleArray *) NIL_CHK(coords1)) doubleAtIndex:2 * ((PythagorasDCrossingHelper_Edge *) NIL_CHK(edge)).begIndex];
      y3 = [((IOSDoubleArray *) NIL_CHK(coords1)) doubleAtIndex:2 * ((PythagorasDCrossingHelper_Edge *) NIL_CHK(edge)).begIndex + 1];
      x4 = [((IOSDoubleArray *) NIL_CHK(coords1)) doubleAtIndex:2 * ((PythagorasDCrossingHelper_Edge *) NIL_CHK(edge)).endIndex];
      y4 = [((IOSDoubleArray *) NIL_CHK(coords1)) doubleAtIndex:2 * ((PythagorasDCrossingHelper_Edge *) NIL_CHK(edge)).endIndex + 1];
      areaOfEdge2 = 0;
    }
    else {
      x3 = [((IOSDoubleArray *) NIL_CHK(coords2)) doubleAtIndex:2 * ((PythagorasDCrossingHelper_Edge *) NIL_CHK(edge)).begIndex];
      y3 = [((IOSDoubleArray *) NIL_CHK(coords2)) doubleAtIndex:2 * ((PythagorasDCrossingHelper_Edge *) NIL_CHK(edge)).begIndex + 1];
      x4 = [((IOSDoubleArray *) NIL_CHK(coords2)) doubleAtIndex:2 * ((PythagorasDCrossingHelper_Edge *) NIL_CHK(edge)).endIndex];
      y4 = [((IOSDoubleArray *) NIL_CHK(coords2)) doubleAtIndex:2 * ((PythagorasDCrossingHelper_Edge *) NIL_CHK(edge)).endIndex + 1];
      areaOfEdge2 = 1;
    }
    if ((areaOfEdge1 != areaOfEdge2) && ([PythagorasDGeometryUtil intersectLinesWithDouble:x1 withDouble:y1 withDouble:x2 withDouble:y2 withDouble:x3 withDouble:y3 withDouble:x4 withDouble:y4 withJavaLangDoubleArray:point] == 1) && (![self containsPointWithJavaLangDoubleArray:point])) {
      if (((PythagorasDCrossingHelper_Edge *) NIL_CHK(initEdge)).areaNumber == 0) {
        initBegin = ((PythagorasDCrossingHelper_Edge *) NIL_CHK(initEdge)).begIndex;
        initEnd = ((PythagorasDCrossingHelper_Edge *) NIL_CHK(initEdge)).endIndex;
        addBegin = ((PythagorasDCrossingHelper_Edge *) NIL_CHK(edge)).begIndex;
        addEnd = ((PythagorasDCrossingHelper_Edge *) NIL_CHK(edge)).endIndex;
      }
      else {
        initBegin = ((PythagorasDCrossingHelper_Edge *) NIL_CHK(edge)).begIndex;
        initEnd = ((PythagorasDCrossingHelper_Edge *) NIL_CHK(edge)).endIndex;
        addBegin = ((PythagorasDCrossingHelper_Edge *) NIL_CHK(initEdge)).begIndex;
        addEnd = ((PythagorasDCrossingHelper_Edge *) NIL_CHK(initEdge)).endIndex;
      }
      if (((initEnd == length1 - 1) && (initBegin == 0 && initEnd > initBegin)) || (((initEnd != length1 - 1) || (initBegin != 0)) && ((initBegin != length1 - 1) || (initEnd != 0)) && (initBegin > initEnd))) {
        int temp = initBegin;
        initBegin = initEnd;
        initEnd = temp;
      }
      if (((addEnd == length2 - 1) && (addBegin == 0) && (addEnd > addBegin)) || (((addEnd != length2 - 1) || (addBegin != 0)) && ((addBegin != length2 - 1) || (addEnd != 0)) && (addBegin > addEnd))) {
        int temp = addBegin;
        addBegin = addEnd;
        addEnd = temp;
      }
      PythagorasDIntersectPoint *ip;
      for (id<JavaUtilIterator> i = ((id<JavaUtilIterator>) [((id<JavaUtilList>) NIL_CHK(isectPoints_)) iterator]); [((id<JavaUtilIterator>) NIL_CHK(i)) hasNext]; ) {
        ip = ((PythagorasDIntersectPoint *) [((id<JavaUtilIterator>) NIL_CHK(i)) next]);
        if ((initBegin == [((PythagorasDIntersectPoint *) NIL_CHK(ip)) begIndexWithBOOL:YES]) && (initEnd == [((PythagorasDIntersectPoint *) NIL_CHK(ip)) endIndexWithBOOL:YES])) {
          if ([PythagorasDCrossingHelper compareWithDouble:[((PythagorasDIntersectPoint *) NIL_CHK(ip)) x] withDouble:[((PythagorasDIntersectPoint *) NIL_CHK(ip)) y] withDouble:[((IOSDoubleArray *) NIL_CHK(point)) doubleAtIndex:0] withDouble:[((IOSDoubleArray *) NIL_CHK(point)) doubleAtIndex:1]] > 0) {
            initEnd = -([((id<JavaUtilList>) NIL_CHK(isectPoints_)) indexOfWithId:ip] + 1);
            [((PythagorasDIntersectPoint *) NIL_CHK(ip)) setBegIndex1WithInt:-([((id<JavaUtilList>) NIL_CHK(isectPoints_)) size] + 1)];
          }
          else {
            initBegin = -([((id<JavaUtilList>) NIL_CHK(isectPoints_)) indexOfWithId:ip] + 1);
            [((PythagorasDIntersectPoint *) NIL_CHK(ip)) setEndIndex1WithInt:-([((id<JavaUtilList>) NIL_CHK(isectPoints_)) size] + 1)];
          }
        }
        if ((addBegin == [((PythagorasDIntersectPoint *) NIL_CHK(ip)) begIndexWithBOOL:NO]) && (addEnd == [((PythagorasDIntersectPoint *) NIL_CHK(ip)) endIndexWithBOOL:NO])) {
          if ([PythagorasDCrossingHelper compareWithDouble:[((PythagorasDIntersectPoint *) NIL_CHK(ip)) x] withDouble:[((PythagorasDIntersectPoint *) NIL_CHK(ip)) y] withDouble:[((IOSDoubleArray *) NIL_CHK(point)) doubleAtIndex:0] withDouble:[((IOSDoubleArray *) NIL_CHK(point)) doubleAtIndex:1]] > 0) {
            addEnd = -([((id<JavaUtilList>) NIL_CHK(isectPoints_)) indexOfWithId:ip] + 1);
            [((PythagorasDIntersectPoint *) NIL_CHK(ip)) setBegIndex2WithInt:-([((id<JavaUtilList>) NIL_CHK(isectPoints_)) size] + 1)];
          }
          else {
            addBegin = -([((id<JavaUtilList>) NIL_CHK(isectPoints_)) indexOfWithId:ip] + 1);
            [((PythagorasDIntersectPoint *) NIL_CHK(ip)) setEndIndex2WithInt:-([((id<JavaUtilList>) NIL_CHK(isectPoints_)) size] + 1)];
          }
        }
      }
      [((id<JavaUtilList>) NIL_CHK(isectPoints_)) addWithId:[[[PythagorasDIntersectPoint alloc] initWithInt:initBegin withInt:initEnd withInt:addBegin withInt:addEnd withDouble:[((IOSDoubleArray *) NIL_CHK(point)) doubleAtIndex:0] withDouble:[((IOSDoubleArray *) NIL_CHK(point)) doubleAtIndex:1]] autorelease]];
    }
  }
}

+ (void)sortWithJavaLangDoubleArray:(IOSDoubleArray *)coords1
                            withInt:(int)length1
            withJavaLangDoubleArray:(IOSDoubleArray *)coords2
                            withInt:(int)length2
           withJavaLangIntegerArray:(IOSIntArray *)array {
  int temp;
  int length = length1 + length2;
  double x1, y1, x2, y2;
  for (int i = 1; i < length; i++) {
    if ([((IOSIntArray *) NIL_CHK(array)) intAtIndex:i - 1] < length1) {
      x1 = [((IOSDoubleArray *) NIL_CHK(coords1)) doubleAtIndex:2 * [((IOSIntArray *) NIL_CHK(array)) intAtIndex:i - 1]];
      y1 = [((IOSDoubleArray *) NIL_CHK(coords1)) doubleAtIndex:2 * [((IOSIntArray *) NIL_CHK(array)) intAtIndex:i - 1] + 1];
    }
    else {
      x1 = [((IOSDoubleArray *) NIL_CHK(coords2)) doubleAtIndex:2 * ([((IOSIntArray *) NIL_CHK(array)) intAtIndex:i - 1] - length1)];
      y1 = [((IOSDoubleArray *) NIL_CHK(coords2)) doubleAtIndex:2 * ([((IOSIntArray *) NIL_CHK(array)) intAtIndex:i - 1] - length1) + 1];
    }
    if ([((IOSIntArray *) NIL_CHK(array)) intAtIndex:i] < length1) {
      x2 = [((IOSDoubleArray *) NIL_CHK(coords1)) doubleAtIndex:2 * [((IOSIntArray *) NIL_CHK(array)) intAtIndex:i]];
      y2 = [((IOSDoubleArray *) NIL_CHK(coords1)) doubleAtIndex:2 * [((IOSIntArray *) NIL_CHK(array)) intAtIndex:i] + 1];
    }
    else {
      x2 = [((IOSDoubleArray *) NIL_CHK(coords2)) doubleAtIndex:2 * ([((IOSIntArray *) NIL_CHK(array)) intAtIndex:i] - length1)];
      y2 = [((IOSDoubleArray *) NIL_CHK(coords2)) doubleAtIndex:2 * ([((IOSIntArray *) NIL_CHK(array)) intAtIndex:i] - length1) + 1];
    }
    int j = i;
    while (j > 0 && [PythagorasDCrossingHelper compareWithDouble:x1 withDouble:y1 withDouble:x2 withDouble:y2] <= 0) {
      temp = [((IOSIntArray *) NIL_CHK(array)) intAtIndex:j];
      [((IOSIntArray *) NIL_CHK(array)) replaceIntAtIndex:j withInt:[((IOSIntArray *) NIL_CHK(array)) intAtIndex:j - 1]];
      [((IOSIntArray *) NIL_CHK(array)) replaceIntAtIndex:j - 1 withInt:temp];
      j--;
      if (j > 0) {
        if ([((IOSIntArray *) NIL_CHK(array)) intAtIndex:j - 1] < length1) {
          x1 = [((IOSDoubleArray *) NIL_CHK(coords1)) doubleAtIndex:2 * [((IOSIntArray *) NIL_CHK(array)) intAtIndex:j - 1]];
          y1 = [((IOSDoubleArray *) NIL_CHK(coords1)) doubleAtIndex:2 * [((IOSIntArray *) NIL_CHK(array)) intAtIndex:j - 1] + 1];
        }
        else {
          x1 = [((IOSDoubleArray *) NIL_CHK(coords2)) doubleAtIndex:2 * ([((IOSIntArray *) NIL_CHK(array)) intAtIndex:j - 1] - length1)];
          y1 = [((IOSDoubleArray *) NIL_CHK(coords2)) doubleAtIndex:2 * ([((IOSIntArray *) NIL_CHK(array)) intAtIndex:j - 1] - length1) + 1];
        }
        if ([((IOSIntArray *) NIL_CHK(array)) intAtIndex:j] < length1) {
          x2 = [((IOSDoubleArray *) NIL_CHK(coords1)) doubleAtIndex:2 * [((IOSIntArray *) NIL_CHK(array)) intAtIndex:j]];
          y2 = [((IOSDoubleArray *) NIL_CHK(coords1)) doubleAtIndex:2 * [((IOSIntArray *) NIL_CHK(array)) intAtIndex:j] + 1];
        }
        else {
          x2 = [((IOSDoubleArray *) NIL_CHK(coords2)) doubleAtIndex:2 * ([((IOSIntArray *) NIL_CHK(array)) intAtIndex:j] - length1)];
          y2 = [((IOSDoubleArray *) NIL_CHK(coords2)) doubleAtIndex:2 * ([((IOSIntArray *) NIL_CHK(array)) intAtIndex:j] - length1) + 1];
        }
      }
    }
  }
}

- (BOOL)containsPointWithJavaLangDoubleArray:(IOSDoubleArray *)point {
  PythagorasDIntersectPoint *ipoint;
  for (id<JavaUtilIterator> i = ((id<JavaUtilIterator>) [((id<JavaUtilList>) NIL_CHK(isectPoints_)) iterator]); [((id<JavaUtilIterator>) NIL_CHK(i)) hasNext]; ) {
    ipoint = ((PythagorasDIntersectPoint *) [((id<JavaUtilIterator>) NIL_CHK(i)) next]);
    if ([((PythagorasDIntersectPoint *) NIL_CHK(ipoint)) x] == [((IOSDoubleArray *) NIL_CHK(point)) doubleAtIndex:0] && [((PythagorasDIntersectPoint *) NIL_CHK(ipoint)) y] == [((IOSDoubleArray *) NIL_CHK(point)) doubleAtIndex:1]) {
      return YES;
    }
  }
  return NO;
}

+ (int)compareWithDouble:(double)x1
              withDouble:(double)y1
              withDouble:(double)x2
              withDouble:(double)y2 {
  if ((x1 < x2) || (x1 == x2 && y1 < y2)) {
    return 1;
  }
  else if (x1 == x2 && y1 == y2) {
    return 0;
  }
  return -1;
}

- (void)dealloc {
  JreOperatorRetainedAssign(&isectPoints_, self, nil);
  JreOperatorRetainedAssign(&sizes_, self, nil);
  JreOperatorRetainedAssign(&coords_, self, nil);
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  PythagorasDCrossingHelper *typedCopy = (PythagorasDCrossingHelper *) copy;
  typedCopy.coords = coords_;
  typedCopy.sizes = sizes_;
  typedCopy.isectPoints = isectPoints_;
}

@end
@implementation PythagorasDCrossingHelper_Edge

@synthesize begIndex = begIndex_;
@synthesize endIndex = endIndex_;
@synthesize areaNumber = areaNumber_;

- (id)initWithInt:(int)begIndex
          withInt:(int)endIndex
          withInt:(int)areaNumber {
  if ((self = [super init])) {
    self.begIndex = begIndex;
    self.endIndex = endIndex;
    self.areaNumber = areaNumber;
  }
  return self;
}

- (BOOL)reverseCompareWithInt:(int)begIndex
                      withInt:(int)endIndex {
  return self.begIndex == endIndex && self.endIndex == begIndex;
}

- (void)dealloc {
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  PythagorasDCrossingHelper_Edge *typedCopy = (PythagorasDCrossingHelper_Edge *) copy;
  typedCopy.begIndex = begIndex_;
  typedCopy.endIndex = endIndex_;
  typedCopy.areaNumber = areaNumber_;
}

@end
