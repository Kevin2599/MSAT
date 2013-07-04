% MS_ELASTICDB - Database of various elastic constants..
%
% // Part of MSAT - The Matlab Seismic Anisotropy Toolkit //
%
% Given a reference string, uid, output the elastic stiffness matrix (in 
% GPa), density (in kg/m3) and a descriptive string. 
%
%  %  [ ... ] = MS_elasticDB( uid )
%
% Usage: 
%     [ C ] = MS_elasticDB( uid )                    
%          Output the elasticity matrix corresponding to the reference 
%          string uid (e.g. 'olivine'). C is a 6x6 matrix and is in GPa. 
%
%     [ C, rh ] = MS_elasticDB( uid )                   
%          Also return the density in kg/m3.
%
%     [ C, rh, info ] = MS_elasticDB( uid )                    
%          Also return a descriptive string describing the material and 
%          source.
%
% See also: MS_LOAD MS_LOAD_LIST

% Copyright (c) 2011, James Wookey and Andrew Walker
% All rights reserved.
% 
% Redistribution and use in source and binary forms, 
% with or without modification, are permitted provided 
% that the following conditions are met:
% 
%    * Redistributions of source code must retain the 
%      above copyright notice, this list of conditions 
%      and the following disclaimer.
%    * Redistributions in binary form must reproduce 
%      the above copyright notice, this list of conditions 
%      and the following disclaimer in the documentation 
%      and/or other materials provided with the distribution.
%    * Neither the name of the University of Bristol nor the names 
%      of its contributors may be used to endorse or promote 
%      products derived from this software without specific 
%      prior written permission.
% 
% THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS 
% AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED 
% WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED 
% WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A 
% PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL 
% THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY 
% DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR 
% CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, 
% PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF 
% USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER 
% CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN 
% CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE 
% OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS 
% SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

