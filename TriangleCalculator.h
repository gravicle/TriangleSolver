//
//  Calculator.h
//  Triangle Solver
//
//  Created by Amit on 12/11/13.
//  Copyright (c) 2013 Cultured Pixel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TriangleCalculator : NSObject

- (NSDictionary *)calcAAA:(NSDictionary *)mesaures;
- (NSDictionary *)calcAAS:(NSDictionary *)mesaures;
- (NSDictionary *)calcASA:(NSDictionary *)mesaures;
- (NSDictionary *)calcSAS:(NSDictionary *)mesaures;
- (NSDictionary *)calcSSA:(NSDictionary *)mesaures;
- (NSDictionary *)calcSSS:(NSDictionary *)mesaures;
//
@end
