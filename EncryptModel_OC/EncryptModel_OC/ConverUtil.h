//
//  ConverUtil.h
//  EncryptModel_OC
//
//  Created by clf on 2017/12/22.
//  Copyright © 2017年 ppc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConverUtil : NSObject
/**
 64编码
 */
+(NSString *)base64Encoding:(NSData*) text;

/**
 字节转化为16进制数
 */
+(NSString *) parseByte2HexString:(Byte *) bytes;

/**
 字节数组转化16进制数
 */
+(NSString *) parseByteArray2HexString:(Byte[]) bytes;

/*
 将16进制数据转化成NSData 数组
 */
+(NSData*) parseHexToByteArray:(NSString*) hexString;  
@end
