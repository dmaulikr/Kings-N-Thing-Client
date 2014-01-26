//
//  AppDelegate.m
//  AppScaffold
//

#import "AppDelegate.h"
#import "LoginMenu.h"
#import "UDPMessageReceiver.h"
#import "ServerAccess.h"
#import "LoginViewController.h"
#import "IPManager.h"
#import "Game.h"

void onUncaughtException(NSException *exception)
{
    NSLog(@"uncaught exception: %@", exception.description);
}

@implementation AppDelegate
{
    SPViewController *_viewController;
    UIWindow *_window;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
   NSSetUncaughtExceptionHandler(&onUncaughtException);
   
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Storyboard" bundle: nil];
    UIViewController *yourController = [mainStoryboard instantiateInitialViewController];
    
    udpMessageReceiver = [[UDPMessageReceiver alloc] init];
    [udpMessageReceiver startListeningOnPort:3004];
    
    NSLog(@"My IP is: %@", [IPManager getIPAddress:YES]);
    
    [_window setRootViewController:yourController];
    [_window makeKeyAndVisible];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleGameStarted:)
                                                 name:@"gameStarted"
                                               object:nil];
    
    return YES;
}

-(void) handleGameStarted: (NSNotification*) notif{
    dispatch_async(dispatch_get_main_queue(), ^{

        Game *game = notif.object;
        // John/Richard, here is the game object in its initial state.  Do as you need with it
        
        CGRect screenBounds = [UIScreen mainScreen].bounds;
        _window = [[UIWindow alloc] initWithFrame:screenBounds];
        
        _viewController = [[SPViewController alloc] init];
        
        _viewController.multitouchEnabled = YES;
        
        // Enable some common settings here:
        _viewController.showStats = YES;
        _viewController.multitouchEnabled = YES;
        // _viewController.preferredFramesPerSecond = 60;
        
        [_viewController startWithRoot:[LoginMenu class] supportHighResolutions:YES doubleOnPad:YES];
        
        [_window setRootViewController:_viewController];
        [_window makeKeyAndVisible];
    });
}

@end
