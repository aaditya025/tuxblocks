//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: playn/core/json/JsonParser.java
//
//  Created by Thomas on 7/1/13.
//

#import "IOSCharArray.h"
#import "IOSClass.h"
#import "JsonArray.h"
#import "JsonObject.h"
#import "JsonParserException.h"
#import "java/lang/Boolean.h"
#import "java/lang/Double.h"
#import "java/lang/Exception.h"
#import "java/lang/IllegalArgumentException.h"
#import "java/lang/Integer.h"
#import "java/lang/Long.h"
#import "java/lang/Math.h"
#import "java/lang/NumberFormatException.h"
#import "java/lang/StringBuilder.h"
#import "java/math/BigInteger.h"
#import "JsonParser.h"

@implementation PlaynCoreJsonJsonParser

static IOSCharArray * PlaynCoreJsonJsonParser_TRUE__;
static IOSCharArray * PlaynCoreJsonJsonParser_FALSE__;
static IOSCharArray * PlaynCoreJsonJsonParser_NULL__;

@synthesize linePos = linePos_;
@synthesize rowPos = rowPos_;
@synthesize charOffset = charOffset_;
@synthesize utf8adjust = utf8adjust_;
@synthesize tokenLinePos = tokenLinePos_;
@synthesize tokenCharPos = tokenCharPos_;
@synthesize tokenCharOffset = tokenCharOffset_;
- (id)value {
  return value_;
}
- (void)setValue:(id)value {
  JreOperatorRetainedAssign(&value_, self, value);
}
@synthesize value = value_;
- (PlaynCoreJsonJsonParser_TokenEnum *)token {
  return token_;
}
- (void)setToken:(PlaynCoreJsonJsonParser_TokenEnum *)token {
  JreOperatorRetainedAssign(&token_, self, token);
}
@synthesize token = token_;
- (JavaLangStringBuilder *)reusableBuffer {
  return reusableBuffer_;
}
- (void)setReusableBuffer:(JavaLangStringBuilder *)reusableBuffer {
  JreOperatorRetainedAssign(&reusableBuffer_, self, reusableBuffer);
}
@synthesize reusableBuffer = reusableBuffer_;
@synthesize eof = eof_;
@synthesize index = index_;
- (NSString *)string {
  return string_;
}
- (void)setString:(NSString *)string {
  JreOperatorRetainedAssign(&string_, self, string);
}
@synthesize string = string_;
@synthesize bufferLength = bufferLength_;

+ (IOSCharArray *)getTRUE {
  return PlaynCoreJsonJsonParser_TRUE__;
}

+ (IOSCharArray *)getFALSE {
  return PlaynCoreJsonJsonParser_FALSE__;
}

+ (IOSCharArray *)getNULL {
  return PlaynCoreJsonJsonParser_NULL__;
}

- (id)initWithNSString:(NSString *)s {
  if ((self = [super init])) {
    linePos_ = 1;
    JreOperatorRetainedAssign(&reusableBuffer_, self, [[[JavaLangStringBuilder alloc] init] autorelease]);
    self.string = s;
    self.bufferLength = [NIL_CHK(s) length];
    eof_ = ([NIL_CHK(s) length] == 0);
  }
  return self;
}

+ (PlaynCoreJsonJsonParser_JsonParserContext *)object {
  return [[[PlaynCoreJsonJsonParser_JsonParserContext alloc] initWithIOSClass:[IOSClass classWithClass:[PlaynCoreJsonJsonObject class]]] autorelease];
}

+ (PlaynCoreJsonJsonParser_JsonParserContext *)array {
  return [[[PlaynCoreJsonJsonParser_JsonParserContext alloc] initWithIOSClass:[IOSClass classWithClass:[PlaynCoreJsonJsonArray class]]] autorelease];
}

+ (PlaynCoreJsonJsonParser_JsonParserContext *)any {
  return [[[PlaynCoreJsonJsonParser_JsonParserContext alloc] initWithIOSClass:[IOSClass classWithClass:[NSObject class]]] autorelease];
}

