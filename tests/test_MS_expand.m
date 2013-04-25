function test_suite = test_MS_expand
   initTestSuite;
end

function test_MS_expand_isotropic

    C_in = [  0.0 0.0 0.0 0.0 0.0 0.0 ; ...
              0.0 0.0 0.0 0.0 0.0 0.0 ; ...
              0.0 0.0 166.6667 0.0 0.0 0.0 ; ...
              0.0 0.0 0.0 0.0 0.0 0.0 ; ...
              0.0 0.0 0.0 0.0 0.0 0.0 ; ...
              0.0 0.0 0.0 0.0 0.0 50.0 ];
          
    C_out = [ 166.6667 66.6667 66.6667 0.0 0.0 0.0 ; ...
              66.6667 166.6667 66.6667 0.0 0.0 0.0 ; ...
              66.6667 66.6667 166.6667 0.0 0.0 0.0 ; ...
              0.0 0.0 0.0 50.0 0.0 0.0 ; ...
              0.0 0.0 0.0 0.0 50.0 0.0 ; ...
              0.0 0.0 0.0 0.0 0.0 50.0 ];          
          
    assertElementsAlmostEqual(MS_expand(C_in, 'iso'), C_out);
    assertElementsAlmostEqual(MS_expand(C_in, 'auto'), C_out);
    
end

function test_MS_expand_cubic

    C_in = [  0.0 66.6667 0.0 0.0 0.0 0.0 ; ...
              0.0 0.0 0.0 0.0 0.0 0.0 ; ...
              0.0 0.0 166.6667 0.0 0.0 0.0 ; ...
              0.0 0.0 0.0 0.0 0.0 0.0 ; ...
              0.0 0.0 0.0 0.0 0.0 0.0 ; ...
              0.0 0.0 0.0 0.0 0.0 50.0 ] ;
          
    C_out = [ 166.6667 66.6667 66.6667 0.0 0.0 0.0 ; ...
              66.6667 166.6667 66.6667 0.0 0.0 0.0 ; ...
              66.6667 66.6667 166.6667 0.0 0.0 0.0 ; ...
              0.0 0.0 0.0 50.0 0.0 0.0 ; ...
              0.0 0.0 0.0 0.0 50.0 0.0 ; ...
              0.0 0.0 0.0 0.0 0.0 50.0 ];          
          
    assertElementsAlmostEqual(MS_expand(C_in, 'cubic'), C_out);
    assertElementsAlmostEqual(MS_expand(C_in, 'auto'), C_out);
    
end

function test_MS_expand_hexagonal

    C_in = [ 153.6000         0   76.0444         0         0         0 ; ...
                    0         0         0         0         0         0 ; ...
                    0         0  128.0000         0         0         0 ; ...
                    0         0         0   32.0000         0         0 ; ...
                    0         0         0         0         0         0 ; ...
                    0         0         0         0         0   38.4000 ] ;

    C_out= [ 153.6000   76.8000   76.0444         0         0         0 ; ...
              76.8000  153.6000   76.0444         0         0         0 ; ...
              76.0444   76.0444  128.0000         0         0         0 ; ...
                    0         0         0   32.0000         0         0 ; ...
                    0         0         0         0   32.0000         0 ; ...
                    0         0         0         0         0   38.4000 ] ;
          
    assertElementsAlmostEqual(MS_expand(C_in, 'hex'), C_out);
    assertElementsAlmostEqual(MS_expand(C_in, 'vti'), C_out);
    assertElementsAlmostEqual(MS_expand(C_in, 'auto'), C_out);
    
end

