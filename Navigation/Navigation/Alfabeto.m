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
    palavras = [NSMutableArray arrayWithObjects:@"Abacaxi",@"Brasil", @"Cachorro", @"Dado", @"Escada",@"Foca",@"Gato",@"Helicóptero",@"iPhone",@"Jacaré",@"Kindle",@"Luva",@"Macaco",@"Navio",@"Ovelha",@"Palmeiras",@"Quarto",@"Rato",@"Spiderman",@"Tangerina",@"Uva",@"Verde",@"X-Box",@"Water",@"Yogurt",@"Zebra",nil];
    return self;
}

@end
