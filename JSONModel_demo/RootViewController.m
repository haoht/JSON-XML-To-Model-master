//
//  RootViewController.m
//  json demo
//
//  Created by liman on 14-6-20.
//  Copyright (c) 2014年 liman. All rights reserved.
//

#import "RootViewController.h"
#import "JSONModel.h"
#import "JSONManager.h"
#import "SHXMLParser.h"
#import "Model.h"
#import "XMLDictionary.h"

@implementation RootViewController

#pragma mark -life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
  
#warning - NSData ---> JSON字典/JSON字符串
//    NSData *jsonData;
//    // json字符串
//    NSString *jsonStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
//    // json字典
//    NSDictionary *jsonStrDic = [[JSONManager alloc] transformDatatodic:jsonData];
    
    
#warning - JSON字典 ---> Model
//    NSDictionary *json = @{
//                            @"id":@"10",
//                            @"country":@"Germany",
//                            @"dialCode": @49,
//                            @"isInEurope":@YES
//                            };
//    Model *model = [[Model alloc] initWithDictionary:json error:nil];

    
#warning - JSON字符串 ---> Model
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"eg" ofType:@"json"];
//    NSString *json = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
//    Model *model = [[Model alloc] initWithString:json error:nil];


    
// ------------------------------------  以上:JSON,   以下:XML  --------------------------------------
    
    
    
#warning - NSData ---> XML字典 (两个解析器: 第一个会出现空字典bug,即{};  第二个没有空字典bug,空字典会直接移除掉)
//    NSData *xmlData;
//    
//    // 第一个解析器
//    SHXMLParser *parser = [[SHXMLParser alloc] init];
//    NSDictionary *xmlDic = [parser parseData:xmlData];
//    
//    // 第二个解析器
//    XMLDictionaryParser *parser2 = [XMLDictionaryParser sharedInstance];
//    NSDictionary *xmlDic2 = [parser2 dictionaryWithData:xmlData];
    

#warning - XML字典 ---> Model
//    NSDictionary *xmlDic = @{
//                             @"id":@{},
//                            @"country":@"Germany",
//                            @"dialCode": @49,
//                            @"isInEurope":@{},
//                            };
//
//    // 删除字典里值为空的key, 即{}     (只针对使用了解析器SHXMLParser)
//    NSDictionary *xmlDic2 = [self formatWithDict:xmlDic];
//    
//    Model *model = [[Model alloc] initWithDictionary:xmlDic2 error:nil];

}




/**************************************************************************************************/
#pragma mark - tool method
// 删除字典里值为空的key, 即{}    (只针对使用了解析器SHXMLParser)
- (id)formatWithDict:(id)dict
{
    // 1. 参数不是字典, 则直接返回
    if (![dict isKindOfClass:[NSDictionary class]]) {
        
        return dict;
    }
    
    // 2. 参数是字典, 则进一步处理
    NSMutableDictionary *muDict = [NSMutableDictionary dictionaryWithDictionary:dict];
    
    for (NSString *key in [dict allKeys]) {
        
        if ([[dict objectForKey:key] isKindOfClass:[NSDictionary class]]) {
            
            if ([[[dict objectForKey:key] allKeys] count] == 0) {
                
                // 空字典的处理
                [muDict removeObjectForKey:key];
            }
        }
    }
    
    return muDict;
}

@end
