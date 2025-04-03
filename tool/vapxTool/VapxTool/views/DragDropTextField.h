//
//  DragDropTextField.h
//  VapxTool
//
//  Created by Husn on 2025/4/3.
//  Copyright © 2025 Chance Guo. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class DragDropTextField;

@protocol DragDropTextFieldDelegate <NSObject>

- (void)dragDropTextField:(DragDropTextField *_Nonnull)textField didReceiveURL:(NSURL *_Nonnull)url;
@end

NS_ASSUME_NONNULL_BEGIN

@interface DragDropTextField : NSTextField

@property (atomic, weak) id<DragDropTextFieldDelegate> dragDelegate;

@property (atomic, assign) BOOL needDir; // 被拖拽的文件是否需要是dir

@end

NS_ASSUME_NONNULL_END
