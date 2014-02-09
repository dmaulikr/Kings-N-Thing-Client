//
//  GameState.h
//  3004iPhone
//
//  Created by Devin Lynch on 2014-01-26.
//
//

#import <Foundation/Foundation.h>
#import "JSONSerializable.h"


@class Game, PlayingCup, Bank, ScaledGamePiece, HexLocation;

@interface GameState : NSObject<JSONSerializable>{
    NSMutableArray *_players;
    NSString *_myPlayerId;
    PlayingCup *_playingCup;
    NSMutableDictionary *_hexLocations;
    Bank *_bank;
    Game *_game;
}

@property NSString *myPlayerId;
@property NSMutableArray *players;
@property Game *game;
@property Bank *bank;
@property PlayingCup *playingCup;
@property NSMutableDictionary *hexLocations;


-(void) findPathFromLocation: (HexLocation *) location withMoves: (int) moves;

@end
