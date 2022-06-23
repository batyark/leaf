%%
clc;clear;
le1=imread('leaf scorch.jpg');
le_gray1=im2gray(le1);

figure(1);
subplot(141)
imshow(le1);title('Fig:1 (a) leaf  input image')
subplot(142)
%Find edges in 2-D grayscale image
BW_rob1= edge(le_gray1,'roberts');
imshow(BW_rob1);title('(b) output image:Roberts-Filter')
subplot(143)
%Find edges in 2-D grayscale image
BW_pr1= edge(le_gray1,'prewitt');
imshow(BW_pr1);title('(c)output image: Prewittfilter')
subplot(144)

%Find edges in 2-D grayscale image
BW_ca1= edge(le_gray1,'canny');
imshow(BW_ca1);title('(d)output image: canny')
err_rob1 = immse(uint8(BW_rob1), le_gray1);
fprintf('\n The mean-squared error of Roberts is  %0.4f\n', err_rob1);

err_pr1 = immse(uint8(BW_pr1), le_gray1);
fprintf('\n The mean-squared error of Prewitt is  %0.4f\n', err_pr1);

err_can1 = immse(uint8(BW_ca1), le_gray1);
fprintf('\n The mean-squared error of canny is  %0.4f\n', err_can1);


[peaksnr1, snr1] = psnr(uint8(BW_rob1) , le_gray1);
  
fprintf('\n The Peak-SNR value  of Roberts is %0.4f', peaksnr1);

[peaksnr2, snr2] = psnr(uint8(BW_pr1) , le_gray1);
  
fprintf('\n The Peak-SNR value of Prewitt is %0.4f', peaksnr2);

[peaksnr3, snr3] = psnr(uint8(BW_ca1) , le_gray1);
  
fprintf('\n The Peak-SNR value of canny is %0.4f', peaksnr3);


