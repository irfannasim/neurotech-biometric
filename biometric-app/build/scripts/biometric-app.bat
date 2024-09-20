@rem
@rem Copyright 2015 the original author or authors.
@rem
@rem Licensed under the Apache License, Version 2.0 (the "License");
@rem you may not use this file except in compliance with the License.
@rem You may obtain a copy of the License at
@rem
@rem      https://www.apache.org/licenses/LICENSE-2.0
@rem
@rem Unless required by applicable law or agreed to in writing, software
@rem distributed under the License is distributed on an "AS IS" BASIS,
@rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@rem See the License for the specific language governing permissions and
@rem limitations under the License.
@rem

@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  biometric-app startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Resolve any "." and ".." in APP_HOME to make it shorter.
for %%i in ("%APP_HOME%") do set APP_HOME=%%~fi

@rem Add default JVM options here. You can also use JAVA_OPTS and BIOMETRIC_APP_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto init

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto init

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:init
@rem Get command-line arguments, handling Windows variants

if not "%OS%" == "Windows_NT" goto win9xME_args

:win9xME_args
@rem Slurp the command line arguments.
set CMD_LINE_ARGS=
set _SKIP=2

:win9xME_args_slurp
if "x%~1" == "x" goto execute

set CMD_LINE_ARGS=%*

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\biometric-app.jar;%APP_HOME%\lib\spark-core-2.9.3.jar;%APP_HOME%\lib\gson-2.10.1.jar;%APP_HOME%\lib\jetty-webapp-9.4.48.v20220622.jar;%APP_HOME%\lib\websocket-server-9.4.31.v20200723.jar;%APP_HOME%\lib\jetty-servlet-9.4.48.v20220622.jar;%APP_HOME%\lib\jetty-security-9.4.48.v20220622.jar;%APP_HOME%\lib\jetty-server-9.4.48.v20220622.jar;%APP_HOME%\lib\websocket-servlet-9.4.31.v20200723.jar;%APP_HOME%\lib\javax.servlet-api-4.0.1.jar;%APP_HOME%\lib\slf4j-simple-1.7.36.jar;%APP_HOME%\lib\slf4j-api-1.7.36.jar;%APP_HOME%\lib\websocket-client-9.4.31.v20200723.jar;%APP_HOME%\lib\jetty-client-9.4.31.v20200723.jar;%APP_HOME%\lib\jetty-http-9.4.48.v20220622.jar;%APP_HOME%\lib\websocket-common-9.4.31.v20200723.jar;%APP_HOME%\lib\jetty-io-9.4.48.v20220622.jar;%APP_HOME%\lib\jetty-util-ajax-9.4.48.v20220622.jar;%APP_HOME%\lib\jetty-xml-9.4.48.v20220622.jar;%APP_HOME%\lib\jetty-util-9.4.48.v20220622.jar;%APP_HOME%\lib\samples-utils.jar;%APP_HOME%\lib\neurotec-core.jar;%APP_HOME%\lib\neurotec-licensing.jar;%APP_HOME%\lib\neurotec-gui.jar;%APP_HOME%\lib\neurotec-media.jar;%APP_HOME%\lib\neurotec-media-processing.jar;%APP_HOME%\lib\neurotec-biometrics.jar;%APP_HOME%\lib\neurotec-biometrics-client.jar;%APP_HOME%\lib\neurotec-biometrics-gui.jar;%APP_HOME%\lib\neurotec-devices.jar;%APP_HOME%\lib\jna.jar;%APP_HOME%\lib\flatlaf-3.0.jar;%APP_HOME%\lib\commons-io-2.4.jar;%APP_HOME%\lib\websocket-api-9.4.31.v20200723.jar

@rem Execute biometric-app
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %BIOMETRIC_APP_OPTS%  -classpath "%CLASSPATH%" com.neurotec.samples.SimpleFingersApplication %CMD_LINE_ARGS%

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
rem Set variable BIOMETRIC_APP_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
if  not "" == "%BIOMETRIC_APP_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
