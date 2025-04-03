//
//  DragDropTextField.m
//  VapxTool
//
//  Created by Husn on 2025/4/3.
//  Copyright © 2025 Chance Guo. All rights reserved.
//

#import "DragDropTextField.h"

@interface DragDropTextField() <NSDraggingDestination>
@end

@implementation DragDropTextField

- (instancetype)initWithFrame:(NSRect)frameRect {
    self = [super initWithFrame:frameRect];
    if (self) {
        [self registerForDraggedTypes:@[NSPasteboardTypeFileURL]];
        self.editable = NO;
        self.placeholderString = @"拖拽文件到此处";
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self registerForDraggedTypes:@[NSPasteboardTypeFileURL]];
    self.editable = NO;
    self.placeholderString = @"拖拽文件到此处";
}

- (NSDragOperation)draggingEntered:(id<NSDraggingInfo>)sender {
    if ([self isValidDrag:sender]) {
        return NSDragOperationCopy;
    }
    return NSDragOperationNone;
}

- (BOOL)performDragOperation:(id<NSDraggingInfo>)sender {
    NSPasteboard *pboard = [sender draggingPasteboard];
    NSArray *classes = @[[NSURL class]];
    NSDictionary *options = @{NSPasteboardURLReadingFileURLsOnlyKey: @YES};
    NSArray *files = [pboard readObjectsForClasses:classes options:options];

    for (NSURL *fileURL in files) {
        BOOL isExists = [[NSFileManager defaultManager] fileExistsAtPath:fileURL.path];
        if (isExists) {
            // Display folder path
            self.stringValue = fileURL.path;
            if (self.dragDelegate && [self.dragDelegate respondsToSelector:@selector(dragDropTextField:didReceiveURL:)]) {
                [self.dragDelegate dragDropTextField:self didReceiveURL:fileURL];
            }
        }
    }
    return YES;
}

- (BOOL)isValidDrag:(id<NSDraggingInfo>)sender {
    NSPasteboard *pboard = [sender draggingPasteboard];
    NSArray *classes = @[[NSURL class]];
    NSDictionary *options = @{NSPasteboardURLReadingFileURLsOnlyKey: @YES};
    NSArray *files = [pboard readObjectsForClasses:classes options:options];
    for (NSURL *fileURL in files) {
        BOOL isDirectory;
        [[NSFileManager defaultManager] fileExistsAtPath:fileURL.path isDirectory:&isDirectory];
        if (self.needDir && !isDirectory) {
            return NO;
        }
    }
    return YES;
}

@end