- (id)parseWithIOSClass:(IOSClass *)clazz {
  (void) [self advanceToken];
  id parsed = [self currentValue];
  if ([self advanceToken] != [PlaynCoreJsonJsonParser_TokenEnum EOF_]) @throw [self createParseExceptionWithJavaLangException:nil withNSString:[NSString stringWithFormat:@"Expected end of input, got %@", token_] withBOOL:YES];
  if (clazz != [IOSClass classWithClass:[NSObject class]] && (parsed == nil || clazz != [NIL_CHK(parsed) getClass])) @throw [self createParseExceptionWithJavaLangException:nil withNSString:[NSString stringWithFormat:@"JSON did not contain the correct type, expected %@.", [NIL_CHK(clazz) getName]] withBOOL:YES];
  return (id) (parsed);
}

- (id)currentValue {
  if (((PlaynCoreJsonJsonParser_TokenEnum *) NIL_CHK(token_)).isValue) return value_;
  @throw [self createParseExceptionWithJavaLangException:nil withNSString:[NSString stringWithFormat:@"Expected JSON value, got %@", token_] withBOOL:YES];
}

- (PlaynCoreJsonJsonParser_TokenEnum *)advanceToken {
  int c = [self advanceChar];
  while ([self isWhitespaceWithInt:c]) c = [self advanceChar];
  tokenLinePos_ = linePos_;
  tokenCharPos_ = index_ - rowPos_ - utf8adjust_;
  tokenCharOffset_ = charOffset_ + index_;
  {
    PlaynCoreJsonJsonArray *list;
    PlaynCoreJsonJsonObject *map;
    switch (c) {
      case -1:
      return JreOperatorRetainedAssign(&token_, self, [PlaynCoreJsonJsonParser_TokenEnum EOF_]);
      case '[':
      list = [[[PlaynCoreJsonJsonArray alloc] init] autorelease];
      if ([self advanceToken] != [PlaynCoreJsonJsonParser_TokenEnum ARRAY_END]) while (YES) {
        [((PlaynCoreJsonJsonArray *) NIL_CHK(list)) addWithId:[self currentValue]];
        if ([self advanceToken] == [PlaynCoreJsonJsonParser_TokenEnum ARRAY_END]) break;
        if (token_ != [PlaynCoreJsonJsonParser_TokenEnum COMMA]) @throw [self createParseExceptionWithJavaLangException:nil withNSString:[NSString stringWithFormat:@"Expected a comma or end of the array instead of %@", token_] withBOOL:YES];
        if ([self advanceToken] == [PlaynCoreJsonJsonParser_TokenEnum ARRAY_END]) @throw [self createParseExceptionWithJavaLangException:nil withNSString:@"Trailing comma found in array" withBOOL:YES];
      }
      JreOperatorRetainedAssign(&value_, self, list);
      return JreOperatorRetainedAssign(&token_, self, [PlaynCoreJsonJsonParser_TokenEnum ARRAY_START]);
      case ']':
      return JreOperatorRetainedAssign(&token_, self, [PlaynCoreJsonJsonParser_TokenEnum ARRAY_END]);
      case ',':
      return JreOperatorRetainedAssign(&token_, self, [PlaynCoreJsonJsonParser_TokenEnum COMMA]);
      case ':':
      return JreOperatorRetainedAssign(&token_, self, [PlaynCoreJsonJsonParser_TokenEnum COLON]);
      case '{':
      map = [[[PlaynCoreJsonJsonObject alloc] init] autorelease];
      if ([self advanceToken] != [PlaynCoreJsonJsonParser_TokenEnum OBJECT_END]) while (YES) {
        if (token_ != [PlaynCoreJsonJsonParser_TokenEnum STRING]) @throw [self createParseExceptionWithJavaLangException:nil withNSString:[NSString stringWithFormat:@"Expected STRING, got %@", token_] withBOOL:YES];
        NSString *key = (NSString *) value_;
        if ([self advanceToken] != [PlaynCoreJsonJsonParser_TokenEnum COLON]) @throw [self createParseExceptionWithJavaLangException:nil withNSString:[NSString stringWithFormat:@"Expected COLON, got %@", token_] withBOOL:YES];
        (void) [self advanceToken];
        [((PlaynCoreJsonJsonObject *) NIL_CHK(map)) putWithNSString:key withId:[self currentValue]];
        if ([self advanceToken] == [PlaynCoreJsonJsonParser_TokenEnum OBJECT_END]) break;
        if (token_ != [PlaynCoreJsonJsonParser_TokenEnum COMMA]) @throw [self createParseExceptionWithJavaLangException:nil withNSString:[NSString stringWithFormat:@"Expected a comma or end of the object instead of %@", token_] withBOOL:YES];
        if ([self advanceToken] == [PlaynCoreJsonJsonParser_TokenEnum OBJECT_END]) @throw [self createParseExceptionWithJavaLangException:nil withNSString:@"Trailing object found in array" withBOOL:YES];
      }
      JreOperatorRetainedAssign(&value_, self, map);
      return JreOperatorRetainedAssign(&token_, self, [PlaynCoreJsonJsonParser_TokenEnum OBJECT_START]);
      case '}':
      return JreOperatorRetainedAssign(&token_, self, [PlaynCoreJsonJsonParser_TokenEnum OBJECT_END]);
      case 't':
      [self consumeKeywordWithUnichar:(unichar) c withJavaLangCharacterArray:PlaynCoreJsonJsonParser_TRUE__];
      JreOperatorRetainedAssign(&value_, self, [JavaLangBoolean getTRUE]);
      return JreOperatorRetainedAssign(&token_, self, [PlaynCoreJsonJsonParser_TokenEnum TRUE_]);
      case 'f':
      [self consumeKeywordWithUnichar:(unichar) c withJavaLangCharacterArray:PlaynCoreJsonJsonParser_FALSE__];
      JreOperatorRetainedAssign(&value_, self, [JavaLangBoolean getFALSE]);
      return JreOperatorRetainedAssign(&token_, self, [PlaynCoreJsonJsonParser_TokenEnum FALSE_]);
      case 'n':
      [self consumeKeywordWithUnichar:(unichar) c withJavaLangCharacterArray:PlaynCoreJsonJsonParser_NULL__];
      JreOperatorRetainedAssign(&value_, self, nil);
      return JreOperatorRetainedAssign(&token_, self, [PlaynCoreJsonJsonParser_TokenEnum NULL_]);
      case '\"':
      JreOperatorRetainedAssign(&value_, self, [self consumeTokenString]);
      return JreOperatorRetainedAssign(&token_, self, [PlaynCoreJsonJsonParser_TokenEnum STRING]);
      case '-':
      case '0':
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
      JreOperatorRetainedAssign(&value_, self, [self consumeTokenNumberWithUnichar:(unichar) c]);
      return JreOperatorRetainedAssign(&token_, self, [PlaynCoreJsonJsonParser_TokenEnum NUMBER]);
      case '+':
      case '.':
      @throw [self createParseExceptionWithJavaLangException:nil withNSString:[NSString stringWithFormat:@"Numbers may not start with '%c'", (unichar) c] withBOOL:YES];
      default:
      ;
    }
  }
  if ([self isAsciiLetterWithInt:c]) @throw [self createHelpfulExceptionWithUnichar:(unichar) c withJavaLangCharacterArray:nil withInt:0];
  @throw [self createParseExceptionWithJavaLangException:nil withNSString:[NSString stringWithFormat:@"Unexpected character: %c", (unichar) c] withBOOL:YES];
}

