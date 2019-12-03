%use clear all as this also clears dependencies to the .mex files and thus
%they can be overwritten
clear all
    
mex -g -Lsource\NumericalIntegration\NumericalIntegration\x64\release\ -lNumericalIntegration ...
       -Isource\NumericalIntegration\NumericalIntegration\x64\release\ ...   
       -Lsource\DemagField\DemagField\x64\release\ -lDemagField...
       -Isource\DemagField\DemagField\x64\release\ ...
       -Lsource\TileDemagTensor\TileDemagTensor\x64\release\ -lTileDemagTensor ...
       -Isource\TileDemagTensor\TileDemagTensor\x64\release\ ...    
       -Lsource\MagTenseFortranCuda\x64\release\ -lMagTenseFortranCuda ...
       -Isource\MagTenseFortranCuda\x64\release\ ...   
       '-Lc:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v10.2\lib\x64\' -lcublas ...
       '-Lc:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v10.2\lib\x64\' -lcudart_static ...
       '-Lc:\Program Files (x86)\IntelSWTools\compilers_and_libraries_2019\windows\mkl\lib\intel64_win\' -lmkl_intel_lp64 ...
       '-Lc:\Program Files (x86)\IntelSWTools\compilers_and_libraries_2019\windows\mkl\lib\intel64_win\' -lmkl_blas95_lp64 ...
       '-Ic:\Program Files (x86)\IntelSWTools\compilers_and_libraries_2019\windows\mkl\include\' ...
       -Lsource\MagTenseMicroMag\x64\release\ -lMagTenseMicroMag ...
       -Isource\MagTenseMicroMag\x64\release\ ...            
    source\MagTenseMEX\MagTenseMEX\MagTenseLandauLifshitzSolver_mex.f90 COMPFLAGS="$COMPFLAGS /O3 /extend_source:132 /real_size:64 /fpe:0" -R2018a

movefile MagTenseLandauLifshitzSolver_mex.mexw64 matlab\MEX_files\MagTenseLandauLifshitzSolver_mex.mexw64
movefile MagTenseLandauLifshitzSolver_mex.mexw64.pdb matlab\MEX_files\MagTenseLandauLifshitzSolver_mex.mexw64.pdb

mex -g -Lsource\DemagField\DemagField\x64\release\ -lDemagField...
       -Isource\DemagField\DemagField\x64\release\ ...
       -Lsource\NumericalIntegration\NumericalIntegration\x64\release\ -lNumericalIntegration ...
       -Isource\NumericalIntegration\NumericalIntegration\x64\release\ ...
       -Lsource\TileDemagTensor\TileDemagTensor\x64\release\ -lTileDemagTensor ...
       -Isource\TileDemagTensor\TileDemagTensor\x64\release\ ...        
    source\MagTenseMEX\MagTenseMEX\IterateMagnetization_mex.f90 COMPFLAGS="$COMPFLAGS /O3 /extend_source:132 /real_size:64 /fpe:0" -R2018a

movefile IterateMagnetization_mex.mexw64 matlab\MEX_files\IterateMagnetization_mex.mexw64
movefile IterateMagnetization_mex.mexw64.pdb matlab\MEX_files\IterateMagnetization_mex.mexw64.pdb
        
mex -g -Lsource\DemagField\DemagField\x64\release\ -lDemagField...
       -Isource\DemagField\DemagField\x64\release\ ...
       -Lsource\NumericalIntegration\NumericalIntegration\x64\release\ -lNumericalIntegration ...
       -Isource\NumericalIntegration\NumericalIntegration\x64\release\ ...
       -Lsource\TileDemagTensor\TileDemagTensor\x64\release\ -lTileDemagTensor ...
       -Isource\TileDemagTensor\TileDemagTensor\x64\release\ ...    
    
    source\MagTenseMEX\MagTenseMEX\getHFromTiles_mex.f90 COMPFLAGS="$COMPFLAGS /O3 /extend_source:132 /real_size:64  /fpe:0" -R2018a

movefile getHFromTiles_mex.mexw64 matlab\MEX_files\getHFromTiles_mex.mexw64
movefile getHFromTiles_mex.mexw64.pdb matlab\MEX_files\getHFromTiles_mex.mexw64.pdb

mex -g -Lsource\DemagField\DemagField\x64\release\ -lDemagField...
       -Isource\DemagField\DemagField\x64\release\ ...
       -Lsource\NumericalIntegration\NumericalIntegration\x64\release\ -lNumericalIntegration ...
       -Isource\NumericalIntegration\NumericalIntegration\x64\release\ ...
       -Lsource\TileDemagTensor\TileDemagTensor\x64\release\ -lTileDemagTensor ...
       -Isource\TileDemagTensor\TileDemagTensor\x64\release\ ...        
    
    source\MagTenseMEX\MagTenseMEX\getNFromTile_mex.f90 COMPFLAGS="$COMPFLAGS /O3 /extend_source:132 /real_size:64  /fpe:0" -R2018a

movefile getNFromTile_mex.mexw64 matlab\MEX_files\getNFromTile_mex.mexw64
movefile getNFromTile_mex.mexw64.pdb matlab\MEX_files\getNFromTile_mex.mexw64.pdb

mex -g -Lsource\MagneticForceIntegrator\MagneticForceIntegrator\x64\release\ -lMagneticForceIntegrator...
       -Isource\MagneticForceIntegrator\MagneticForceIntegrator\x64\release\ ...
       -Lsource\DemagField\DemagField\x64\release\ -lDemagField...
       -Isource\DemagField\DemagField\x64\release\ ...
       -Lsource\NumericalIntegration\NumericalIntegration\x64\release\ -lNumericalIntegration ...
       -Isource\NumericalIntegration\NumericalIntegration\x64\release\ ...
       -Lsource\TileDemagTensor\TileDemagTensor\x64\release\ -lTileDemagTensor ...
       -Isource\TileDemagTensor\TileDemagTensor\x64\release\ ...                
    source\MagTenseMEX\MagTenseMEX\getMagForce_mex.f90 COMPFLAGS="$COMPFLAGS /O2 /Qopenmp /extend_source:132 /real_size:64  /fpe:0" -R2018a

movefile getMagForce_mex.mexw64 matlab\MEX_files\getMagForce_mex.mexw64
movefile getMagForce_mex.mexw64.pdb matlab\MEX_files\getMagForce_mex.mexw64.pdb
