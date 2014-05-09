//
//  RITViewController.m
//  BezierPath
//
//  Created by Pronin Alexander on 07.05.14.
//  Copyright (c) 2014 Pronin Alexander. All rights reserved.
//

#import "RITViewController.h"

@interface RITViewController ()

@end

@implementation RITViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    //NSLog(@"Frame: %@", NSStringFromCGRect(self.view.frame));
    
    CGRect rect = CGRectMake(0, 20, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) - 288);
    
    self.canvas = [[RITBezierPathView alloc] initWithFrame:rect andPaths:[self arrayWithPaths]];
    
    self.canvas.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.canvas];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Methods

- (NSArray*) arrayWithPaths {
    
    CGFloat lineWidth = 2;
    CGFloat leftIndent = 20;
    CGFloat topIndent = 20;
    
    //triangle
    UIBezierPath *path01 = [UIBezierPath bezierPath];
    [path01 moveToPoint: CGPointMake(leftIndent + 571, 244)];
    [path01 addLineToPoint: CGPointMake(leftIndent + 0, 244)];
    [path01 addLineToPoint: CGPointMake(leftIndent + 571, 0)];
    [path01 addLineToPoint: CGPointMake(leftIndent + 571, 244)];
    path01.lineWidth = lineWidth;
    [path01 closePath];
    
    //circle
    UIBezierPath *path02 = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(leftIndent + 0, topIndent + 250, 200, 200)];
    path02.lineWidth = lineWidth;
    
    //square
    UIBezierPath* path03 = [UIBezierPath bezierPathWithRect: CGRectMake(leftIndent + 0, topIndent*2 + 450, 200, 200)];
    path03.lineWidth = lineWidth;
    
    return  @[path01, path02, path03];
}

#pragma mark - Touches

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.canvas];
    UIBezierPath *path = [self.canvas touchInsidePath:point];
    if (path) {
        
        NSArray *paths = self.canvas.pathsArray;
        NSInteger touchedPathIndex = [paths indexOfObject:path];
        
        if (touchedPathIndex != self.canvas.selectedPathIndex) {
            
            self.canvas.selectedPathIndex = touchedPathIndex;
            [self.canvas setNeedsDisplay];
        }
        
    }
    NSLog(@"Bezire path: %@", path);
}

#pragma mark - Actions

- (IBAction)actionButton:(UIButton *)sender {
    
    self.canvas.selectedPathIndex = sender.tag;
    [self.canvas setNeedsDisplay];
}

- (IBAction)actionTransform:(UIButton *)sender {
    
    CGAffineTransform translation = CGAffineTransformMakeTranslation(50, 50);
    [self.canvas.path applyTransform:translation];
    [self.canvas setNeedsDisplay];
}

- (IBAction)actionScale:(UIButton *)sender {
    
    CGAffineTransform translation = CGAffineTransformMakeScale(0.5f, 0.5f);
    [self.canvas.path applyTransform:translation];
    [self.canvas setNeedsDisplay];
}
@end

