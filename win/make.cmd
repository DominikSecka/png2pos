rem Install Microsoft VC C++ Build Tools
rem Run VC Desktop Prompt
rem cd to png2pos
rem run win\build.cmd

del *.obj win\png2pos.res

cl png2pos.c deps\lodepng\lodepng.cpp win\wingetopt.c /c /TC /Ideps\lodepng /Iwin /utf-8 /MT /Ox /W3 /GS /wd4996 /DLODEPNG_NO_COMPILE_ANCILLARY_CHUNKS /DDLODEPNG_NO_COMPILE_CPP /DDLODEPNG_NO_COMPILE_ALLOCATORS /DDLODEPNG_NO_COMPILE_ENCODER
rc /r win\png2pos.rc
link png2pos.obj lodepng.obj wingetopt.obj win\png2pos.res /RELEASE /OUT:png2pos.exe
