//
//  MovieStyleOddCell.m
//  douban
//
//  Created by 步宇星 on 2018/6/11.
//  Copyright © 2018年 步宇星. All rights reserved.
//

#import "MovieStyleOddCell.h"

@interface MovieStyleOddCell()

@property (nonatomic, strong) UILabel * nameLabel;
@property (nonatomic, strong) UILabel * averageLabel;
@property (nonatomic, strong) UILabel * tipLabel;
@property (nonatomic, strong) UIImageView * moviePosterImageView;
@property (nonatomic, strong) UIImageView * directorImageView;
@property (nonatomic, strong) NSArray <UIImageView *> * actorsImageViews;

@end

@implementation MovieStyleOddCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.nameLabel];
        [self addSubview:self.averageLabel];
        [self addSubview:self.tipLabel];
        [self addSubview:self.moviePosterImageView];
        [self addSubview:self.directorImageView];
        self.actorsImageViews = [self actorsImageViewsWithCount:3];
    }
    return self;
}
- (UILabel *)nameLabel{
    if (!_nameLabel) {
        UILabel * nameLabel = [[UILabel alloc] init];
        nameLabel.textColor = [Util greenColor];
        nameLabel.font = [Util pingFangSCSemiboldWithSize:30];
        _nameLabel = nameLabel;
    }
    return _nameLabel;
}

- (UILabel *)averageLabel{
    if (!_averageLabel) {
        UILabel * averageLabel = [[UILabel alloc] init];
        averageLabel.textColor = [Util orangeColor];
        averageLabel.font = [Util pingFangSCRegularWithSize:30];
        _averageLabel = averageLabel;
    }
    return _averageLabel;
}

- (UILabel *)tipLabel{
    if (!_tipLabel) {
        UILabel * tipLabel = [[UILabel alloc] init];
        tipLabel.textColor = [Util greenColor];
        tipLabel.font = [Util pingFangSCRegularWithSize:11];
        _tipLabel = tipLabel;
    }
    return _tipLabel;
}

- (UIImageView *)moviePosterImageView
{
    if (!_moviePosterImageView) {
        _moviePosterImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"placeHolderImage"]];
    }
    return _moviePosterImageView;
}

- (UIImageView *)directorImageView
{
    if (!_directorImageView) {
        _directorImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"placeHolderImage"]];
    }
    return _directorImageView;
}

- (NSArray<UIImageView *> *)actorsImageViewsWithCount:(NSUInteger)count{
    NSMutableArray * array = [NSMutableArray arrayWithCapacity:count];
    for (NSInteger i = 0; i < count; i ++) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"placeHolderImage"]];
        [array addObject:imageView];
        [self addSubview:imageView];
    }
    return [array copy];
}

- (void) configCellWithModel:(id<MovieStyleOddCellModelProtocol>)model;
{
    self.nameLabel.text = model.name;
    self.averageLabel.text = model.average;
    self.tipLabel.text = @"第一张是导演，后面的是主演";
    [self.moviePosterImageView setUrl:model.posterUrl placeholder:[UIImage imageNamed:@"placeHolderImage"]];
    [self.directorImageView setUrl:model.directorUrl placeholder:[UIImage imageNamed:@"placeHolderImage"]];
    if (model.actorsUrls.count != 3) {
        for (UIImageView *imageView in self.actorsImageViews) {
            [imageView removeFromSuperview];
        }
        self.actorsImageViews = [self actorsImageViewsWithCount:model.actorsUrls.count];
    }
    for (NSUInteger i = 0; i < model.actorsUrls.count; i++ ) {
        [self.actorsImageViews[i] setUrl:model.actorsUrls[i] placeholder:[UIImage imageNamed:@"placeHolderImage"]];
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.moviePosterImageView.frame = CGRectMake(2, 15, 100, 150);
    CGRect frame = self.nameLabel.frame;
    frame.origin.x = self.moviePosterImageView.frame.origin.x + self.moviePosterImageView.frame.size.width + 10;
    frame.origin.y = 15;
    self.nameLabel.frame = frame;
    [self.nameLabel sizeToFit];
    [self.averageLabel sizeToFit];
    frame = self.averageLabel.frame;
    frame.origin.x = self.frame.size.width - frame.size.width-3 ;
    frame.origin.y = 10;
    self.averageLabel.frame = frame;
    [self.tipLabel sizeToFit];
    frame = self.tipLabel.frame;
    frame.origin.x = self.nameLabel.frame.origin.x;
    frame.origin.y = 22 + self.nameLabel.frame.origin.y + self.nameLabel.frame.size.height;
    self.tipLabel.frame = frame;
    
    self.directorImageView.frame = CGRectMake(self.nameLabel.frame.origin.x, frame.origin.y+frame.size.height + 5, 51, 68);
    frame = CGRectMake(10 + self.directorImageView.frame.origin.x + self.directorImageView.frame.size.width, self.directorImageView.frame.origin.y + 8.5, 38.25, 51);
    for (UIImageView *imageView in self.actorsImageViews) {
        imageView.frame = frame;
        frame.origin.x = frame.origin.x + 10 + frame.size.width;
    }
}

@end