/*
 //Flower
 
 UIColor* strokeColor = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
 UIBezierPath* path = [UIBezierPath bezierPath];
 [path moveToPoint: CGPointMake(165,196)];
 [path addCurveToPoint: CGPointMake(261,247) controlPoint1: CGPointMake(165,224) controlPoint2: CGPointMake(208,247)];
 [path addCurveToPoint: CGPointMake(356,196) controlPoint1: CGPointMake(313,247) controlPoint2: CGPointMake(356,224)];
 [path addCurveToPoint: CGPointMake(261,144) controlPoint1: CGPointMake(356,167) controlPoint2: CGPointMake(313,144)];
 [path addCurveToPoint: CGPointMake(165,196) controlPoint1: CGPointMake(208,144) controlPoint2: CGPointMake(165,167)];
 [strokeColor setStroke];
 path.lineWidth = 5;
 [path stroke];
 
 UIColor* strokeColor1 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
 UIBezierPath* path1 = [UIBezierPath bezierPath];
 [path1 moveToPoint: CGPointMake(194,157)];
 [path1 addCurveToPoint: CGPointMake(170,142) controlPoint1: CGPointMake(187,158) controlPoint2: CGPointMake(175,146)];
 [path1 addCurveToPoint: CGPointMake(132,99) controlPoint1: CGPointMake(156,132) controlPoint2: CGPointMake(134,118)];
 [path1 addCurveToPoint: CGPointMake(177,47) controlPoint1: CGPointMake(131,76) controlPoint2: CGPointMake(158,57)];
 [path1 addCurveToPoint: CGPointMake(320,21) controlPoint1: CGPointMake(220,22) controlPoint2: CGPointMake(270,15)];
 [path1 addCurveToPoint: CGPointMake(407,69) controlPoint1: CGPointMake(347,24) controlPoint2: CGPointMake(399,40)];
 [path1 addCurveToPoint: CGPointMake(367,125) controlPoint1: CGPointMake(412,91) controlPoint2: CGPointMake(381,112)];
 [path1 addCurveToPoint: CGPointMake(341,148) controlPoint1: CGPointMake(358,132) controlPoint2: CGPointMake(350,141)];
 [path1 addCurveToPoint: CGPointMake(325,158) controlPoint1: CGPointMake(336,152) controlPoint2: CGPointMake(328,155)];
 [strokeColor1 setStroke];
 path1.lineWidth = 1;
 [path1 stroke];
 
 UIColor* strokeColor2 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
 UIBezierPath* path2 = [UIBezierPath bezierPath];
 [path2 moveToPoint: CGPointMake(260,144)];
 [path2 addCurveToPoint: CGPointMake(264,106) controlPoint1: CGPointMake(256,135) controlPoint2: CGPointMake(256,114)];
 [strokeColor2 setStroke];
 path2.lineWidth = 1;
 [path2 stroke];
 
 UIColor* strokeColor3 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
 UIBezierPath* path3 = [UIBezierPath bezierPath];
 [path3 moveToPoint: CGPointMake(130,93)];
 [path3 addCurveToPoint: CGPointMake(51,145) controlPoint1: CGPointMake(117,75) controlPoint2: CGPointMake(58,137)];
 [path3 addCurveToPoint: CGPointMake(29,270) controlPoint1: CGPointMake(26,176) controlPoint2: CGPointMake(-1,235)];
 [path3 addCurveToPoint: CGPointMake(81,296) controlPoint1: CGPointMake(39,281) controlPoint2: CGPointMake(68,305)];
 [path3 addCurveToPoint: CGPointMake(106,266) controlPoint1: CGPointMake(92,290) controlPoint2: CGPointMake(99,274)];
 [path3 addCurveToPoint: CGPointMake(141,236) controlPoint1: CGPointMake(117,255) controlPoint2: CGPointMake(128,244)];
 [path3 addCurveToPoint: CGPointMake(174,222) controlPoint1: CGPointMake(147,232) controlPoint2: CGPointMake(170,219)];
 [strokeColor3 setStroke];
 path3.lineWidth = 1;
 [path3 stroke];
 
 UIColor* strokeColor4 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
 UIBezierPath* path4 = [UIBezierPath bezierPath];
 [path4 moveToPoint: CGPointMake(100,188)];
 [path4 addCurveToPoint: CGPointMake(164,185) controlPoint1: CGPointMake(110,181) controlPoint2: CGPointMake(154,173)];
 [strokeColor4 setStroke];
 path4.lineWidth = 1;
 [path4 stroke];
 
 UIColor* strokeColor5 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
 UIBezierPath* path5 = [UIBezierPath bezierPath];
 [path5 moveToPoint: CGPointMake(400,91)];
 [path5 addCurveToPoint: CGPointMake(459,110) controlPoint1: CGPointMake(419,80) controlPoint2: CGPointMake(444,99)];
 [path5 addCurveToPoint: CGPointMake(510,195) controlPoint1: CGPointMake(486,130) controlPoint2: CGPointMake(505,163)];
 [path5 addCurveToPoint: CGPointMake(460,292) controlPoint1: CGPointMake(513,213) controlPoint2: CGPointMake(502,319)];
 [path5 addCurveToPoint: CGPointMake(445,274) controlPoint1: CGPointMake(454,287) controlPoint2: CGPointMake(451,279)];
 [path5 addCurveToPoint: CGPointMake(426,261) controlPoint1: CGPointMake(440,269) controlPoint2: CGPointMake(432,265)];
 [path5 addCurveToPoint: CGPointMake(386,239) controlPoint1: CGPointMake(413,253) controlPoint2: CGPointMake(399,246)];
 [path5 addCurveToPoint: CGPointMake(338,224) controlPoint1: CGPointMake(372,233) controlPoint2: CGPointMake(353,226)];
 [strokeColor5 setStroke];
 path5.lineWidth = 1;
 [path5 stroke];
 
 UIColor* strokeColor6 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
 UIBezierPath* path6 = [UIBezierPath bezierPath];
 [path6 moveToPoint: CGPointMake(354,187)];
 [path6 addCurveToPoint: CGPointMake(391,178) controlPoint1: CGPointMake(363,178) controlPoint2: CGPointMake(379,176)];
 [strokeColor6 setStroke];
 path6.lineWidth = 1;
 [path6 stroke];
 
 UIColor* strokeColor7 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
 UIBezierPath* path7 = [UIBezierPath bezierPath];
 [path7 moveToPoint: CGPointMake(77,297)];
 [path7 addCurveToPoint: CGPointMake(92,373) controlPoint1: CGPointMake(63,325) controlPoint2: CGPointMake(72,349)];
 [path7 addCurveToPoint: CGPointMake(233,417) controlPoint1: CGPointMake(125,411) controlPoint2: CGPointMake(185,418)];
 [path7 addCurveToPoint: CGPointMake(268,388) controlPoint1: CGPointMake(255,416) controlPoint2: CGPointMake(266,410)];
 [path7 addCurveToPoint: CGPointMake(262,277) controlPoint1: CGPointMake(271,351) controlPoint2: CGPointMake(263,313)];
 [path7 addCurveToPoint: CGPointMake(262,248) controlPoint1: CGPointMake(262,269) controlPoint2: CGPointMake(264,255)];
 [strokeColor7 setStroke];
 path7.lineWidth = 1;
 [path7 stroke];
 
 UIColor* strokeColor8 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
 UIBezierPath* path8 = [UIBezierPath bezierPath];
 [path8 moveToPoint: CGPointMake(208,241)];
 [path8 addCurveToPoint: CGPointMake(183,287) controlPoint1: CGPointMake(199,257) controlPoint2: CGPointMake(184,265)];
 [strokeColor8 setStroke];
 path8.lineWidth = 1;
 [path8 stroke];
 
 UIColor* strokeColor9 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
 UIBezierPath* path9 = [UIBezierPath bezierPath];
 [path9 moveToPoint: CGPointMake(268,382)];
 [path9 addCurveToPoint: CGPointMake(309,419) controlPoint1: CGPointMake(264,404) controlPoint2: CGPointMake(291,417)];
 [path9 addCurveToPoint: CGPointMake(412,379) controlPoint1: CGPointMake(341,423) controlPoint2: CGPointMake(386,397)];
 [path9 addCurveToPoint: CGPointMake(461,291) controlPoint1: CGPointMake(433,365) controlPoint2: CGPointMake(484,321)];
 [strokeColor9 setStroke];
 path9.lineWidth = 1;
 [path9 stroke];
 
 UIColor* strokeColor10 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
 UIBezierPath* path10 = [UIBezierPath bezierPath];
 [path10 moveToPoint: CGPointMake(298,243)];
 [path10 addCurveToPoint: CGPointMake(345,301) controlPoint1: CGPointMake(325,248) controlPoint2: CGPointMake(341,279)];
 [strokeColor10 setStroke];
 path10.lineWidth = 1;
 [path10 stroke];
 
 UIColor* strokeColor11 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
 UIBezierPath* path11 = [UIBezierPath bezierPath];
 [path11 moveToPoint: CGPointMake(294,520)];
 [path11 addCurveToPoint: CGPointMake(317,478) controlPoint1: CGPointMake(289,507) controlPoint2: CGPointMake(306,486)];
 [path11 addCurveToPoint: CGPointMake(401,453) controlPoint1: CGPointMake(341,460) controlPoint2: CGPointMake(371,458)];
 [path11 addCurveToPoint: CGPointMake(504,387) controlPoint1: CGPointMake(443,445) controlPoint2: CGPointMake(481,424)];
 [path11 addCurveToPoint: CGPointMake(518,474) controlPoint1: CGPointMake(498,416) controlPoint2: CGPointMake(519,446)];
 [path11 addCurveToPoint: CGPointMake(457,570) controlPoint1: CGPointMake(516,513) controlPoint2: CGPointMake(490,552)];
 [path11 addCurveToPoint: CGPointMake(314,587) controlPoint1: CGPointMake(418,592) controlPoint2: CGPointMake(357,604)];
 [path11 addCurveToPoint: CGPointMake(280,538) controlPoint1: CGPointMake(295,579) controlPoint2: CGPointMake(274,562)];
 [path11 addCurveToPoint: CGPointMake(312,517) controlPoint1: CGPointMake(284,521) controlPoint2: CGPointMake(297,520)];
 [path11 addCurveToPoint: CGPointMake(388,525) controlPoint1: CGPointMake(327,513) controlPoint2: CGPointMake(381,511)];
 [strokeColor11 setStroke];
 path11.lineWidth = 1;
 [path11 stroke];
 
 UIColor* strokeColor12 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
 UIBezierPath* path12 = [UIBezierPath bezierPath];
 [path12 moveToPoint: CGPointMake(236,417)];
 [path12 addCurveToPoint: CGPointMake(242,639) controlPoint1: CGPointMake(271,488) controlPoint2: CGPointMake(296,572)];
 [path12 addCurveToPoint: CGPointMake(268,645) controlPoint1: CGPointMake(249,641) controlPoint2: CGPointMake(262,646)];
 [path12 addCurveToPoint: CGPointMake(286,622) controlPoint1: CGPointMake(281,643) controlPoint2: CGPointMake(282,633)];
 [path12 addCurveToPoint: CGPointMake(298,579) controlPoint1: CGPointMake(291,609) controlPoint2: CGPointMake(302,593)];
 [strokeColor12 setStroke];
 path12.lineWidth = 1;
 [path12 stroke];
 
 UIColor* strokeColor13 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
 UIBezierPath* path13 = [UIBezierPath bezierPath];
 [path13 moveToPoint: CGPointMake(294,416)];
 [path13 addCurveToPoint: CGPointMake(301,491) controlPoint1: CGPointMake(295,441) controlPoint2: CGPointMake(292,469)];
 [strokeColor13 setStroke];
 path13.lineWidth = 1;
 [path13 stroke];
 */

