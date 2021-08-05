//
//  MZPersonViewController.m
//  设计模式
//
//  Created by A5 on 2021/4/8.
//  Copyright © 2021 孟哲. All rights reserved.
//

#import "MZPersonViewController.h"
#import <KVOController/KVOController.h>
#import "MZPerson.h"
#import "NSObject+MZ_KVO.h"

@interface MZPersonViewController ()

@property (nonatomic,strong) NSArray *arr;
@property (nonatomic,strong) NSMutableArray *mutArray;
@property (nonatomic,strong) NSHashTable *hashTable;
@property (nonatomic,strong) MZPerson *person;
@property (nonatomic,strong) FBKVOController *fbKVO;


@end

@implementation MZPersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.orangeColor;
    self.navigationItem.title = @"MZPersonViewController";
//    [self kvoTest];
   
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    [self hashAndIsequeal];
    [self weakCrach];
    
//    MZReusePoolViewController *blockVc = [[MZReusePoolViewController alloc] init];
//
//    [self.navigationController pushViewController:blockVc animated:YES];
    
//    MZBlockViewController *blockVc = [[MZBlockViewController alloc] init];
//    [self.navigationController pushViewController:blockVc animated:YES];

//    dispatch_async(dispatch_get_global_queue(-2,0), ^{
//        @autoreleasepool{
//            for (int i = 0; i < 100; i++) {
//                NSString *str = [[NSString alloc] init];
//            }
//
            
//        }
//        _objc_autoreleasePoolPrint();
      
       
//    });

//    _person.age += 1;
 
}


- (void)weakCrach
{
    MZPerson *_person = [[MZPerson alloc] init];
    _person.lastName = @"weakCrach";
    
//    [_person action];
}

- (void)kvoTest
{
    _person = [[MZPerson alloc] init];
    _person.a = 1;
    _person.b = 2;
    _person.s = @"ascf";
    
//    [_person mz_addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew context:nil];
    
    [self.fbKVO observe:_person keyPaths:@[@"age",@"b"] options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew block:^(id  _Nullable observer, id  _Nonnull object, NSDictionary<NSString *,id> * _Nonnull change) {
        
        NSLog(@"change == %@",change);
        
    }];
  
}

- (void)mz_observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    NSLog(@"change == %@",change);
}

- (void)hashAndIsequeal
{
    id delegate = @"123";
    id delegate1 = @"123";
    NSMapTable *mapTable = [NSMapTable mapTableWithKeyOptions:NSMapTableStrongMemory valueOptions:NSMapTableWeakMemory];
    [mapTable setObject:delegate forKey:@"foo"];
    [mapTable setObject:delegate forKey:@"fo1"];
    NSLog(@"Keys: %@", [[mapTable keyEnumerator] allObjects]);
    NSLog(@"Objects: %@", [[mapTable objectEnumerator] allObjects]);
    
    NSMutableSet *set = [[NSMutableSet alloc] init];
    [set addObject:delegate];
    [set addObject:delegate1];
    [set addObject:delegate];
   
    MZPerson *p1 = [[MZPerson alloc] init];
    p1.firstName = @"111";
    p1.lastName = @"222";
    MZPerson *p2 = [[MZPerson alloc] init];
    p2.firstName = @"111";
    p2.lastName = @"222";
    [set addObject:p1];
    [set addObject:p2];
    NSLog(@"p1 isEqual p2 = %d", [p1 isEqual:p2]);
    
    NSLog(@"NSSetObject: %@", [[set objectEnumerator] allObjects]);
    
    NSHashTable *hashTable = [NSHashTable hashTableWithOptions:NSPointerFunctionsCopyIn];
    [NSHashTable hashTableWithOptions:NSHashTableObjectPointerPersonality|NSHashTableWeakMemory];
    [hashTable addObject:@"foo"];
    [hashTable addObject:@"bar"];
    [hashTable addObject:@"foo"];
    [hashTable addObject:@42];
    
}

- (FBKVOController *)fbKVO
{
    if (!_fbKVO) {
        _fbKVO = [FBKVOController controllerWithObserver:self];;
    }
    return _fbKVO;
}



@end
