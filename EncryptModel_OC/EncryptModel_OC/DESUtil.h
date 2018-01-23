//
//  DESUtil.h
//  EncryptModel_OC
//
//  Created by clf on 2017/12/22.
//  Copyright © 2017年 ppc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DESUtil : NSObject
/**
 DES加密
 */
- (NSString *)desEncrypt:(NSString *)originalStr key:(NSString *)key;

/**
 DES解密
 */
- (NSString *)desDecrypt:(NSString *)encryptStr key:(NSString *)key;

@end
