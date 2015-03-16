//
//  Alfabeto.h
//  Navigation
//
//  Created by Rafael Souza Belchior da Silva on 16/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Alfabeto : NSObject

@property NSArray *titles;
@property NSArray *numeros;
@property int ia;

+(Alfabeto *) instance;
-(id) initWithLetras;

@end