- (void)consumeKeywordWithUnichar:(unichar)first
       withJavaLangCharacterArray:(IOSCharArray *)expected {
  for (int i = 0; i < (int) [((IOSCharArray *) NIL_CHK(expected)) count]; i++) if ([self advanceChar] != [((IOSCharArray *) NIL_CHK(expected)) charAtIndex:i]) @throw [self createHelpfulExceptionWithUnichar:first withJavaLangCharacterArray:expected withInt:i];
  if ([self isAsciiLetterWithInt:[self peekChar]]) @throw [self createHelpfulExceptionWithUnichar:first withJavaLangCharacterArray:expected withInt:(int) [((IOSCharArray *) NIL_CHK(expected)) count]];
}

- (NSNumber *)consumeTokenNumberWithUnichar:(unichar)c {
  [((JavaLangStringBuilder *) NIL_CHK(reusableBuffer_)) setLengthWithInt:0];
  (void) [((JavaLangStringBuilder *) NIL_CHK(reusableBuffer_)) appendWithUnichar:c];
  BOOL isDouble = NO;
  while ([self isDigitCharacterWithInt:[self peekChar]]) {
    unichar next = (unichar) [self advanceChar];
    isDouble = next == '.' || next == 'e' || next == 'E' || isDouble;
    (void) [((JavaLangStringBuilder *) NIL_CHK(reusableBuffer_)) appendWithUnichar:next];
  }
  NSString *number = [((JavaLangStringBuilder *) NIL_CHK(reusableBuffer_)) description];
  @try {
    if (isDouble) {
      if ([NIL_CHK(number) charAtWithInt:0] == '0') {
        if ([NIL_CHK(number) charAtWithInt:1] == '.') {
          if ([NIL_CHK(number) length] == 2) @throw [self createParseExceptionWithJavaLangException:nil withNSString:[NSString stringWithFormat:@"Malformed number: %@", number] withBOOL:YES];
        }
        else if ([NIL_CHK(number) charAtWithInt:1] != 'e' && [NIL_CHK(number) charAtWithInt:1] != 'E') @throw [self createParseExceptionWithJavaLangException:nil withNSString:[NSString stringWithFormat:@"Malformed number: %@", number] withBOOL:YES];
      }
      if ([NIL_CHK(number) charAtWithInt:0] == '-') {
        if ([NIL_CHK(number) charAtWithInt:1] == '0') {
          if ([NIL_CHK(number) charAtWithInt:2] == '.') {
            if ([NIL_CHK(number) length] == 3) @throw [self createParseExceptionWithJavaLangException:nil withNSString:[NSString stringWithFormat:@"Malformed number: %@", number] withBOOL:YES];
          }
          else if ([NIL_CHK(number) charAtWithInt:2] != 'e' && [NIL_CHK(number) charAtWithInt:2] != 'E') @throw [self createParseExceptionWithJavaLangException:nil withNSString:[NSString stringWithFormat:@"Malformed number: %@", number] withBOOL:YES];
        }
        else if ([NIL_CHK(number) charAtWithInt:1] == '.') {
          @throw [self createParseExceptionWithJavaLangException:nil withNSString:[NSString stringWithFormat:@"Malformed number: %@", number] withBOOL:YES];
        }
      }
      return [JavaLangDouble valueOfWithDouble:[JavaLangDouble parseDoubleWithNSString:number]];
    }
    if ([NIL_CHK(number) charAtWithInt:0] == '0') {
      if ([NIL_CHK(number) length] == 1) return [JavaLangInteger valueOfWithInt:0];
      @throw [self createParseExceptionWithJavaLangException:nil withNSString:[NSString stringWithFormat:@"Malformed number: %@", number] withBOOL:YES];
    }
    if ([NIL_CHK(number) length] > 1 && [NIL_CHK(number) charAtWithInt:0] == '-' && [NIL_CHK(number) charAtWithInt:1] == '0') {
      if ([NIL_CHK(number) length] == 2) return [JavaLangDouble valueOfWithDouble:-0.0];
      @throw [self createParseExceptionWithJavaLangException:nil withNSString:[NSString stringWithFormat:@"Malformed number: %@", number] withBOOL:YES];
    }
    int length = [NIL_CHK(number) charAtWithInt:0] == '-' ? [NIL_CHK(number) length] - 1 : [NIL_CHK(number) length];
    if (length < 10) return [JavaLangInteger valueOfWithInt:[JavaLangInteger parseIntWithNSString:number]];
    if (length < 19) return [JavaLangLong valueOfWithLongInt:[JavaLangLong parseLongWithNSString:number]];
    return [[[JavaMathBigInteger alloc] initWithNSString:number] autorelease];
  }
  @catch (JavaLangNumberFormatException *e) {
    @throw [self createParseExceptionWithJavaLangException:e withNSString:[NSString stringWithFormat:@"Malformed number: %@", number] withBOOL:YES];
  }
}