function test_MS_expand_orthorhombic

    C_in = [ 153.6000   76.8200   76.0444         0         0         0 ; ...
                    0  155.6000   76.1444         0         0         0 ; ...
                    0         0  128.1000         0         0         0 ; ...
                    0         0         0   32.1000         0         0 ; ...
                    0         0         0         0   32.0000         0 ; ...
                    0         0         0         0         0   38.4000 ] ;

    C_out= [ 153.6000   76.8200   76.0444         0         0         0 ; ...
              76.8200  155.6000   76.1444         0         0         0 ; ...
              76.0444   76.1444  128.1000         0         0         0 ; ...
                    0         0         0   32.1000         0         0 ; ...
                    0         0         0         0   32.0000         0 ; ...
                    0         0         0         0         0   38.4000 ] ;
          
    assertElementsAlmostEqual(MS_expand(C_in, 'ortho'), C_out);
    assertElementsAlmostEqual(MS_expand(C_in, 'orthorhombic'), C_out);
    assertElementsAlmostEqual(MS_expand(C_in, 'auto'), C_out);
    
end

function test_MS_expand_errors



    C_in = 'elastic';
    f = @()MS_expand(C_in, 'auto');
    assertExceptionThrown(f, 'MS:CHECKCNotNumeric')
    
    C_in = [  166.6667 0.0 66.6667 0.0 0.0 0.0 ; ...
              0.0 0.0 0.0 0.0 0.0 0.0 ; ...
              0.0 0.0 166.6667 0.0 0.0 0.0 ; ...
              0.0 0.0 0.0 50.0 0.0 0.0 ; ...
              0.0 0.0 0.0 0.0 0.0 50.0 ];
    f = @()MS_expand(C_in, 'auto');
    assertExceptionThrown(f, 'MS:CHECKCnot6x6')
    
    C_in = [  166.6667 0.0 66.6667 0.0 0.0 0.0 ; ...
              0.0 0.0 0.0 0.0 0.0 0.0 ; ...
              0.0 0.0 166.6667 0.0 0.0 0.0 ; ...
              0.0 0.0 0.0 50.0 40.0 -2.0 ; ...
              0.0 0.0 0.0 0.0 0.0 0.0 ; ...
              0.0 0.0 0.0 0.0 0.0 50.0 ]; 
    f = @()MS_expand(C_in, 'bob');
    assertExceptionThrown(f, 'MS:EXPANDunsupportsymmetry')
    
    C_in = [  166.6667 0.0 66.6667 0.0 0.0 0.0 ; ...
              0.0 0.0 0.0 0.0 0.0 0.0 ; ...
              0.0 0.0 166.6667 0.0 0.0 0.0 ; ...
              0.0 0.0 0.0 50.0 40.0 -2.0 ; ...
              0.0 0.0 0.0 0.0 0.0 0.0 ; ...
              0.0 0.0 0.0 0.0 0.0 50.0 ]; 
    f = @()MS_expand(C_in, 'auto');
    assertExceptionThrown(f, 'MS:EXPANDnoautosym')
    
    C_in = [  0.0 0.0 0.0 0.0 0.0 0.0 ; ...
              0.0 0.0 0.0 0.0 0.0 0.0 ; ...
              0.0 0.0 166.6667 0.0 0.0 0.0 ; ...
              0.0 0.0 0.0 0.0 0.0 0.0 ; ...
              0.0 0.0 0.0 0.0 0.0 0.0 ; ...
              0.0 0.0 0.0 0.0 0.0 0.0 ];
    f = @()MS_expand(C_in, 'iso');
    assertExceptionThrown(f, 'MS:EXPANDbadiso')
    C_in = [  0.0 0.0 0.0 0.0 0.0 0.0 ; ...
              0.0 0.0 0.0 0.0 0.0 0.0 ; ...
              0.0 0.0 166.6667 0.0 0.0 0.0 ; ...
              0.0 0.0 0.0 0.0 0.0 0.0 ; ...
              0.0 0.0 0.0 0.0 0.0 50.0 ; ...
              0.0 0.0 0.0 0.0 0.0 0.0 ];
    f = @()MS_expand(C_in, 'iso');
    assertExceptionThrown(f, 'MS:EXPANDbadiso')
end


