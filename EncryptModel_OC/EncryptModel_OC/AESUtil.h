//
//  AESUtil.h
//  EncryptModel_OC
//
//  Created by clf on 2017/12/22.
//  Copyright © 2017年 ppc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AESUtil : NSObject
- (NSData *)AES256EncryptWithData:(NSData *)data key:(NSString *)key;
- (NSData *)AES256DecryptWithData:(NSData *)data key:(NSString *)key;
- (NSData *)AES128EncryptWithData:(NSData *)data key:(NSString *)key iv:(NSString *)iv;
- (NSData *)AES128DecryptWithNSData:(NSData *)data key:(NSString *)key iv:(NSString *)iv;
@end
