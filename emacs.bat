set HOME=%UserProfile%
set PATH=%PATH%;%ProgramFiles(Opt)%\texlive\2013\bin\win32;
set EXE=runemacs.exe
set BIN_FOLDER=%ProgramFiles(Opt)%\emacs-w64-24.5\bin
set EMACS=%BIN_FOLDER%\%EXE%
cd "%HOME%"
"%EMACS%" --load=%HOME%\.emacs.d\init.el %1
