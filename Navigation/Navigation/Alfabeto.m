//
//  Alfabeto.m
//  Navigation
//
//  Created by Rafael Souza Belchior da Silva on 16/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "Alfabeto.h"

@implementation Alfabeto
@synthesize titles, numeros, ia;

static Alfabeto *instance = nil;

+(Alfabeto *) instance{
    if (instance == nil) {
        instance = [[Alfabeto alloc] init];
    }
    return instance;
}

-(id) initWithLetras{
    titles = [[NSArray alloc] init];
    titles = [NSArray arrayWithObjects:@"A",@"B", @"C", @"D", @"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"X",@"W",@"Y",@"Z",nil];
    numeros = [[NSArray alloc] init];
    numeros = [NSArray arrayWithObjects:@"1",@"2", @"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24",@"25",@"26",nil];
    ia = 0;
    return self;
}

@end
