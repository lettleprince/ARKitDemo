//
//  ViewController.m
//  ARKitDemo
//
//  Created by qd-hxt on 2017/12/4.
//  Copyright © 2017年 qding. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <ARSCNViewDelegate>

@property (nonatomic, strong) IBOutlet ARSCNView *sceneView;

@end

    
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 创建 SCNScene 实例来作为所有 3D 物体的容器
    SCNScene *scene = [SCNScene new];
    // 我们要创建的正方体
    SCNBox *boxGeometry = [SCNBox
                           boxWithWidth:0.1
                           height:0.1
                           length:0.1
                           chamferRadius:0.0];
    // 将正方体封装成 SCNNode
    SCNNode *boxNode = [SCNNode nodeWithGeometry:boxGeometry];
    // 将立方体放在相机前面
    boxNode.position = SCNVector3Make(0, 0, -0.5);
    // rootNode 是 3D 场景中所有的物体的起点
    [scene.rootNode addChildNode: boxNode];
    // 将 scene 赋值给 sceneView.scene
    self.sceneView.scene = scene;
    
    self.sceneView.autoenablesDefaultLighting = YES;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // Create a session configuration
    ARWorldTrackingConfiguration *configuration = [ARWorldTrackingConfiguration new];

    // Run the view's session
    [self.sceneView.session runWithConfiguration:configuration];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    // Pause the view's session
    [self.sceneView.session pause];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - ARSCNViewDelegate

/*
// Override to create and configure nodes for anchors added to the view's session.
- (SCNNode *)renderer:(id<SCNSceneRenderer>)renderer nodeForAnchor:(ARAnchor *)anchor {
    SCNNode *node = [SCNNode new];
 
    // Add geometry to the node...
 
    return node;
}
*/

- (void)session:(ARSession *)session didFailWithError:(NSError *)error {
    // Present an error message to the user
    
}

- (void)sessionWasInterrupted:(ARSession *)session {
    // Inform the user that the session has been interrupted, for example, by presenting an overlay
    
}

- (void)sessionInterruptionEnded:(ARSession *)session {
    // Reset tracking and/or remove existing anchors if consistent tracking is required
    
}

@end
