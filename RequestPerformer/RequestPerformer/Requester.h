//
//  Requester.h
//  RequestPerformer
//
//  Created by Admin on 11/4/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Requester : NSObject <NSURLConnectionDelegate>
@property (nonatomic) NSString *url;
@property (nonatomic) NSArray *responceData;

-(instancetype)init;
-(instancetype)initWithUrl:(NSString *) url;
+(instancetype)requesterWithUrl:(NSString *) url;

-(void)getData;

-(void)putData:(NSString *)jsonStringData;

-(void)deleteData:(NSString *)jsonStringData;

-(void)postData:(NSString *)jsonStringData;

-(void)connection:(NSURLRequest *)request
   didReceiveData:(NSData *)data;
@end
