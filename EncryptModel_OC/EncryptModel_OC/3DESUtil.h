//
//  3DESUtil.h
//  EncryptModel_OC
//
//  Created by clf on 2017/12/25.
//  Copyright © 2017年 ppc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface _DESUtil : NSObject
//字符串加密
-(NSString *)doEncryptWithKey:(NSString *)key gIv:(NSString *)giv str:(NSString *)originalStr;
//字符串解密
-(NSString*)doDecEncryptWithKey:(NSString *)key gIv:(NSString *)giv str:(NSString *)encryptStr;
@end