function [ varargout ] = MS_elasticDB( uid )

   switch lower(uid)
      case {'olivine','ol'}
      info = 'Single crystal olivine (Abramson et al, JGR, 1997; doi:10.1029/97JB00682)' ; 
         C = [320.5  68.1  71.6   0.0   0.0   0.0 ; ...
               68.1 196.5  76.8   0.0   0.0   0.0 ; ...
               71.6  76.8 233.5   0.0   0.0   0.0 ; ...
                0.0   0.0   0.0  64.0   0.0   0.0 ; ...
                0.0   0.0   0.0   0.0  77.0   0.0 ; ...
                0.0   0.0   0.0   0.0   0.0  78.7 ];
         rh = 3355 ;   
      case {'albite','alb'}
      info = 'Single crystal albite (Brown et al, PCM, 2006; doi:10.1007/s00269-006-0074-1)' ;
         C = [ 69.9  34.0  30.8   5.1  -2.4  -0.9 ; ...
               34.0 183.5   5.5  -3.9  -7.7  -5.8 ; ...
               30.8   5.5 179.5  -8.7   7.1  -9.8 ; ...
                5.1  -3.9  -8.7  24.9  -2.4  -7.2 ; ...
               -2.4  -7.7   7.1  -2.4  26.8   0.5 ; ...
               -0.9  -5.8  -9.8  -7.2   0.5  33.5 ];
         rh = 2623 ;
       case {'enstatite', 'ens'}
         info = 'Single crystal orthoenstatite (Weidner et al, PEPI 1978, 17:7-13)' ;
         C = [ 225.0  72.0  54.0   0.0  0.0   0.0 ; ...
               72.0  178.0  53.0   0.0  0.0   0.0 ; ...
               54.0   53.0 214.0   0.0  0.0   0.0 ; ...
                0.0    0.0   0.0  78.0  0.0   0.0 ; ...
                0.0    0.0   0.0   0.0 76.0   0.0 ; ...
                0.0    0.0   0.0   0.0  0.0  82.0 ];
         rh = 3200 ;  
       case {'jadeite', 'jd'}
         info = 'Single crystal jadeite (Kandelin and Weidner, 1988, 50:251-260)' ;
         C = [ 274.0  94.0  71.0   0.0  4.0   0.0 ; ...
               94.0  253.0  82.0   0.0 14.0   0.0 ; ...
               71.0   82.0 282.0   0.0 28.0   0.0 ; ...
                0.0    0.0   0.0  88.0  0.0  13.0 ; ...
                4.0   14.0  28.0   0.0 65.0   0.0 ; ...
                0.0    0.0   0.0  13.0  0.0  94.0 ];
         rh = 3300 ; 
       case {'diopside', 'di'}
         info = 'Single crystal chrome-diopeside (Isaak and Ohno, PCM, 2003, 30:430-439)' ;
         C = [228.1   94.0  71.0   0.0  7.9   0.0 ; ...
               94.0  181.1  82.0   0.0  5.9   0.0 ; ...
               71.0   82.0 245.4   0.0 39.7   0.0 ; ...
                0.0    0.0   0.0  78.9  0.0   6.4 ; ...
                7.9    5.9  39.7   0.0 68.2   0.0 ; ...
                0.0    0.0   0.0   6.4  0.0  78.1 ];
         rh = 3400 ;
       case {'halite', 'nacl'}
           info = 'Single crystal halite (NaCl, rock-salt).';
           C = [ 49.5  13.2  13.2  0.0  0.0  0.0 ; ...
                 13.2  49.5  13.2  0.0  0.0  0.0 ; ...
                 13.2  13.2  49.5  0.0  0.0  0.0 ; ...
                  0.0   0.0   0.0 12.8  0.0  0.0 ; ...
                  0.0   0.0   0.0  0.0 12.8  0.0 ; ...
                  0.0   0.0   0.0  0.0  0.0 12.8];
           rh = 2170;
       case {'sylvite', 'kcl'}
           info = 'Single crystal sylvite (KCl).';
           C = [ 40.1   6.6   6.6  0.0  0.0  0.0 ; ...
                  6.6  40.1   6.6  0.0  0.0  0.0 ; ...
                  6.6   6.6  40.1  0.0  0.0  0.0 ; ...
                  0.0   0.0   0.0  6.4  0.0  0.0 ; ...
                  0.0   0.0   0.0  0.0  6.4  0.0 ; ...
                  0.0   0.0   0.0  0.0  0.0  6.4];
           rh = 1990;
       case 'galena'
           info = 'Single crystal galena (Bhagavantam and Rao, Nature, 1951 168:42)';
           C = [127.0  29.8  29.8  0.0  0.0  0.0 ; ...
                 29.8 127.0  29.8  0.0  0.0  0.0 ; ...
                 29.8  29.8 127.0  0.0  0.0  0.0 ; ...
                  0.0   0.0   0.0 24.8  0.0  0.0 ; ...
                  0.0   0.0   0.0  0.0 24.8  0.0 ; ...
                  0.0   0.0   0.0  0.0  0.0 24.8];
           rh = 7600;
       case 'stishovite'
           info = 'Single crystal stishovite, SiO2 (Weidner et al., JGR, 1982, 87:4740-4746)';
           C = [453.0 211.0 203.0   0.0   0.0   0.0 ; ...
                211.0 453.0 203.0   0.0   0.0   0.0 ; ...
                203.0 203.0 776.0   0.0   0.0   0.0 ; ...
                  0.0   0.0   0.0 252.0   0.0   0.0 ; ...
                  0.0   0.0   0.0   0.0 252.0   0.0 ; ...
                  0.0   0.0   0.0   0.0   0.0 302.0];
           rh = 4290;
       case {'fluorapatite', 'apatite'}
           info = 'Single crystal fluorapatite, Ca5F(PO4)3 (Sha et al., J. Appl. Phys., 1994, 75:7784; doi:10.1063/1.357030)';
           C = [152.0 49.99 63.11   0.0   0.0   0.0 ; ...
                49.99 152.0 63.11   0.0   0.0   0.0 ; ...
                63.11 63.11 185.7   0.0   0.0   0.0 ; ...
                  0.0   0.0   0.0 42.75   0.0   0.0 ; ...
                  0.0   0.0   0.0   0.0 42.75   0.0 ; ...
                  0.0   0.0   0.0   0.0   0.0 51.005];
           rh = 3150;
           
       case {'antigorite', 'atg'}
           info = 'Adiabatic single crystal antigorite, (Bezacier et al., EPSL 2010, 289:198-208; doi:10.1016/j.epsl.2009.11.009)';
           % Note that X1||a, X2||b and X3||c* - not IRE convection.
           % and that these are adiabatic, not isothermal, constants, but
           % that's what "should" be used for wave velocites (c.f. Karato
           % deformation of Earth materials, sec. 4.3). Velocities quoted
           % in the reference (Table 3) use the corrected isotropic 
           % adiabatic moduli... 
           C = [208.10   66.40    16.00    0.0    5.50   0.0 ; ...
                 66.4   201.60     4.90    0.0   -3.10   0.0 ; ...
                 16.00    4.90    96.90    0.0    1.60   0.0 ; ...
                  0.0     0.0      0.0    16.90   0.0  -12.10 ; ...
                  5.50   -3.10     1.60    0.0   18.40   0.0 ; ...
                  0.0     0.0      0.0   -12.10   0.0   65.50];
           rh = 2620;
           
       case 'llm_mgsio3ppv'
           info = 'Adiabatic single crystal MgSiO3 post-perovskite under lowermost mantle conditions: from molecular dynamics, DFT & GGA and 2800 K and 127 GPa (Wookey et al. Nature, 2005, 438:1004-1007; doi:10.1038/nature04345 )';
           C = [1139  357  311    0    0    0 ; ...
                 357  842  466    0    0    0 ; ...
                 311  466 1137    0    0    0 ; ...
                  0     0    0  268    0    0 ; ...
                  0     0    0    0  210    0 ; ...
                  0     0    0    0    0  346 ];
           rh = 5269;  
           
       case 'llm_mgsio3pv'
           info = 'Adiabatic single crystal MgSiO3 perovskite under lowermost mantle conditions: from molecular dynamics, DFT & GGA and 2800 K and 126 GPa (Wookey et al. Nature, 2005, 438:1004-1007; doi:10.1038/nature04345 )';
           C = [ 808  522  401    0    0    0 ; ...
                 522 1055  472    0    0    0 ; ...
                 401  472  993    0    0    0 ; ...
                  0     0    0  328    0    0 ; ...
                  0     0    0    0  263    0 ; ...
                  0     0    0    0    0  262 ];
           rh = 5191;
           
       case 'ice'
           info = 'Adiabatic single crystal artifical water ice at -16C: from Gammon et al. (1983) Journal of Glaciology 29:433-460.';
           C = [13.961  7.153  5.765  0    0    0 ; ...
                 7.153 13.961  5.765  0    0    0 ; ...
                 5.765  5.765 15.013  0    0    0 ; ...
                  0     0       0     3.21 0    0 ; ...
                  0     0       0     0    3.21 0 ; ...
                  0     0       0     0    0    3.404 ];
           rh = 919.10; % See page 442 of paper.
           
       otherwise
         error('MS:ELASTICDB:UNKNOWN', ...
             'MS_elasticDB: Unknown identifier') ;
   end
   
   switch nargout
   case 0
      varargout(1) = {C} ;   
   case 1
      varargout(1) = {C} ;
   case 2
      varargout(1) = {C} ;
      varargout(2) = {rh} ;
   case 3 
      varargout(1) = {C} ;
      varargout(2) = {rh} ;
      varargout(3) = {info} ;
   otherwise
      error('MS:BADOUTPUT', ...
          'MS_elasticDB requires 1-3 output arguments.') ;
   end   
return






 
                             
                             
