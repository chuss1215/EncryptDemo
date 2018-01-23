//
//  Encrypt.h
//  EncryptModel_OC
//
//  Created by clf on 2017/12/21.
//  Copyright © 2017年 ppc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Encrypt : NSObject
-(NSString *)base64EncodeString:(NSString *)string;
-(NSString *)base64DecodeString:(NSString *)string;
- (void)MD5EncryptWithString:(NSString *)string;
@end
