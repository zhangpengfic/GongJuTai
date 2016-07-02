

#import <CommonCrypto/CommonDigest.h>
#import <Foundation/Foundation.h>

@interface NSString (MD5)

- (NSString *)md5Encrypt;
+ (NSString *)md5:(NSString*)input;

@end
