% Calculate Heat transfer in Shipping containers

clc 
%Global
in2m    = 2.54/100;
f2k     = 5/9; 
hp2Watt = 745.7;
%% functions
function [rEq] = calcReq( L,k,A )
  rEq = L/(k*A);
end

% Inputs
tIn = 20;   % F temp of inside of trailer (setpoint)
tOut = 100; %F ambient outside temp

% thermal Resistance
kTrailWallInt = 0.025 ; % W/m*K (Rigid Polyurethane foam) (from CMU slide)
kTrailWall    = kTrailWallInt*in2m*f2k; % [W/(in*F)]
tTrailWall    = 1;     % [in]

kAlumInt      = 205;
kAlumInt      = kAlumInt*in2m*f2k; %[ W/(in*F)]
tAlum         =0.04; %[in]
% Area
lengthTrailer = 53;  % [ft] 
widthTrailer  = 8.5; % [ft] 
heightTrailer = 8.5; % [ft]

% Calculations 
trailArea = 2*lengthTrailer*heightTrailer + 2* widthTrailer*heightTrailer ...
            + 2*lengthTrailer*widthTrailer; % ft ^2
         
rEqIns = calcReq(tTrailWall,kTrailWall,trailArea);
rEqAl  = calcReq(tAlum,kAlumInt,trailArea);

% Thermal Circuit
rEqTrail = rEqIns+rEqAl;
q = (tOut - tIn)/rEqTrail; % [Watts] heat flow 

disp(' heat flow')
disp( q*1/hp2Watt)
disp(' in Hp')