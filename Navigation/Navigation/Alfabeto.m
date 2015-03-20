//
//  Alfabeto.m
//  Navigation
//
//  Created by Rafael Souza Belchior da Silva on 16/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "Alfabeto.h"

@implementation Alfabeto
@synthesize letras, palavras;

static Alfabeto *instance = nil;

+(Alfabeto *) instance{
    if (instance == nil) {
        instance = [[Alfabeto alloc] initWithLetras];
    }
    return instance;
}

-(id) initWithLetras{
    letras = [[NSMutableArray alloc] init];
    letras = [NSMutableArray arrayWithObjects:@"A",@"B", @"C", @"D", @"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"X",@"W",@"Y",@"Z",nil];
    palavras = [[NSMutableArray alloc] init];
    palavras = [NSMutableArray arrayWithObjects:@"Abc",@"Bbc", @"Cbc", @"Dbc", @"Ebc",@"Fbc",@"Gbc",@"Hbc",@"Ibc",@"Jbc",@"Kbc",@"Lbc",@"Mbc",@"Nbc",@"Obc",@"Pbc",@"Qbc",@"Rbc",@"Sbc",@"Tbc",@"Ubc",@"Vbc",@"Xbc",@"Wbc",@"Ybc",@"Zbc",nil];
    return self;
}

@end
