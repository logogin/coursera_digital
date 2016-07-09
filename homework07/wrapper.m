clear all
close all
clc

%% Simulate 1-D blur and noise
image_original = im2double(imread('Cameraman256.bmp'));
[H, W] = size(image_original);
blur_impulse = fspecial('motion', 7, 0);
image_blurred = imfilter(image_original, blur_impulse, 'conv', 'circular');
noise_power = 1e-4;
randn('seed', 1);
noise = sqrt(noise_power) * randn(H, W);
image_noisy = image_blurred + noise;

figure; imshow(image_original);
figure; imshow(image_blurred);
figure; imshow(image_noisy);

%% CLS restoration
alpha = [0.0001, 0.001, 0.01, 0.1, 1, 10, 100, 0.3, 3];  % you should try different values of alpha
_isnr = [];
for i = 1:length(alpha)
  image_cls_restored = abs(cls_restoration(image_noisy, blur_impulse, alpha(i)));
  figure; imshow(image_cls_restored);
  noisy_psnr = 10 * log10(1 / (norm(image_original - image_noisy, 'fro') ^ 2 / H / W));
  restored_psnr = 10 * log10(1 / (norm(image_original - image_cls_restored, 'fro') ^ 2 / H / W));
  _isnr_psnr = restored_psnr - noisy_psnr;
  _isnr(i) = isnr(image_original, image_noisy, image_cls_restored);
  printf("%f => %f => %f\n", alpha(i), _isnr(i), _isnr_psnr);
endfor

%% computation of ISNR
