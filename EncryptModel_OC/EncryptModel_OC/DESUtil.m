//
//  DESUtil.m
//  EncryptModel_OC
//
//  Created by clf on 2017/12/22.
//  Copyright © 2017年 ppc. All rights reserved.
//

#import "DESUtil.h"
#import "ConverUtil.h"
#import <CommonCrypto/CommonCryptor.h>//常用加解密算法
@implementation DESUtil


static Byte iv[] = {1,2,3,4,5,6,7,8};
/*
 DES加密
 DES算法简介：
 
 DES算法的入口参数有三个：Key、Data、Mode。其中Key為8个字节共64位，是DES算法的工作密钥；Data也為8个字节64位，是要被加密或被解密的数据；Mode為DES的工作方式，有两种：加密或解密。
 
 DES算法是这样工作的：如Mode為加密，则用Key 去把数据Data进行加密， 生成Data的密码形式（64位）作為DES的输出结果；
                  如Mode為解密，则用Key去把密码形式的数据Data解密，还原為Data的明码形式（64位）作為DES的输出结果。
                  在通信网络的两端，双方约定一致的Key，在通信的源点用Key对核心数据进行DES加密，然后以密码形式在公共通信网（如电话网）中传输到通信网络的终点，数据到达目的地后，用同样的Key对密码数据进行解密，便再现了明码形式的核心数据。这样，便保证了核心数据（如PIN、MAC等）在公共通信网中传输的安全性和可靠性。
通过定期在通信网络的源端和目的端同时改用新的Key，便能更进一步提高数据的保密性，这正是现在金融交易网络的流行做法。
 */
- (NSString *)desEncrypt:(NSString *)originalStr key:(NSString *)key
{
    NSString *ciphertext = nil;
    NSData *textData = [originalStr dataUsingEncoding:NSUTF8StringEncoding];
    NSUInteger dataLength = [originalStr length];
    unsigned char buffer[1024];
    memset(buffer, 0, sizeof(char));
    size_t numBytesEncrypted = 0;
    
    
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmDES,
                                          kCCOptionECBMode,
                                          [key UTF8String], kCCKeySizeDES,
                                          iv,
                                          [textData bytes]  , dataLength,
                                          buffer, 1024,
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        NSLog(@"DES加密成功");
        NSData *data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesEncrypted];
        Byte* bb = (Byte*)[data bytes];
        ciphertext = [ConverUtil parseByteArray2HexString:bb];
    }else{
        NSLog(@"DES加密失败");
    }
    return ciphertext;
}

/**
 DES解密
 */
- (NSString *)desDecrypt:(NSString *)encryptStr key:(NSString *)key;
{
    NSString *cleartext = nil;
    NSData *textData = [ConverUtil parseHexToByteArray:encryptStr];
    NSUInteger dataLength = [textData length];
    unsigned char buffer[1024];
    memset(buffer, 0, sizeof(char));
    size_t numBytesEncrypted = 0;
    
    
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmDES,
                                          kCCOptionECBMode,
                                          [key UTF8String], kCCKeySizeDES,
                                          iv,
                                          [textData bytes]  , dataLength,
                                          buffer, 1024,
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        NSLog(@"DES解密成功");
        
        NSData *data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesEncrypted];
        cleartext = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }else{
        NSLog(@"DES解密失败");
    }
    return cleartext;
}  
@end