/*
 //ellipse
 
 UIColor* strokeColor = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
 UIBezierPath* path = [UIBezierPath bezierPath];
 [path moveToPoint: CGPointMake(712,143)];
 [path addCurveToPoint: CGPointMake(372,252) controlPoint1: CGPointMake(712,203) controlPoint2: CGPointMake(560,252)];
 [path addCurveToPoint: CGPointMake(31,143) controlPoint1: CGPointMake(183,252) controlPoint2: CGPointMake(31,203)];
 [path addCurveToPoint: CGPointMake(372,34) controlPoint1: CGPointMake(31,82) controlPoint2: CGPointMake(183,34)];
 [path addCurveToPoint: CGPointMake(712,143) controlPoint1: CGPointMake(560,34) controlPoint2: CGPointMake(712,82)];
 [strokeColor setStroke];
 path.lineWidth = 7;
 [path stroke];
 */

/*
 //trapezoid
 
 UIColor* strokeColor = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
 UIBezierPath* path = [UIBezierPath bezierPath];
 [path moveToPoint: CGPointMake(51,464)];
 [path addLineToPoint: CGPointMake(717,465)];
 [path addLineToPoint: CGPointMake(504,30)];
 [path addLineToPoint: CGPointMake(222,30)];
 [path addLineToPoint: CGPointMake(51,464)];
 [strokeColor setStroke];
 path.lineWidth = 7;
 [path stroke];
 */


