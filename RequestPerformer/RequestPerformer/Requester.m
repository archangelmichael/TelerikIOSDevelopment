//
//  Requester.m
//  RequestPerformer
//
//  Created by Admin on 11/4/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "Requester.h"

@implementation Requester

-(instancetype)init {
    return [self initWithUrl:@"http://localhost:3000"];
}

-(instancetype)initWithUrl:(NSString *) url {
    self = [super init];
    if (self) {
        self.url = url;
    }
    return  self;
}

+(instancetype)requesterWithUrl:(NSString *) url {
    return [[Requester alloc] initWithUrl:url];
}

-(void)getData {
    [self sendRequest:@"GET" sentDataType:@"application/json" sentDataHeader:@"Content-type" receivedDatatype:@"application/json" receivedDataHeader:@"Accept" sentDataBody:nil];
}

-(void)putData:(NSString *)jsonStringData {
    [self sendRequest:@"PUT" sentDataType:@"application/json" sentDataHeader:@"Content-type" receivedDatatype:@"application/json" receivedDataHeader:@"Accept" sentDataBody:jsonStringData];
}

-(void)deleteData:(NSString *)jsonStringData {
    [self sendRequest:@"DELETE" sentDataType:@"application/json" sentDataHeader:@"Content-type" receivedDatatype:@"application/json" receivedDataHeader:@"Accept" sentDataBody:jsonStringData];
}

-(void)postData:(NSString *)jsonStringData {
    [self sendRequest:@"POST" sentDataType:@"application/json" sentDataHeader:@"Content-type" receivedDatatype:@"application/json" receivedDataHeader:@"Accept" sentDataBody:jsonStringData];
}

-(void)sendRequest:(NSString *)method
      sentDataType:(NSString *)sentType
    sentDataHeader:(NSString *)sentHeader
  receivedDatatype:(NSString *)receivedType
receivedDataHeader:(NSString *)receivedHeader
      sentDataBody:(NSString *)jsonStringData {
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:self.url]];
    [request setHTTPMethod:method];
    [request setValue:sentType forHTTPHeaderField:sentHeader];
    [request setValue:receivedType forHTTPHeaderField:receivedHeader];
    
    if (jsonStringData != nil && ![jsonStringData isEqualToString:@""]) {
        NSData *sendData = [jsonStringData dataUsingEncoding:NSUTF8StringEncoding];
        [request setHTTPBody:sendData];
    }
    
    [NSURLConnection connectionWithRequest:request delegate:self];
}

-(void)connection:(NSURLRequest *)request
   didReceiveData:(NSData *)data {
    NSDictionary * json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    NSArray *responce = [json objectForKey:@"result"] ;
    self.responceData = responce;
    // NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}
@end
