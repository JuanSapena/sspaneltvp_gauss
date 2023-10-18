@echo off
rem *************************************************************************
rem ******* %1 is source drive, %2 is base subdirectory to install to *******
rem *************************************************************************
if not exist %1\chkargs.exe goto error
%1\chkargs %1 %2
if errorlevel 1 goto error
echo    **********************************************************************
echo                     Installing from %1 to %2
echo    **********************************************************************
rem ***** copying root to base
if not exist %1\*.* goto l1
if not exist %2\*.* md %2
copy %1\ %2\*.*
:l1
rem ***** copying \src to base\src
if not exist %1\src\*.* goto l2
if not exist %2\src\*.* md %2\src
copy %1\src\*.* %2\src\*.*
:l2
rem ***** copying \lib to base\lib
if not exist %1\lib\*.* goto l3
if not exist %2\lib\*.* md %2\lib
copy %1\lib\*.* %2\lib\*.*
:l3
rem ***** copying \examples to base\examples
if not exist %1\examples\*.* goto l4
if not exist %2\examples\*.* md %2\examples
copy %1\examples\*.* %2\examples\*.*
:l4
rem ***** copying \gxe to base\gxe
if not exist %1\gxe\*.* goto l5
if not exist %2\gxe\*.* md %2\gxe
copy %1\gxe\*.* %2\gxe\*.*
:l5
echo    **********************************************************************
echo                           Installation Complete
echo    **********************************************************************
goto done
:error
echo    **********************************************************************
echo    *                                                                    *
echo    *   Usage: ginstall source_drive target_path                         *
echo    *                                                                    *
echo    *      source_drive       Drive containing files to install          *
echo    *                         with colon included                        *
echo    *                                                                    *
echo    *                         For example:  A:                           *
echo    *                                                                    *
echo    *      target_path        Main drive and subdirectory to install     *
echo    *                         to without a final \                       *
echo    *                                                                    *
echo    *                         For example:  C:\GAUSS                     *
echo    *                                                                    *
echo    **********************************************************************
:done
