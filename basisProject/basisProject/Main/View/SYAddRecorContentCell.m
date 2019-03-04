//
//  SYAddRecorContentCell.m
//  basisProject
//
//  Created by syong on 2019/2/28.
//  Copyright © 2019年 shenyong. All rights reserved.
//

#import "SYAddRecorContentCell.h"

@interface SYAddRecorContentCell()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (weak, nonatomic) IBOutlet UITextField *locationField;
@property (weak, nonatomic) IBOutlet UILabel *placehouderLabel;

@end

@implementation SYAddRecorContentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _textView.delegate = self;
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textFiledChange) name:UITextFieldTextDidChangeNotification object:nil];
}

- (void)textViewDidChange:(UITextView *)textView{
    if (textView == _textView) {
        
        if (self.contentChangeBlock) {
            self.contentChangeBlock(_textView.text);
        }
        
        if (textView.text.length > 0) {
            _placehouderLabel.text = @"";
        }else{
            _placehouderLabel.text = @"Share your travel history in 100 words at most";
        }
    }
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    
    if(range.length + range.location > textView.text.length)
    {
        return NO;
    }
    
    
    NSUInteger newLength = [textView.text length] + [text length] - range.length;
    return newLength <= 100;
    
    
}

- (void)textFiledChange{
    
    if (self.loactionChangeBlock) {
        self.loactionChangeBlock(_locationField.text);
    }
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
