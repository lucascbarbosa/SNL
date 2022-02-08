close all;
clear all;

% reference
ref_pulse_T = 10;

ref_sin_freq = 1/ref_pulse_T;

switch_ref = 0;

% reference plant
am = 5;
bm = 1;

% real plant
ap = 1;
bp = 1;


% parameters
alpha = 1;
beta = 1;