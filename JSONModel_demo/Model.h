//
//  Model.h
//  json demo
//
//  Created by liman on 14-6-20.
//  Copyright (c) 2014年 liman. All rights reserved.
//

#import "JSONModel.h"

//{
//    "id":"10",
//    "country":"Germany",
//    "dialCode": 49,
//    "isInEurope":true
//}


@interface Model : JSONModel

@property (assign, nonatomic) int id;
@property (strong, nonatomic) NSString* country;
@property (strong, nonatomic) NSString* dialCode;
@property (assign, nonatomic) BOOL isInEurope;

@end
