function y = fir3(x)
%FIR3 Filters input x and returns output y.

% MATLAB Code
% Generated by MATLAB(R) 8.1 and the Signal Processing Toolbox 6.19.
% Generated on: 17-May-2015 13:00:17

persistent Hd;

if isempty(Hd)
    
    N     = 15;   % Order
    Fpass = 50;   % Passband Frequency
    Fstop = 70;   % Stopband Frequency
    Fs    = 200;  % Sampling Frequency
    
    h = fdesign.lowpass('n,fp,fst', N, Fpass, Fstop, Fs);
    
    Hd = design(h, 'equiripple', ...
        'StopbandShape', 'flat');
    
    
    
    set(Hd,'PersistentMemory',true);
    
end

y = filter(Hd,x);


