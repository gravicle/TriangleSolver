//
//  Calculator.m
//  Triangle Solver
//
//  Created by Amit on 12/11/13.
//  Copyright (c) 2013 Cultured Pixel. All rights reserved.
//

#import "TriangleCalculator.h"
#import "Foundation/Foundation.h"
#include "math.h"

@implementation TriangleCalculator : NSObject 

- (NSDictionary *)calcAAA:(NSDictionary *)measures
{
    // Decompressing the dictionary
    double a = [[measures valueForKey:@"angleA"] doubleValue];
    double b = [[measures valueForKey:@"angleB"] doubleValue];
    double c = [[measures valueForKey:@"angleC"] doubleValue];
    double ratioAB = 0.0, ratioBC = 0.0, ratioCA = 0.0;
    NSString *error;
    
    if (a + b + c != 180) {
        error = @"Sum of angles is not 180°";
    }
    else{
        //Calculating ratios
        ratioAB = sin((M_PI / 180)*c);
        ratioBC = sin((M_PI / 180)*a);
        ratioCA = sin((M_PI / 180)*b);
        error = @"";
    }
    
    NSString *sideAB = [NSString stringWithFormat:@"%.1fx",ratioAB];
    NSString *sideBC = [NSString stringWithFormat:@"%.1fx",ratioBC];
    NSString *sideCA = [NSString stringWithFormat:@"%.1fx",ratioCA];
    NSString *angleA = [NSString stringWithFormat:@"%.1f°",a];
    NSString *angleB = [NSString stringWithFormat:@"%.1f°",b];
    NSString *angleC = [NSString stringWithFormat:@"%.1f°",c];
    NSArray *values = [NSArray arrayWithObjects:sideAB, sideBC, sideCA, angleA, angleB, angleC, error, nil];
    NSArray *keys = [NSArray arrayWithObjects:@"sideAB", @"sideBC", @"sideCA", @"angleA", @"angleB", @"angleC", @"error", nil];
    
    NSDictionary *calculatedMeasures = [[NSDictionary alloc] initWithObjects:values forKeys:keys];
    
    return calculatedMeasures;
}
- (NSDictionary *)calcAAS:(NSDictionary *)measures
{
    double ratio = 0.0;
    NSString *error;
    // Decompressing the dictionary
    double a = [[measures valueForKey:@"angleA"] doubleValue];
    double b = [[measures valueForKey:@"angleB"] doubleValue];
    double c = [[measures valueForKey:@"angleC"] doubleValue];
    double ab = [[measures valueForKey:@"sideAB"] doubleValue];
    double bc = [[measures valueForKey:@"sideBC"] doubleValue];
    double ca = [[measures valueForKey:@"sideCA"] doubleValue];
    
    if (a != 0 && b != 0) {
        c = 180 - (a + b);
        if (c < 0) {
            error = @"Sum of angles > 180°";
        }
        else {
            error = @"";
        }
        
        if (bc != 0) {
            ratio = bc/sin((M_PI / 180)*a);
            ab = ratio * sin((M_PI / 180)*c);
            ca = ratio * sin((M_PI / 180)*b);
        }
        else {
            ratio = ca/sin((M_PI / 180)*b);
            ab = ratio * sin((M_PI / 180)*c);
            bc = ratio * sin((M_PI / 180)*a);
        }
    }
    else if (b != 0 && c != 0) {
        a = 180 - (b + c);
        if (a < 0) {
            error = @"Sum of angles > 180°";
        }
        else {
            error = @"";
        }
        
        if (ca != 0) {
            ratio = ca/sin((M_PI / 180)*b);
            ab = ratio * sin((M_PI / 180)*c);
            bc = ratio * sin((M_PI / 180)*a);
        }
        else {
            ratio = ab/sin((M_PI / 180)*c);
            ca = ratio * sin((M_PI / 180)*b);
            bc = ratio * sin((M_PI / 180)*a);
        }
    }
    else {
        b = 180 - (c + a);
        if (b < 0) {
            error = @"Sum of angles > 180°";
        }
        else {
            error = @"";
        }
        
        if (bc != 0) {
            ratio = bc/sin((M_PI / 180)*a);
            ab = ratio * sin((M_PI / 180)*c);
            ca = ratio * sin((M_PI / 180)*b);
        }
        else {
            ratio = ab/sin((M_PI / 180)*c);
            ca = ratio * sin((M_PI / 180)*b);
            bc = ratio * sin((M_PI / 180)*a);
        }
    }
    
    NSString *sideAB = [NSString stringWithFormat:@"%.1f",ab];
    NSString *sideBC = [NSString stringWithFormat:@"%.1f",bc];
    NSString *sideCA = [NSString stringWithFormat:@"%.1f",ca];
    NSString *angleA = [NSString stringWithFormat:@"%.1f°",a];
    NSString *angleB = [NSString stringWithFormat:@"%.1f°",b];
    NSString *angleC = [NSString stringWithFormat:@"%.1f°",c];
    NSArray *values = [NSArray arrayWithObjects:sideAB, sideBC, sideCA, angleA, angleB, angleC, error, nil];
    NSArray *keys = [NSArray arrayWithObjects:@"sideAB", @"sideBC", @"sideCA", @"angleA", @"angleB", @"angleC", @"error", nil];
    
    NSDictionary *calculatedMeasures = [[NSDictionary alloc] initWithObjects:values forKeys:keys];
    
    return calculatedMeasures;
}
- (NSDictionary *)calcASA:(NSDictionary *)measures
{
    double ratio = 0.0;
    NSString *error;
    // Decompressing the dictionary
    double a = [[measures valueForKey:@"angleA"] doubleValue];
    double b = [[measures valueForKey:@"angleB"] doubleValue];
    double c = [[measures valueForKey:@"angleC"] doubleValue];
    double ab = [[measures valueForKey:@"sideAB"] doubleValue];
    double bc = [[measures valueForKey:@"sideBC"] doubleValue];
    double ca = [[measures valueForKey:@"sideCA"] doubleValue];
    
    if (a != 0 && b != 0) {
        c = 180 - (a + b);
        if (c < 0) {
            error = @"Sum of angles > 180°";
        }
        else {
            error = @"";
        }
        
        ratio = ab/sin((M_PI / 180)*c);
        bc = ratio * sin((M_PI / 180)*a);
        ca = ratio * sin((M_PI / 180)*b);
    }
    else if (b != 0 && c != 0) {
        a = 180 - (b + c);
        if (a < 0) {
            error = @"Sum of angles > 180°";
        }
        else {
            error = @"";
        }
        
        ratio = bc/sin((M_PI / 180)*a);
        ab = ratio * sin((M_PI / 180)*c);
        ca = ratio * sin((M_PI / 180)*b);
    }
    else {
        b = 180 - (c + a);
        if (b < 0) {
            error = @"Sum of angles > 180°";
        }
        else {
            error = @"";
        }
        
        ratio = ca/sin((M_PI / 180)*b);
        ab = ratio * sin((M_PI / 180)*c);
        bc = ratio * sin((M_PI / 180)*a);
    }
    
    NSString *sideAB = [NSString stringWithFormat:@"%.1f",ab];
    NSString *sideBC = [NSString stringWithFormat:@"%.1f",bc];
    NSString *sideCA = [NSString stringWithFormat:@"%.1f",ca];
    NSString *angleA = [NSString stringWithFormat:@"%.1f°",a];
    NSString *angleB = [NSString stringWithFormat:@"%.1f°",b];
    NSString *angleC = [NSString stringWithFormat:@"%.1f°",c];
    NSArray *values = [NSArray arrayWithObjects:sideAB, sideBC, sideCA, angleA, angleB, angleC, error, nil];
    NSArray *keys = [NSArray arrayWithObjects:@"sideAB", @"sideBC", @"sideCA", @"angleA", @"angleB", @"angleC", @"error", nil];
    
    NSDictionary *calculatedMeasures = [[NSDictionary alloc] initWithObjects:values forKeys:keys];
    
    return calculatedMeasures;
}
- (NSDictionary *)calcSAS:(NSDictionary *)measures
{
    double ratio = 0.0;
    NSString *error;
    // Decompressing the dictionary
    double a = [[measures valueForKey:@"angleA"] doubleValue];
    double b = [[measures valueForKey:@"angleB"] doubleValue];
    double c = [[measures valueForKey:@"angleC"] doubleValue];
    double ab = [[measures valueForKey:@"sideAB"] doubleValue];
    double bc = [[measures valueForKey:@"sideBC"] doubleValue];
    double ca = [[measures valueForKey:@"sideCA"] doubleValue];
    
    if (a != 0) {
        //law of cosines to find the third side
        bc = sqrt (pow(ab, 2) + pow(ca, 2) - 2*ab*ca*cos((M_PI / 180)*a));
        ratio = bc/sin((M_PI / 180)*a);
        //computing the smaller of the other 2 angles using the law of sines
        if (ab < ca) {
            c = (asin(ab/ratio))*(180 / M_PI);
            b = 180 - (a + c);
        }
        else {
            b = (asin(ca/ratio))*(180 / M_PI);
            c = 180 - (a + b);
        }
    }
    else if (b != 0) {
        //law of cosines to find the third side
        ca = sqrt (pow(ab, 2) + pow(bc, 2) - 2*ab*bc*cos((M_PI / 180)*b));
        ratio = ca/sin((M_PI / 180)*b);
        //computing the smaller of the other 2 angles using the law of sines
        if (ab < bc) {
            c = (asin(ab/ratio))*(180 / M_PI);
            a = 180 - (b + c);
        }
        else {
            a = (asin(bc/ratio))*(180 / M_PI);
            c = 180 - (a + b);
        }
    }
    else {
        //law of cosines to find the third side
        ab = sqrt (pow(bc, 2) + pow(ca, 2) - 2*bc*ca*cos((M_PI / 180)*c));
        ratio = ab/sin((M_PI / 180)*c);
        //computing the smaller of the other 2 angles using the law of sines
        if (bc < ca) {
            a = (asin(bc/ratio))*(180 / M_PI);
            b = 180 - (a + c);
        }
        else {
            b = (asin(ca/ratio))*(180 / M_PI);
            a = 180 - (b + c);
        }
    }
    
    error = @"";
    
    NSString *sideAB = [NSString stringWithFormat:@"%.1f",ab];
    NSString *sideBC = [NSString stringWithFormat:@"%.1f",bc];
    NSString *sideCA = [NSString stringWithFormat:@"%.1f",ca];
    NSString *angleA = [NSString stringWithFormat:@"%.1f°",a];
    NSString *angleB = [NSString stringWithFormat:@"%.1f°",b];
    NSString *angleC = [NSString stringWithFormat:@"%.1f°",c];
    NSArray *values = [NSArray arrayWithObjects:sideAB, sideBC, sideCA, angleA, angleB, angleC, error, nil];
    NSArray *keys = [NSArray arrayWithObjects:@"sideAB", @"sideBC", @"sideCA", @"angleA", @"angleB", @"angleC", @"error", nil];
    
    NSDictionary *calculatedMeasures = [[NSDictionary alloc] initWithObjects:values forKeys:keys];
    
    return calculatedMeasures;
}
- (NSDictionary *)calcSSA:(NSDictionary *)measures
{
    double ratio = 0.0;
    NSString *error;
    // Decompressing the dictionary
    double a = [[measures valueForKey:@"angleA"] doubleValue];
    double b = [[measures valueForKey:@"angleB"] doubleValue];
    double c = [[measures valueForKey:@"angleC"] doubleValue];
    double ab = [[measures valueForKey:@"sideAB"] doubleValue];
    double bc = [[measures valueForKey:@"sideBC"] doubleValue];
    double ca = [[measures valueForKey:@"sideCA"] doubleValue];
    
    if (a >= 180 || b >= 180 || c >= 180) {
        error = @"Given Angle > 180°";
    }
    else {
        if (ab != 0 && bc != 0) {
            if (a != 0) {
                ratio = bc/sin((M_PI / 180)*a);
                c = (asin(ab/ratio))*(180 / M_PI);
                b = 180 - (a + c);
                ca = ratio*sin((M_PI / 180)*b);
            }
            else {
                ratio = ab/sin((M_PI / 180)*c);
                a = (asin(bc/ratio))*(180 / M_PI);
                b = 180 - (a + c);
                ca = ratio*sin((M_PI / 180)*b);
            }
        }
        else if (bc != 0 && ca != 0) {
            if (a != 0) {
                ratio = bc/sin((M_PI / 180)*a);
                b = (asin(ca/ratio))*(180 / M_PI);
                c = 180 - (a + b);
                ab = ratio*sin((M_PI / 180)*c);
            }
            else {
                ratio = ca/sin((M_PI / 180)*b);
                a = (asin(bc/ratio))*(180 / M_PI);
                c = 180 - (a + b);
                ab = ratio*sin((M_PI / 180)*c);
            }
        }
        else {
            if (b != 0) {
                ratio = ca/sin((M_PI / 180)*b);
                c = (asin(ab/ratio))*(180 / M_PI);
                a = 180 - (b + c);
                bc = ratio*sin((M_PI / 180)*a);
            }
            else {
                ratio = ab/sin((M_PI / 180)*c);
                b = (asin(ca/ratio))*(180 / M_PI);
                a = 180 - (b + c);
                bc = ratio*sin((M_PI / 180)*a);
            }
        }
        error = @"";
    }
    
    NSString *sideAB = [NSString stringWithFormat:@"%.1f",ab];
    NSString *sideBC = [NSString stringWithFormat:@"%.1f",bc];
    NSString *sideCA = [NSString stringWithFormat:@"%.1f",ca];
    NSString *angleA = [NSString stringWithFormat:@"%.1f°",a];
    NSString *angleB = [NSString stringWithFormat:@"%.1f°",b];
    NSString *angleC = [NSString stringWithFormat:@"%.1f°",c];
    NSArray *values = [NSArray arrayWithObjects:sideAB, sideBC, sideCA, angleA, angleB, angleC, error, nil];
    NSArray *keys = [NSArray arrayWithObjects:@"sideAB", @"sideBC", @"sideCA", @"angleA", @"angleB", @"angleC", @"error", nil];
    
    NSDictionary *calculatedMeasures = [[NSDictionary alloc] initWithObjects:values forKeys:keys];
    
    return calculatedMeasures;
}
- (NSDictionary *)calcSSS:(NSDictionary *)measures
{
    NSString *error;
    // Decompressing the dictionary
    double a = [[measures valueForKey:@"angleA"] doubleValue];
    double b = [[measures valueForKey:@"angleB"] doubleValue];
    double c = [[measures valueForKey:@"angleC"] doubleValue];
    double ab = [[measures valueForKey:@"sideAB"] doubleValue];
    double bc = [[measures valueForKey:@"sideBC"] doubleValue];
    double ca = [[measures valueForKey:@"sideCA"] doubleValue];
    
    if ((ab >= bc + ca) || (bc >= ab + ca) || (ca >= bc + ab)) {
        error = @"No triangle is possible";
    }
    else {
        //Law of cosines to calc two angles
        a = (acos((pow(ab, 2) + pow(ca, 2) - pow(bc, 2))/(2*ab*ca)))*(180/M_PI);
        b = (acos((pow(ab, 2) + pow(bc, 2) - pow(ca, 2))/(2*ab*bc)))*(180/M_PI);
        
        c = 180 - (a + b);
        error = @"";
    }
    
    NSString *sideAB = [NSString stringWithFormat:@"%.1f",ab];
    NSString *sideBC = [NSString stringWithFormat:@"%.1f",bc];
    NSString *sideCA = [NSString stringWithFormat:@"%.1f",ca];
    NSString *angleA = [NSString stringWithFormat:@"%.1f°",a];
    NSString *angleB = [NSString stringWithFormat:@"%.1f°",b];
    NSString *angleC = [NSString stringWithFormat:@"%.1f°",c];
    NSArray *values = [NSArray arrayWithObjects:sideAB, sideBC, sideCA, angleA, angleB, angleC, error, nil];
    NSArray *keys = [NSArray arrayWithObjects:@"sideAB", @"sideBC", @"sideCA", @"angleA", @"angleB", @"angleC", @"error", nil];
    
    NSDictionary *calculatedMeasures = [[NSDictionary alloc] initWithObjects:values forKeys:keys];
    
    return calculatedMeasures;
}

@end
