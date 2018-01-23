//
//  ViewController.m
//  EncryptModel_OC
//
//  Created by clf on 2017/12/21.
//  Copyright © 2017年 ppc. All rights reserved.
//

#import "ViewController.h"
#import "DESUtil.h"
#import "3DESUtil.h"
#import "AESUtil.h"
#import "RSAUtil.h"
#import "GTMBase64.h"

#define Encrypt_KEY @"MfsKyoIEMfsKyoIE"

//密匙 key
#define des3key            @"MIIBVAIBADANBgkqhkiG9w0B"
//偏移量
#define des3gIv             @"0"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    NSString *str = @"iVBORw0KGgoAAAANSUhEUgAAAFgAAAAUCAIAAACGbW10AAACsElEQVR42mO4gwNUz/TCJWX7ac4d\nEoH4y9N4ZKvvXMMltfPF2Tt0AQwQas8fV1wq3C8sI8Pc7Yf/3hloIGMRhkuKMUgZe0CkigZjqn7R\nlYImMvmdKUlOCfZwgyOCUjnO+XgQpuGf6/WonyJoB7AGBNYAIjUgIEAz0BkNEXTS/ubt1A+IWp9F\nZCQKZJF9kpfg4nO0V61WjccaNMQEAdaw4AtYjdVhUqmu9EgRNrpCuBIFnvyCDNBCgX+pN65QwBTH\nNK24ese+Pi0418fkLxVSRFWsPwQRKY7scyJDATkggGxL3aPEhAL2jMARQ3IZ8TvBDEgGnu6Di7Rt\nvYcnLCDsGul3yKGAGRBs25UJhsLOhlY4e8Kdd8jJIVVqM1xKy7sdaygk2scim9brxkaM57ubI4lK\nEc2rNAkmiusH2DCTg+uxifgTBZFpAbNoaN7fhRYQl/aakpd5l86aBU1fjzPILyPQIh9XWsBVfdT7\neRCZKZDBeuZnyPmC8oKsbUYmSopI3VtCvOYOsbt4AoLhwVWS6lGSkgNaAYEsaHm9nRjHa66pR+Yq\nFQjjyxr7LxcYsrkTnyJISg64AuLKnUb8yQEzIE4ZLiUp/ufa8ZHZoPou1k4wLIgJCKeYHFKrTDTx\n1a9kyasy6NGyRK4m8CcHrPmCY+0/UjMFwYBAE2E5lIHHnCsRtYiCU+kWIiA8TuRAGLtaNagVEHIX\nO4gvINBCwf9LNaaadM/5xLcpaZUijEq7cQUEFZPolb8/CJf2T+cR38t4LKROp6wBTZZlGcTr1fr5\nnkZN+wsNlKWIIo8MCgOCKuBjt8adgQDBh8xRUoR+fTB1y0hkYFGEZfhARLSOFh7z1/UDtaBDvgDJ\nhJ0ow1+hJceokzWoWzTUb64iqObk6y4II14Fix+mW6D0Iz2tlpLnEgAPS6pxNw51tAAAAABJRU5E\nrkJggg==";
    
    NSData *data = [[NSData alloc]initWithBase64EncodedString:str options:1];
    NSLog(@"data = %@",data);
    UIImageView *im = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:im];
    im.image = [UIImage imageWithData:data];
    
    NSString *phone = @"18299273659";
    
    NSData *phoneData = [phone dataUsingEncoding:NSUTF8StringEncoding];
    
    NSString *basePhone = [GTMBase64 stringByEncodingData:phoneData];
    NSLog(@"basePhone = %@",basePhone);
    
    DESUtil *des = [[DESUtil alloc]init];
    NSString *desEncrypt = [des desEncrypt:@"MfsKyoIEMfsKyoIEMfsKyoIEMfsKyoIEMfsKyoIEMfsKyoIE88888888" key:Encrypt_KEY];//56
    NSString *desDecrypt = [des desDecrypt:desEncrypt key:Encrypt_KEY];
    NSLog(@"desEncrypt=%@ desDecrypt=%@",desEncrypt,desDecrypt);
    
    
    _DESUtil *tdes = [[_DESUtil alloc]init];
    NSString *tdesEn = [tdes doEncryptWithKey:des3key gIv:des3gIv str:phone];
    NSString *tdesDe = [tdes doDecEncryptWithKey:des3key gIv:des3gIv str:tdesEn];
    NSLog(@"tdesEn=%@ tdesDe=%@",tdesEn,tdesDe);
    
    
    
    

    AESUtil *aes = [[AESUtil alloc]init];
    
    NSData *aesEn = [aes AES256EncryptWithData:[[NSData alloc]initWithBase64EncodedString:@"MfsKyoIEMfsKyoIE" options:0] key:Encrypt_KEY];//16
    NSData *aesDe = [aes AES256DecryptWithData:aesEn key:Encrypt_KEY];
    NSLog(@"aesEn=%@,aesDe=%@",[aesEn base64EncodedStringWithOptions:0],[aesDe base64EncodedStringWithOptions:0]);
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
