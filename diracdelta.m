function [ y ] = diracdelta( u )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
y=zeros(size(u));
y(u==0)=1;

end

