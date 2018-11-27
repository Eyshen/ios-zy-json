//
//  ViewController.m
//  ZYJSON-example
//
//  Created by 张一 on 15-11-2.
//  Copyright (c) 2015年 117go. All rights reserved.
//

#import "ViewController.h"
#import "ZYJSON.h"
#import "UserDTO.h"
#import "ProductDTO.h"
#import "GroupDTO.h"
#import "ZYUser.h"

@interface ViewController ()

@end

@implementation ViewController

static long count = 1;

-(void) testToJson {
    NSMutableString *logString = [[NSMutableString alloc] initWithFormat:@"\n\n\n ---------- 测试 %li条数据 toJson begin ---------- \n",count];
    
    NSTimeInterval begin,end;
    
    NSMutableArray *users = [[NSMutableArray alloc] init];
    for (int i=0; i<count; i++) {
        ZYUser *user = [ZYUser getInstance];
        [users addObject:user];
    }
    begin = CACurrentMediaTime();
    for (ZYUser *user in users) {
        NSLog(@"%@",[ZYJSON toJsonString:user]);
    }
    end = CACurrentMediaTime();
    [logString appendString:@"\n"];
    [logString appendFormat:@" ZYJSON                    %8.2f \n",(end - begin) * 1000];
    
    [logString appendFormat:@"\n ---------- 测试 %li条数据 toJson end ---------- \n\n\n",count];
    NSLog(@"%@",logString);
}

-(void) testFromJson {
    
    NSMutableString *logString = [[NSMutableString alloc] initWithFormat:@"\n\n\n ---------- 测试 %li条数据 FromJson begin ---------- \n",count];
    
    NSTimeInterval begin,end;
    
    NSMutableArray *users = [[NSMutableArray alloc] init];
    for (int i=0; i<count; i++) {
        ZYUser *user = [ZYUser getInstance];
        [users addObject:[ZYJSON toJsonString:user]];
    }
    
    
    begin = CACurrentMediaTime();
    for (NSString *userJson in users) {
        [ZYJSON fromJsonString:userJson type:[ZYUser class]];
    }
    end = CACurrentMediaTime();
    [logString appendFormat:@" ZYJSON                    %8.2f \n",(end - begin) * 1000];
    
    
    [logString appendFormat:@"\n ---------- 测试 %li条数据 FromJson end ---------- \n\n\n",count];
    NSLog(@"%@",logString);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    [self testToJson];
    [self testFromJson];
    
}

@end
