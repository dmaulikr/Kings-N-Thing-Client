//
//  NonCityVill.h
//  3004iPhone
//
//  Created by John Marsh on 1/15/2014.
//
//

#import "SpecialIncomeCounters.h"
#import "Terrain.h"

@interface NonCityVill : SpecialIncomeCounters{
    Terrain *_terrain;
}

@property Terrain *terrain;

@end