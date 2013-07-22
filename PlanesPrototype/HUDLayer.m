//
//  HUDLayer.m
//  PlanesPrototype
//
//  Created by Roman Smirnov on 27.01.13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "HUDLayer.h"
#import "Constants.h"
#import "cocos2d.h"

@implementation HUDLayer

- (id)init
{
    if (self = [super init])
    {
//        CGSize winSize = [[CCDirector sharedDirector] winSize];
//        self.resIndicator1 = [[[MapVertex alloc] initWithPosition:ccp(winSize.width * 0.07, winSize.height * 0.95) SpriteName:@"flowerBase.png" Value:0] autorelease];
//        self.resIndicator1.scale = 0.5;
//        self.resIndicator2 = [[[MapVertex alloc] initWithPosition:ccp(winSize.width * 0.14, winSize.height * 0.95) SpriteName:@"flowerBase.png" Value:0] autorelease];
//        self.resIndicator2.scale = 0.5;
//        self.resIndicator3 = [[[MapVertex alloc] initWithPosition:ccp(winSize.width * 0.21, winSize.height * 0.95) SpriteName:@"flowerBase.png" Value:0] autorelease];
//        self.resIndicator3.scale = 0.5;
//        self.resIndicator4 = [[[MapVertex alloc] initWithPosition:ccp(winSize.width * 0.28, winSize.height * 0.95) SpriteName:@"flowerBase.png" Value:0] autorelease];
//        self.resIndicator4.scale = 0.5;
//        self.resIndicator5 = [[[MapVertex alloc] initWithPosition:ccp(winSize.width * 0.35, winSize.height * 0.95) SpriteName:@"flowerBase.png" Value:0] autorelease];
//        self.resIndicator5.scale = 0.5;
//        
//        [self addChild:self.resIndicator1];
//        [self addChild:self.resIndicator2];
//        [self addChild:self.resIndicator3];
//        [self addChild:self.resIndicator4];
//        [self addChild:self.resIndicator5];
        
        [self updateResources];
        
    }
    
    return self;
}

- (void)updateResources
{
//    [self.resIndicator1.label setString:[NSString stringWithFormat:@"%d", [self.delegate getNumberOfResource:RESOURCE_TYPE_1]]];
//    [self.resIndicator2.label setString:[NSString stringWithFormat:@"%d", [self.delegate getNumberOfResource:RESOURCE_TYPE_2]]];
//    [self.resIndicator3.label setString:[NSString stringWithFormat:@"%d", [self.delegate getNumberOfResource:RESOURCE_TYPE_3]]];
//    [self.resIndicator4.label setString:[NSString stringWithFormat:@"%d", [self.delegate getNumberOfResource:RESOURCE_TYPE_4]]];
//    [self.resIndicator5.label setString:[NSString stringWithFormat:@"%d", [self.delegate getNumberOfResource:RESOURCE_TYPE_5]]];
    
    [self removeAllChildrenWithCleanup:YES];
    
    int resType1 = [self.delegate getNumberOfResource:RESOURCE_TYPE_1];
    int resType2 = [self.delegate getNumberOfResource:RESOURCE_TYPE_2];
    int resType3 = [self.delegate getNumberOfResource:RESOURCE_TYPE_3];
    int resType4 = [self.delegate getNumberOfResource:RESOURCE_TYPE_4];
    int resType5 = [self.delegate getNumberOfResource:RESOURCE_TYPE_5];
    
    int totalResources = resType1 + resType2 + resType3 + resType4 + resType5;
    
    for (int i = 0; i < totalResources; i++) {
        CCSprite *cell = [CCSprite spriteWithFile:@"energySegmentFrameBase.png"];
        cell.color = UI_COLOR_GREY;
        cell.position = ccp( WIN_SIZE.width * ( 0.07 + i * 0.03 ), WIN_SIZE.height * ( 0.95 - ( i % 2) * 0.02 ) );
        [self addChild:cell];
        
        ccColor3B energyColor;
        if (i < resType1) energyColor = flowerColors[0];
        else if (i < resType1 + resType2) energyColor = flowerColors[1];
        else if (i < resType1 + resType2 + resType3) energyColor = flowerColors[2];
        else if (i < resType1 + resType2 + resType3 + resType4) energyColor = flowerColors[3];
        else energyColor = flowerColors[4];
        
        CCSprite *energyBar = [CCSprite spriteWithFile:@"energySegmentCellBase.png"];
        energyBar.color = energyColor;
        energyBar.position = ccp( cell.contentSize.width/2., cell.contentSize.height/2. );
        energyBar.opacity = DEFAULT_OPACITY;
        [cell addChild:energyBar];
    }

}

@end


