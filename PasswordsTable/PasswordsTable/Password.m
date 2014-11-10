//
//  Password.m
//  PasswordsTable
//
//  Created by Admin on 11/1/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "Password.h"

@implementation Password {
    NSString * _password;
}

-(instancetype)init {
    return [self initWithPassword:@"random" withAccountName:@"Anonymous" withEncryptionCode:@"encryption"];
}

- (instancetype)initWithPassword: (NSString *) pass
             withAccountName: (NSString *) accountName
          withEncryptionCode: (NSString *) encryptionCode {
    self = [super init];
    if (self) {
        _password = pass;
        [self setAccountName:accountName];
        [self setEncryptionCode:encryptionCode];
        [self setEncryptedPassword:[self encryptPassword:pass withCypher:encryptionCode]];
    }
    return  self;
}

+(instancetype)passwordWithPassword: (NSString *) pass
                withAccountName: (NSString *) accountName
             withEncryptionCode: (NSString *) encryptionCode{
    return [[Password alloc] initWithPassword:pass withAccountName:accountName withEncryptionCode:encryptionCode];
}

// DECRYPTION
-(NSString *) decryptPassword:(NSString *) input
                   withCypher:(NSString *) cypher {
    if ([cypher  isEqual: @""]) {
        return @"";
    }
    
    NSMutableString *result = [[NSMutableString alloc] initWithString:input];
    
    long steps = input.length > cypher.length ? input.length : cypher.length;
    
    for (long step = 0; step < steps; step++)
    {
        long index = step % input.length;
        long cypherIndex = step % cypher.length;
        char newChar = (char)((([result characterAtIndex:index] - 'A') ^ ([cypher characterAtIndex:cypherIndex] - 'A')) + 'A');
        [result replaceCharactersInRange:NSMakeRange(index, 1) withString: [[NSString alloc] initWithFormat:@"%c", newChar]];
    }
    
    return result;
}

// ENCRYPTION OF MESSAGE WITH CYPHER
-(NSString *) encryptPassword:(NSString *) input
                   withCypher:(NSString *) cypher {
    NSString *encripted = @"";
    if (input.length > cypher.length) {
        encripted = [self encryptLongerPassword:input withCypher:cypher];
    } else {
        encripted = [self encryptShorterPassword:input withCypher:cypher];
    }
    
    return  encripted;
}

-(NSString *) encryptShorterPassword:(NSString *) input
                          withCypher:(NSString *) cypher {
    NSMutableString *result = [[NSMutableString alloc] initWithString:input];
    int index = 0;
    for (int i = 0; i < cypher.length; i++)
    {
        char take = [result characterAtIndex:index];
        char make = [cypher characterAtIndex:i];
        char encryptedSymbol = [self encryptSymbol:take withSymbol:make];
        [result replaceCharactersInRange:NSMakeRange(index, 1) withString: [[NSString alloc] initWithFormat:@"%c", encryptedSymbol]];
        index++;
        if (index == input.length)
        {
            index = 0;
        }
    }
    
    return result;
}

-(NSString *) encryptLongerPassword:(NSString *) input
                         withCypher:(NSString *) cypher {
    NSMutableString *result = [[NSMutableString alloc] init];
    int cypherIndex = 0;
    for (int i = 0; i < input.length; i++)
    {
        char take = [input characterAtIndex:i];
        char make = [cypher characterAtIndex:cypherIndex];
        char encryptedSymbol = [self encryptSymbol:take withSymbol:make];
        [result appendFormat:@"%c", encryptedSymbol];
        cypherIndex++;
        if (cypherIndex == cypher.length)
        {
            cypherIndex = 0;
        }
    }
    return result;
}

-(char) encryptSymbol:(char) take
           withSymbol:(char) make {
    int get = take - 'A';
    int mad = make - 'A';
    int xor = get ^ mad ;
    return (char)(xor + 'A');
}
@end
