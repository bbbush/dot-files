set HOME=c:\Users\byuan
set PATH=%PATH%;c:\cygwin\Opt\bin;c:\cygwin\Opt\texlive\2013\bin\win32;
set EXE=runemacs.exe
set BIN_FOLDER=c:\cygwin\Opt\emacs-w64-24.4\bin
set EMACS=%BIN_FOLDER%\%EXE%
cd "%HOME%"
"%EMACS%" --load=%HOME%\.emacs.d\init.el %1
