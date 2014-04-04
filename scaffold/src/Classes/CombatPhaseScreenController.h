//
//  CombatPhaseScreenController.h
//  3004iPhone
//
//  Created by Devin Lynch on 2014-04-02.
//
//

#import <Foundation/Foundation.h>
#import "SPSprite.h"

@class FourPlayerGame, CombatPhase, CombatBattle;

@interface CombatPhaseScreenController : SPSprite
{
    FourPlayerGame *_fourPlayerGame;
    CombatPhase *_combatPhase;
}


-(id) initWithFourPlayerGame:(FourPlayerGame*) fourPlayerGame;
-(void) readyForBattleToStart: (CombatBattle*) battle;

@end