- (NSString *)consumeTokenString {
  [((JavaLangStringBuilder *) NIL_CHK(reusableBuffer_)) setLengthWithInt:0];
  while (YES) {
    unichar c = [self stringChar];
    {
      int escape;
      switch (c) {
        case '\"':
        return [((JavaLangStringBuilder *) NIL_CHK(reusableBuffer_)) description];
        case '\\':
        escape = [self advanceChar];
        switch (escape) {
          case -1:
          @throw [self createParseExceptionWithJavaLangException:nil withNSString:@"EOF encountered in the middle of a string escape" withBOOL:NO];
          case 'b':
          (void) [((JavaLangStringBuilder *) NIL_CHK(reusableBuffer_)) appendWithUnichar:0x0008];
          break;
          case 'f':
          (void) [((JavaLangStringBuilder *) NIL_CHK(reusableBuffer_)) appendWithUnichar:0x000c];
          break;
          case 'n':
          (void) [((JavaLangStringBuilder *) NIL_CHK(reusableBuffer_)) appendWithUnichar:0x000a];
          break;
          case 'r':
          (void) [((JavaLangStringBuilder *) NIL_CHK(reusableBuffer_)) appendWithUnichar:0x000d];
          break;
          case 't':
          (void) [((JavaLangStringBuilder *) NIL_CHK(reusableBuffer_)) appendWithUnichar:0x0009];
          break;
          case '"':
          case '/':
          case '\\':
          (void) [((JavaLangStringBuilder *) NIL_CHK(reusableBuffer_)) appendWithUnichar:(unichar) escape];
          break;
          case 'u':
          (void) [((JavaLangStringBuilder *) NIL_CHK(reusableBuffer_)) appendWithUnichar:(unichar) ([self stringHexChar] << 12 | [self stringHexChar] << 8 | [self stringHexChar] << 4 | [self stringHexChar])];
          break;
          default:
          @throw [self createParseExceptionWithJavaLangException:nil withNSString:[NSString stringWithFormat:@"Invalid escape: \\%c", (unichar) escape] withBOOL:NO];
        }
        break;
        default:
        (void) [((JavaLangStringBuilder *) NIL_CHK(reusableBuffer_)) appendWithUnichar:c];
      }
    }
  }
}

