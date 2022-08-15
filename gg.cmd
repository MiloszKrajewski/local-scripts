@echo off

setlocal

set FOLDER=%~dpn0.resources
set COMMAND=%~1
set ARGS=

if "%COMMAND%"=="" (
	echo.No command given - requires corresponding file in "%FOLDER%"
	goto :error
)

:collect
if not "%2"=="" (
	set ARGS=%ARGS% %2
	shift /2
	goto :collect
)

if exist "%FOLDER%\%COMMAND%.py" goto :py
if exist "%FOLDER%\%COMMAND%.csx" goto :csx
if exist "%FOLDER%\%COMMAND%.fsx" goto :fsx
if exist "%FOLDER%\%COMMAND%.ps1" goto :ps1
if exist "%FOLDER%\%COMMAND%.cmd" goto :cmd
if exist "%FOLDER%\%COMMAND%.dotnet" goto :dotnet

echo.Command handler "%COMMAND%" could not be found in "%FOLDER%"
goto :error

:exec
echo.^@ %CD%
echo.^> %*
%*
exit /b

:py
call :exec py "%FOLDER%\%COMMAND%.py" %ARGS%
goto :done

:csx
call :exec dotnet script "%FOLDER%\%COMMAND%.csx" -- %ARGS%
goto :done

:fsx
call :exec dotnet fsi "%FOLDER%\%COMMAND%.fsx" %ARGS%
goto :done

:ps1
call :exec pwsh -f "%FOLDER%\%COMMAND%.ps1" %ARGS%
goto :done

:cmd
call :exec cmd /c "%FOLDER%\%COMMAND%.cmd" %ARGS%
goto :done

:dotnet
call :exec dotnet run --project "%FOLDER%\%COMMAND%.dotnet" -- %ARGS%
goto :done

:error
endlocal
exit /b 1

:done
endlocal
