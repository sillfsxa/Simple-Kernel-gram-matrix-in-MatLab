clear;
clc;

% Here you should load your matrix containing data samples. This matrix should be M by N, with M rows for samples and N columns containing
% Features of each sample.
% Data = load('YOUR_DATA');
% Choose one of the functions or define your kernel function as a function hadle
% Available kernel functions are: 'gaussian', 'poly', 'invquad'
% K_Func = YOUR_KERNEL_FUNCTION

PDIST = squareform(pdist(Data,'euclidean'));
SIGMA = 2; % Choose your desired sigma
d = 2 % degree of polynomial kernel

if(strcmpi(K_Func,'gaussian'))
  K = exp(-PDIST/(2*SIGMA^2));
else if(strcmpi(K_Func,'poly'))
  K = (Data.*Data')^d;
else if(strcmpi(K_Func,'invquad'))
  K = inv(PDIST^2);
end

% Now matrix K can be used as a gram matrix for algorithms like FLD to find discriminants.