- (unichar)stringChar {
  int c = [self advanceChar];
  if (c == -1) @throw [self createParseExceptionWithJavaLangException:nil withNSString:@"String was not terminated before end of input" withBOOL:YES];
  if (c < 32) @throw [self createParseExceptionWithJavaLangException:nil withNSString:[NSString stringWithFormat:@"Strings may not contain control characters: 0x%@", [JavaLangInteger toStringWithInt:c withInt:16]] withBOOL:NO];
  return (unichar) c;
}

- (int)stringHexChar {
  int c = [@"0123456789abcdef0123456789ABCDEF" indexOf:[self advanceChar]] % 16;
  if (c == -1) @throw [self createParseExceptionWithJavaLangException:nil withNSString:@"Expected unicode hex escape character" withBOOL:NO];
  return c;
}

- (BOOL)isDigitCharacterWithInt:(int)c {
  return (c >= '0' && c <= '9') || c == 'e' || c == 'E' || c == '.' || c == '+' || c == '-';
}

- (BOOL)isWhitespaceWithInt:(int)c {
  return c == ' ' || c == 0x000a || c == 0x000d || c == 0x0009;
}

- (BOOL)isAsciiLetterWithInt:(int)c {
  return (c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z');
}

- (int)peekChar {
  return eof_ ? -1 : [NIL_CHK(string_) charAtWithInt:index_];
}

- (int)advanceChar {
  if (eof_) return -1;
  int c = [NIL_CHK(string_) charAtWithInt:index_];
  if (c == 0x000a) {
    linePos_++;
    rowPos_ = index_ + 1;
    utf8adjust_ = 0;
  }
  index_++;
  if (index_ >= bufferLength_) eof_ = YES;
  return c;
}

- (PlaynCoreJsonJsonParserException *)createHelpfulExceptionWithUnichar:(unichar)first
                                             withJavaLangCharacterArray:(IOSCharArray *)expected
                                                                withInt:(int)failurePosition {
  JavaLangStringBuilder *errorToken = [[[JavaLangStringBuilder alloc] initWithNSString:[NSString stringWithFormat:@"%c%@", first, (expected == nil ? @"" : [NSString stringWithCharacters:expected offset:0 length:failurePosition])]] autorelease];
  while ([self isAsciiLetterWithInt:[self peekChar]] && [((JavaLangStringBuilder *) NIL_CHK(errorToken)) sequenceLength] < 15) (void) [((JavaLangStringBuilder *) NIL_CHK(errorToken)) appendWithUnichar:(unichar) [self advanceChar]];
  return [self createParseExceptionWithJavaLangException:nil withNSString:[NSString stringWithFormat:@"Unexpected token '%@'%@", errorToken, (expected == nil ? @"" : [NSString stringWithFormat:@". Did you mean '%c%@'?", first, [NSString stringWithCharacters:expected]])] withBOOL:YES];
}

- (PlaynCoreJsonJsonParserException *)createParseExceptionWithJavaLangException:(JavaLangException *)e
                                                                   withNSString:(NSString *)message
                                                                       withBOOL:(BOOL)tokenPos {
  if (tokenPos) return [[[PlaynCoreJsonJsonParserException alloc] initWithJavaLangException:e withNSString:[NSString stringWithFormat:@"%@ on line %d, char %d", message, tokenLinePos_, tokenCharPos_] withInt:tokenLinePos_ withInt:tokenCharPos_ withInt:tokenCharOffset_] autorelease];
  else {
    int charPos = [JavaLangMath maxWithInt:1 withInt:index_ - rowPos_ - utf8adjust_];
    return [[[PlaynCoreJsonJsonParserException alloc] initWithJavaLangException:e withNSString:[NSString stringWithFormat:@"%@ on line %d, char %d", message, linePos_, charPos] withInt:linePos_ withInt:charPos withInt:index_ + charOffset_] autorelease];
  }
}

+ (void)initialize {
  if (self == [PlaynCoreJsonJsonParser class]) {
    JreOperatorRetainedAssign(&PlaynCoreJsonJsonParser_TRUE__, self, [IOSCharArray arrayWithCharacters:(unichar[]){ 'r', 'u', 'e' } count:3]);
    JreOperatorRetainedAssign(&PlaynCoreJsonJsonParser_FALSE__, self, [IOSCharArray arrayWithCharacters:(unichar[]){ 'a', 'l', 's', 'e' } count:4]);
    JreOperatorRetainedAssign(&PlaynCoreJsonJsonParser_NULL__, self, [IOSCharArray arrayWithCharacters:(unichar[]){ 'u', 'l', 'l' } count:3]);
  }
}

- (void)dealloc {
  JreOperatorRetainedAssign(&string_, self, nil);
  JreOperatorRetainedAssign(&reusableBuffer_, self, nil);
  JreOperatorRetainedAssign(&token_, self, nil);
  JreOperatorRetainedAssign(&value_, self, nil);
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  PlaynCoreJsonJsonParser *typedCopy = (PlaynCoreJsonJsonParser *) copy;
  typedCopy.linePos = linePos_;
  typedCopy.rowPos = rowPos_;
  typedCopy.charOffset = charOffset_;
  typedCopy.utf8adjust = utf8adjust_;
  typedCopy.tokenLinePos = tokenLinePos_;
  typedCopy.tokenCharPos = tokenCharPos_;
  typedCopy.tokenCharOffset = tokenCharOffset_;
  typedCopy.value = value_;
  typedCopy.token = token_;
  typedCopy.reusableBuffer = reusableBuffer_;
  typedCopy.eof = eof_;
  typedCopy.index = index_;
  typedCopy.string = string_;
  typedCopy.bufferLength = bufferLength_;
}

@end

static PlaynCoreJsonJsonParser_TokenEnum *PlaynCoreJsonJsonParser_TokenEnum_EOF_;
static PlaynCoreJsonJsonParser_TokenEnum *PlaynCoreJsonJsonParser_TokenEnum_NULL_;
static PlaynCoreJsonJsonParser_TokenEnum *PlaynCoreJsonJsonParser_TokenEnum_TRUE_;
static PlaynCoreJsonJsonParser_TokenEnum *PlaynCoreJsonJsonParser_TokenEnum_FALSE_;
static PlaynCoreJsonJsonParser_TokenEnum *PlaynCoreJsonJsonParser_TokenEnum_STRING;
static PlaynCoreJsonJsonParser_TokenEnum *PlaynCoreJsonJsonParser_TokenEnum_NUMBER;
static PlaynCoreJsonJsonParser_TokenEnum *PlaynCoreJsonJsonParser_TokenEnum_COMMA;
static PlaynCoreJsonJsonParser_TokenEnum *PlaynCoreJsonJsonParser_TokenEnum_COLON;
static PlaynCoreJsonJsonParser_TokenEnum *PlaynCoreJsonJsonParser_TokenEnum_OBJECT_START;
static PlaynCoreJsonJsonParser_TokenEnum *PlaynCoreJsonJsonParser_TokenEnum_OBJECT_END;
static PlaynCoreJsonJsonParser_TokenEnum *PlaynCoreJsonJsonParser_TokenEnum_ARRAY_START;
static PlaynCoreJsonJsonParser_TokenEnum *PlaynCoreJsonJsonParser_TokenEnum_ARRAY_END;
IOSObjectArray *PlaynCoreJsonJsonParser_TokenEnum_values;

@implementation PlaynCoreJsonJsonParser_TokenEnum

+ (PlaynCoreJsonJsonParser_TokenEnum *)EOF_ {
  return PlaynCoreJsonJsonParser_TokenEnum_EOF_;
}
+ (PlaynCoreJsonJsonParser_TokenEnum *)NULL_ {
  return PlaynCoreJsonJsonParser_TokenEnum_NULL_;
}
+ (PlaynCoreJsonJsonParser_TokenEnum *)TRUE_ {
  return PlaynCoreJsonJsonParser_TokenEnum_TRUE_;
}
+ (PlaynCoreJsonJsonParser_TokenEnum *)FALSE_ {
  return PlaynCoreJsonJsonParser_TokenEnum_FALSE_;
}
+ (PlaynCoreJsonJsonParser_TokenEnum *)STRING {
  return PlaynCoreJsonJsonParser_TokenEnum_STRING;
}
+ (PlaynCoreJsonJsonParser_TokenEnum *)NUMBER {
  return PlaynCoreJsonJsonParser_TokenEnum_NUMBER;
}
+ (PlaynCoreJsonJsonParser_TokenEnum *)COMMA {
  return PlaynCoreJsonJsonParser_TokenEnum_COMMA;
}
+ (PlaynCoreJsonJsonParser_TokenEnum *)COLON {
  return PlaynCoreJsonJsonParser_TokenEnum_COLON;
}
+ (PlaynCoreJsonJsonParser_TokenEnum *)OBJECT_START {
  return PlaynCoreJsonJsonParser_TokenEnum_OBJECT_START;
}
+ (PlaynCoreJsonJsonParser_TokenEnum *)OBJECT_END {
  return PlaynCoreJsonJsonParser_TokenEnum_OBJECT_END;
}
+ (PlaynCoreJsonJsonParser_TokenEnum *)ARRAY_START {
  return PlaynCoreJsonJsonParser_TokenEnum_ARRAY_START;
}
+ (PlaynCoreJsonJsonParser_TokenEnum *)ARRAY_END {
  return PlaynCoreJsonJsonParser_TokenEnum_ARRAY_END;
}

- (id)copyWithZone:(NSZone *)zone {
  return [self retain];
}

@synthesize isValue = isValue_;

- (id)initWithBOOL:(BOOL)isValue
      withNSString:(NSString *)name
           withInt:(int)ordinal {
  if ((self = [super initWithNSString:name withInt:ordinal])) {
    self.isValue = isValue;
  }
  return self;
}

+ (void)initialize {
  if (self == [PlaynCoreJsonJsonParser_TokenEnum class]) {
    PlaynCoreJsonJsonParser_TokenEnum_EOF_ = [[PlaynCoreJsonJsonParser_TokenEnum alloc] initWithBOOL:NO withNSString:@"PlaynCoreJsonJsonParser_Token_EOF_" withInt:0];
    PlaynCoreJsonJsonParser_TokenEnum_NULL_ = [[PlaynCoreJsonJsonParser_TokenEnum alloc] initWithBOOL:YES withNSString:@"PlaynCoreJsonJsonParser_Token_NULL_" withInt:1];
    PlaynCoreJsonJsonParser_TokenEnum_TRUE_ = [[PlaynCoreJsonJsonParser_TokenEnum alloc] initWithBOOL:YES withNSString:@"PlaynCoreJsonJsonParser_Token_TRUE_" withInt:2];
    PlaynCoreJsonJsonParser_TokenEnum_FALSE_ = [[PlaynCoreJsonJsonParser_TokenEnum alloc] initWithBOOL:YES withNSString:@"PlaynCoreJsonJsonParser_Token_FALSE_" withInt:3];
    PlaynCoreJsonJsonParser_TokenEnum_STRING = [[PlaynCoreJsonJsonParser_TokenEnum alloc] initWithBOOL:YES withNSString:@"PlaynCoreJsonJsonParser_Token_STRING" withInt:4];
    PlaynCoreJsonJsonParser_TokenEnum_NUMBER = [[PlaynCoreJsonJsonParser_TokenEnum alloc] initWithBOOL:YES withNSString:@"PlaynCoreJsonJsonParser_Token_NUMBER" withInt:5];
    PlaynCoreJsonJsonParser_TokenEnum_COMMA = [[PlaynCoreJsonJsonParser_TokenEnum alloc] initWithBOOL:NO withNSString:@"PlaynCoreJsonJsonParser_Token_COMMA" withInt:6];
    PlaynCoreJsonJsonParser_TokenEnum_COLON = [[PlaynCoreJsonJsonParser_TokenEnum alloc] initWithBOOL:NO withNSString:@"PlaynCoreJsonJsonParser_Token_COLON" withInt:7];
    PlaynCoreJsonJsonParser_TokenEnum_OBJECT_START = [[PlaynCoreJsonJsonParser_TokenEnum alloc] initWithBOOL:YES withNSString:@"PlaynCoreJsonJsonParser_Token_OBJECT_START" withInt:8];
    PlaynCoreJsonJsonParser_TokenEnum_OBJECT_END = [[PlaynCoreJsonJsonParser_TokenEnum alloc] initWithBOOL:NO withNSString:@"PlaynCoreJsonJsonParser_Token_OBJECT_END" withInt:9];
    PlaynCoreJsonJsonParser_TokenEnum_ARRAY_START = [[PlaynCoreJsonJsonParser_TokenEnum alloc] initWithBOOL:YES withNSString:@"PlaynCoreJsonJsonParser_Token_ARRAY_START" withInt:10];
    PlaynCoreJsonJsonParser_TokenEnum_ARRAY_END = [[PlaynCoreJsonJsonParser_TokenEnum alloc] initWithBOOL:NO withNSString:@"PlaynCoreJsonJsonParser_Token_ARRAY_END" withInt:11];
    PlaynCoreJsonJsonParser_TokenEnum_values = [[IOSObjectArray alloc] initWithObjects:(id[]){ PlaynCoreJsonJsonParser_TokenEnum_EOF_, PlaynCoreJsonJsonParser_TokenEnum_NULL_, PlaynCoreJsonJsonParser_TokenEnum_TRUE_, PlaynCoreJsonJsonParser_TokenEnum_FALSE_, PlaynCoreJsonJsonParser_TokenEnum_STRING, PlaynCoreJsonJsonParser_TokenEnum_NUMBER, PlaynCoreJsonJsonParser_TokenEnum_COMMA, PlaynCoreJsonJsonParser_TokenEnum_COLON, PlaynCoreJsonJsonParser_TokenEnum_OBJECT_START, PlaynCoreJsonJsonParser_TokenEnum_OBJECT_END, PlaynCoreJsonJsonParser_TokenEnum_ARRAY_START, PlaynCoreJsonJsonParser_TokenEnum_ARRAY_END, nil } count:12 type:[IOSClass classWithClass:[PlaynCoreJsonJsonParser_TokenEnum class]]];
  }
}

+ (IOSObjectArray *)values {
  return [IOSObjectArray arrayWithArray:PlaynCoreJsonJsonParser_TokenEnum_values];
}

+ (PlaynCoreJsonJsonParser_TokenEnum *)valueOfWithNSString:(NSString *)name {
  for (int i = 0; i < [PlaynCoreJsonJsonParser_TokenEnum_values count]; i++) {
    PlaynCoreJsonJsonParser_TokenEnum *e = [PlaynCoreJsonJsonParser_TokenEnum_values objectAtIndex:i];
    if ([name isEqual:[e name]]) {
      return e;
    }
  }
  @throw [[[JavaLangIllegalArgumentException alloc] initWithNSString:name] autorelease];
  return nil;
}

@end
@implementation PlaynCoreJsonJsonParser_JsonParserContext

- (IOSClass *)clazz {
  return clazz_;
}
- (void)setClazz:(IOSClass *)clazz {
  JreOperatorRetainedAssign(&clazz_, self, clazz);
}
@synthesize clazz = clazz_;

- (id)initWithIOSClass:(IOSClass *)clazz {
  if ((self = [super init])) {
    self.clazz = clazz;
  }
  return self;
}

- (id)fromWithNSString:(NSString *)s {
  return [[[[PlaynCoreJsonJsonParser alloc] initWithNSString:s] autorelease] parseWithIOSClass:clazz_];
}

- (void)dealloc {
  JreOperatorRetainedAssign(&clazz_, self, nil);
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  PlaynCoreJsonJsonParser_JsonParserContext *typedCopy = (PlaynCoreJsonJsonParser_JsonParserContext *) copy;
  typedCopy.clazz = clazz_;
}

@end