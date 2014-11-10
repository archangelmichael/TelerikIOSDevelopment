//
//  Password.h
//  PasswordsTable
//
//  Created by Admin on 11/1/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Password : NSObject
@property NSString *encryptedPassword;
@property NSString *accountName;
@property NSString *encryptionCode;

- (instancetype)initWithPassword:(NSString *) pass
                 withAccountName:(NSString *) accountName
              withEncryptionCode:(NSString *) encryptionCode;

+(instancetype)passwordWithPassword:(NSString *) pass
                    withAccountName:(NSString *) accountName
                 withEncryptionCode:(NSString *) encryptionCode;

-(NSString *) decryptPassword:(NSString *) input
                   withCypher:(NSString *) cypher;

-(NSString *) encryptPassword:(NSString *) input
                   withCypher:(NSString *) cypher;

@end
