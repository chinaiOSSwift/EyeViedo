//
//  BaseRequest.m
//  EveryVideoDay
//
//  Created by MS on 16/10/11.
//  Copyright © 2016年 一杯清火茶. All rights reserved.
//

#import "BaseRequest.h"

@implementation BaseRequest

+(void)getWithURL:(NSString *)url para:(NSDictionary *)para calBack:(void (^)(NSData *, NSError *))callBack{
    //拼接url的ip地址，资源路径，资源参数
    NSMutableString *urlStr = [[NSMutableString alloc]initWithString:url];
    [urlStr appendFormat:@"%@",[self paraToString:para]];
    NSURL *URL = [NSURL URLWithString:urlStr];
//    NSLog(@"网络请求网址:%@",urlStr);
    //创建请求对象
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
    request.HTTPMethod = @"GET";
    request.timeoutInterval = 6;
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *  data, NSURLResponse *  response, NSError *  error) {
        //请求响应的回调block
        callBack(data,error);
//        NSLog(@"%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
    }];
    //启动网络
    [task resume];
}

+(void)postWithURL:(NSString *)url para:(NSDictionary *)para callBack:(void (^)(NSData *, NSError *))callBack{
    NSMutableString *urlStr = [[NSMutableString alloc]initWithString:url];
    [urlStr appendFormat:@"%@",[self paraToString:para]];
    NSURL *URL = [NSURL URLWithString:urlStr];
    //创建请求对象
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
    request.HTTPMethod = @"POST";
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *  data, NSURLResponse *  response, NSError *  error) {
        //请求响应的回调block
        callBack(data,error);
//        NSLog(@"%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
    }];
    //启动网络
    [task resume];
}

//将para字典拼接为资源参数部分
+(NSString *)paraToString:(NSDictionary *)para{
    
    if(para == nil){
        return  @"";
    }
    NSMutableString *str = [NSMutableString stringWithString:@"?"];
    //遍历字典拼接键值对
    for(NSString *key in para.allKeys){
        [str appendFormat:@"%@=%@&",key,para[key]];
    }
    if ([str hasSuffix:@"&"]) {
        //删除多余的&
        [str deleteCharactersInRange:NSMakeRange(str.length - 1,1)];
    }
    //如果资源参数中含有中文，或者{}# @等特殊字符时，进行Unicode编码
    NSString * paraStr = [str stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];
    return paraStr;

}


@end