/*
 UIColor* strokeColor = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
 UIBezierPath* path = [UIBezierPath bezierPath];
 [path moveToPoint: CGPointMake(150,187)];
 [path addCurveToPoint: CGPointMake(357,298) controlPoint1: CGPointMake(150,248) controlPoint2: CGPointMake(242,298)];
 [path addCurveToPoint: CGPointMake(564,187) controlPoint1: CGPointMake(471,298) controlPoint2: CGPointMake(564,248)];
 [path addCurveToPoint: CGPointMake(357,75) controlPoint1: CGPointMake(564,125) controlPoint2: CGPointMake(471,75)];
 [path addCurveToPoint: CGPointMake(150,187) controlPoint1: CGPointMake(242,75) controlPoint2: CGPointMake(150,125)];
 [strokeColor setStroke];
 path.lineWidth = 5;
 [path stroke];
 */
/*
 UIColor* strokeColor = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
 UIBezierPath* path = [UIBezierPath bezierPath];
 [path moveToPoint: CGPointMake(550,487)];
 [path addCurveToPoint: CGPointMake(757,598) controlPoint1: CGPointMake(550,548) controlPoint2: CGPointMake(642,598)];
 [path addCurveToPoint: CGPointMake(964,487) controlPoint1: CGPointMake(871,598) controlPoint2: CGPointMake(964,548)];
 [path addCurveToPoint: CGPointMake(757,375) controlPoint1: CGPointMake(964,425) controlPoint2: CGPointMake(871,375)];
 [path addCurveToPoint: CGPointMake(550,487) controlPoint1: CGPointMake(642,375) controlPoint2: CGPointMake(550,425)];
 [strokeColor setStroke];
 path.lineWidth = 5;
 [path stroke];
 
 UIColor* strokeColor1 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
 UIBezierPath* path1 = [UIBezierPath bezierPath];
 [path1 moveToPoint: CGPointMake(613,403)];
 [path1 addCurveToPoint: CGPointMake(561,370) controlPoint1: CGPointMake(599,405) controlPoint2: CGPointMake(572,379)];
 [path1 addCurveToPoint: CGPointMake(479,278) controlPoint1: CGPointMake(530,348) controlPoint2: CGPointMake(483,318)];
 [path1 addCurveToPoint: CGPointMake(575,164) controlPoint1: CGPointMake(476,227) controlPoint2: CGPointMake(536,187)];
 [path1 addCurveToPoint: CGPointMake(885,108) controlPoint1: CGPointMake(669,111) controlPoint2: CGPointMake(778,96)];
 [path1 addCurveToPoint: CGPointMake(1073,212) controlPoint1: CGPointMake(943,115) controlPoint2: CGPointMake(1057,149)];
 [path1 addCurveToPoint: CGPointMake(987,332) controlPoint1: CGPointMake(1084,260) controlPoint2: CGPointMake(1017,306)];
 [path1 addCurveToPoint: CGPointMake(930,383) controlPoint1: CGPointMake(968,349) controlPoint2: CGPointMake(950,369)];
 [path1 addCurveToPoint: CGPointMake(896,405) controlPoint1: CGPointMake(920,391) controlPoint2: CGPointMake(902,398)];
 [strokeColor1 setStroke];
 path1.lineWidth = 1;
 [path1 stroke];
 
 UIColor* strokeColor2 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
 UIBezierPath* path2 = [UIBezierPath bezierPath];
 [path2 moveToPoint: CGPointMake(756,374)];
 [path2 addCurveToPoint: CGPointMake(763,293) controlPoint1: CGPointMake(746,355) controlPoint2: CGPointMake(747,309)];
 [strokeColor2 setStroke];
 path2.lineWidth = 1;
 [path2 stroke];
 
 UIColor* strokeColor3 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
 UIBezierPath* path3 = [UIBezierPath bezierPath];
 [path3 moveToPoint: CGPointMake(475,265)];
 [path3 addCurveToPoint: CGPointMake(304,376) controlPoint1: CGPointMake(445,226) controlPoint2: CGPointMake(319,359)];
 [path3 addCurveToPoint: CGPointMake(257,646) controlPoint1: CGPointMake(250,443) controlPoint2: CGPointMake(190,571)];
 [path3 addCurveToPoint: CGPointMake(370,704) controlPoint1: CGPointMake(278,670) controlPoint2: CGPointMake(340,723)];
 [path3 addCurveToPoint: CGPointMake(424,638) controlPoint1: CGPointMake(391,691) controlPoint2: CGPointMake(407,655)];
 [path3 addCurveToPoint: CGPointMake(498,573) controlPoint1: CGPointMake(445,614) controlPoint2: CGPointMake(470,590)];
 [path3 addCurveToPoint: CGPointMake(569,544) controlPoint1: CGPointMake(511,565) controlPoint2: CGPointMake(561,537)];
 [strokeColor3 setStroke];
 path3.lineWidth = 1;
 [path3 stroke];
 
 UIColor* strokeColor4 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
 UIBezierPath* path4 = [UIBezierPath bezierPath];
 [path4 moveToPoint: CGPointMake(409,470)];
 [path4 addCurveToPoint: CGPointMake(549,463) controlPoint1: CGPointMake(432,454) controlPoint2: CGPointMake(527,436)];
 [strokeColor4 setStroke];
 path4.lineWidth = 1;
 [path4 stroke];
 
 UIColor* strokeColor5 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
 UIBezierPath* path5 = [UIBezierPath bezierPath];
 [path5 moveToPoint: CGPointMake(1058,260)];
 [path5 addCurveToPoint: CGPointMake(1187,302) controlPoint1: CGPointMake(1100,237) controlPoint2: CGPointMake(1154,278)];
 [path5 addCurveToPoint: CGPointMake(1296,485) controlPoint1: CGPointMake(1243,344) controlPoint2: CGPointMake(1286,417)];
 [path5 addCurveToPoint: CGPointMake(1188,694) controlPoint1: CGPointMake(1303,523) controlPoint2: CGPointMake(1278,753)];
 [path5 addCurveToPoint: CGPointMake(1156,656) controlPoint1: CGPointMake(1175,684) controlPoint2: CGPointMake(1169,667)];
 [path5 addCurveToPoint: CGPointMake(1115,628) controlPoint1: CGPointMake(1144,645) controlPoint2: CGPointMake(1128,637)];
 [path5 addCurveToPoint: CGPointMake(1028,580) controlPoint1: CGPointMake(1087,610) controlPoint2: CGPointMake(1057,595)];
 [path5 addCurveToPoint: CGPointMake(925,548) controlPoint1: CGPointMake(998,566) controlPoint2: CGPointMake(957,551)];
 [strokeColor5 setStroke];
 path5.lineWidth = 1;
 [path5 stroke];
 
 UIColor* strokeColor6 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
 UIBezierPath* path6 = [UIBezierPath bezierPath];
 [path6 moveToPoint: CGPointMake(959,468)];
 [path6 addCurveToPoint: CGPointMake(1039,449) controlPoint1: CGPointMake(978,449) controlPoint2: CGPointMake(1013,445)];
 [strokeColor6 setStroke];
 path6.lineWidth = 1;
 [path6 stroke];
 
 UIColor* strokeColor7 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
 UIBezierPath* path7 = [UIBezierPath bezierPath];
 [path7 moveToPoint: CGPointMake(359,705)];
 [path7 addCurveToPoint: CGPointMake(393,869) controlPoint1: CGPointMake(329,765) controlPoint2: CGPointMake(349,819)];
 [path7 addCurveToPoint: CGPointMake(698,964) controlPoint1: CGPointMake(464,952) controlPoint2: CGPointMake(593,967)];
 [path7 addCurveToPoint: CGPointMake(774,901) controlPoint1: CGPointMake(744,963) controlPoint2: CGPointMake(769,949)];
 [path7 addCurveToPoint: CGPointMake(761,662) controlPoint1: CGPointMake(780,823) controlPoint2: CGPointMake(762,740)];
 [path7 addCurveToPoint: CGPointMake(759,600) controlPoint1: CGPointMake(761,645) controlPoint2: CGPointMake(765,614)];
 [strokeColor7 setStroke];
 path7.lineWidth = 1;
 [path7 stroke];
 
 UIColor* strokeColor8 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
 UIBezierPath* path8 = [UIBezierPath bezierPath];
 [path8 moveToPoint: CGPointMake(642,583)];
 [path8 addCurveToPoint: CGPointMake(590,684) controlPoint1: CGPointMake(623,618) controlPoint2: CGPointMake(591,637)];
 [strokeColor8 setStroke];
 path8.lineWidth = 1;
 [path8 stroke];
 
 UIColor* strokeColor9 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
 UIBezierPath* path9 = [UIBezierPath bezierPath];
 [path9 moveToPoint: CGPointMake(774,890)];
 [path9 addCurveToPoint: CGPointMake(861,969) controlPoint1: CGPointMake(763,936) controlPoint2: CGPointMake(822,964)];
 [path9 addCurveToPoint: CGPointMake(1084,883) controlPoint1: CGPointMake(931,977) controlPoint2: CGPointMake(1029,922)];
 [path9 addCurveToPoint: CGPointMake(1191,693) controlPoint1: CGPointMake(1130,852) controlPoint2: CGPointMake(1239,757)];
 [strokeColor9 setStroke];
 path9.lineWidth = 1;
 [path9 stroke];
 
 UIColor* strokeColor10 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
 UIBezierPath* path10 = [UIBezierPath bezierPath];
 [path10 moveToPoint: CGPointMake(838,589)];
 [path10 addCurveToPoint: CGPointMake(940,714) controlPoint1: CGPointMake(896,600) controlPoint2: CGPointMake(931,666)];
 [strokeColor10 setStroke];
 path10.lineWidth = 1;
 [path10 stroke];
 
 UIColor* strokeColor11 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
 UIBezierPath* path11 = [UIBezierPath bezierPath];
 [path11 moveToPoint: CGPointMake(829,1187)];
 [path11 addCurveToPoint: CGPointMake(879,1096) controlPoint1: CGPointMake(818,1160) controlPoint2: CGPointMake(856,1114)];
 [path11 addCurveToPoint: CGPointMake(1060,1042) controlPoint1: CGPointMake(931,1058) controlPoint2: CGPointMake(997,1054)];
 [path11 addCurveToPoint: CGPointMake(1283,900) controlPoint1: CGPointMake(1150,1025) controlPoint2: CGPointMake(1233,979)];
 [path11 addCurveToPoint: CGPointMake(1314,1089) controlPoint1: CGPointMake(1270,962) controlPoint2: CGPointMake(1316,1027)];
 [path11 addCurveToPoint: CGPointMake(1181,1296) controlPoint1: CGPointMake(1310,1171) controlPoint2: CGPointMake(1252,1256)];
 [path11 addCurveToPoint: CGPointMake(874,1333) controlPoint1: CGPointMake(1097,1342) controlPoint2: CGPointMake(966,1369)];
 [path11 addCurveToPoint: CGPointMake(799,1227) controlPoint1: CGPointMake(831,1315) controlPoint2: CGPointMake(785,1279)];
 [path11 addCurveToPoint: CGPointMake(868,1181) controlPoint1: CGPointMake(808,1190) controlPoint2: CGPointMake(835,1187)];
 [path11 addCurveToPoint: CGPointMake(1033,1198) controlPoint1: CGPointMake(900,1173) controlPoint2: CGPointMake(1018,1167)];
 [strokeColor11 setStroke];
 path11.lineWidth = 1;
 [path11 stroke];
 
 UIColor* strokeColor12 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
 UIBezierPath* path12 = [UIBezierPath bezierPath];
 [path12 moveToPoint: CGPointMake(704,965)];
 [path12 addCurveToPoint: CGPointMake(718,1444) controlPoint1: CGPointMake(779,1117) controlPoint2: CGPointMake(833,1300)];
 [path12 addCurveToPoint: CGPointMake(774,1458) controlPoint1: CGPointMake(731,1448) controlPoint2: CGPointMake(760,1460)];
 [path12 addCurveToPoint: CGPointMake(812,1408) controlPoint1: CGPointMake(800,1454) controlPoint2: CGPointMake(802,1431)];
 [path12 addCurveToPoint: CGPointMake(837,1315) controlPoint1: CGPointMake(824,1381) controlPoint2: CGPointMake(847,1344)];
 [strokeColor12 setStroke];
 path12.lineWidth = 1;
 [path12 stroke];
 
 UIColor* strokeColor13 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
 UIBezierPath* path13 = [UIBezierPath bezierPath];
 [path13 moveToPoint: CGPointMake(829,964)];
 [path13 addCurveToPoint: CGPointMake(845,1125) controlPoint1: CGPointMake(831,1017) controlPoint2: CGPointMake(825,1077)];
 [strokeColor13 setStroke];
 path13.lineWidth = 1;
 [path13 stroke];
 */
