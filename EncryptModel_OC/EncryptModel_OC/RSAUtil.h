//
//  RSAUtil.h
//  EncryptModel_OC
//
//  Created by clf on 2017/12/22.
//  Copyright © 2017年 ppc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSAUtil : NSObject
#pragma mark - Instance Methods

-(void) loadPublicKeyFromFile: (NSString*) derFilePath;
-(void) loadPublicKeyFromData: (NSData*) derData;

-(void) loadPrivateKeyFromFile: (NSString*) p12FilePath password:(NSString*)p12Password;
-(void) loadPrivateKeyFromData: (NSData*) p12Data password:(NSString*)p12Password;




-(NSString*) rsaEncryptString:(NSString*)string;
-(NSData*) rsaEncryptData:(NSData*)data ;

-(NSString*) rsaDecryptString:(NSString*)string;
-(NSData*) rsaDecryptData:(NSData*)data;





#pragma mark - Class Methods

+(void) setSharedInstance: (RSAUtil*)instance;
+(RSAUtil*) sharedInstance;

@end
