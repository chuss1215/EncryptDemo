//
//  Encrypt.m
//  EncryptModel_OC
//
//  Created by clf on 2017/12/21.
//  Copyright © 2017年 ppc. All rights reserved.
//

#import "Encrypt.h"

#import <CommonCrypto/CommonDigest.h>//摘要算法
#import <CommonCrypto/CommonCryptor.h>//常用加解密算法
//#import <CommonCrypto/CommonHMAC.h>
//#import <CommonCrypto/CommonKeyDerivation.h>
//#import <CommonCrypto/CommonSymmetricKeywrap.h>

@implementation Encrypt

#pragma mark - Base64
//给定一个字符串，对该字符串进行Base64编码，然后返回编码后的结果
-(NSString *)base64EncodeString:(NSString *)string
{
    //1.先把字符串转换为二进制数据
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    
    //2.对二进制数据进行base64编码，返回编码后的字符串
    return [data base64EncodedStringWithOptions:0];
}


//对base64编码后的字符串进行解码
-(NSString *)base64DecodeString:(NSString *)string
{
    //1.将base64编码后的字符串『解码』为二进制数据
    NSData *data = [[NSData alloc]initWithBase64EncodedString:string options:0];
    
    //2.把二进制数据转换为字符串返回
    return [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
}


- (void)MD5EncryptWithString:(NSString *)string
{
    //传入参数,转化成char
    const char * str = [string UTF8String];
    
    //开辟一个16字节（128位：md5加密出来就是128位/bit）的空间（一个字节=8字位=8个二进制数）
    unsigned char md[CC_MD5_DIGEST_LENGTH];
    
    /*
     *extern unsigned char * CC_MD5(const void *data, CC_LONG len, unsigned char *md)官方封装好的加密方法
     *      把str字符串转换成了32位的16进制数列（这个过程不可逆转） 存储到了md这个空间中
     *
     */
    CC_MD5(str, (int)strlen(str), md);
    
    //创建一个可变字符串收集结果
    NSMutableString * ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        
        /**
         X 表示以十六进制形式输入/输出
         02 表示不足两位，前面补0输出；出过两位不影响
         printf("%02X", 0x123); //打印出：123
         printf("%02X", 0x1); //打印出：01
         
         */
        [ret appendFormat:@"%02X",md[i]];
    }
    
    NSLog(@"%@",ret);
}


/**
 对称加密：
（1）甲方选择某一种加密规则，对信息进行加密
（2）乙方使用同一种规则，对信息进行解密。
由于加密和解密使用同样规则（简称"密钥"），这被称为"对称加密算法"（Symmetric-key algorithm）。
这种加密模式有一个最大弱点：甲方必须把加密规则告诉乙方，否则无法解密。保存和传递密钥，就成了最头疼的问题。

非对称加密：
（1）乙方生成两把密钥（公钥和私钥）。公钥是公开的，任何人都可以获得，私钥则是保密的。
（2）甲方获取乙方的公钥，然后用它对信息加密。
（3）乙方得到加密后的信息，用私钥解密。
如果公钥加密的信息只有私钥解得开，那么只要私钥不泄漏，通信就是安全的。
*/


@end
