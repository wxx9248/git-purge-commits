@ECHO OFF
SETLOCAL

FOR /F %%i IN ('git config --get remote.origin.url') DO SET REPOADDR=%%i

IF $%REPOADDR%$==$$ (
	ECHO Not a git repository or remote URL does not exist: %CD%
	GOTO EXIT
)

:PURGE
DEL /F /S /Q /A .git

git init
git add .
git commit -m "Commits purged"

git remote add origin %REPOADDR%
git push -u --force origin master

:EXIT
ENDLOCAL
