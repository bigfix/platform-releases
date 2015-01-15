@echo off

if "%1" == "html" (
	vagrant up && vagrant ssh --command "/ohana/dev/generate_html.sh"
	if errorlevel 1 exit /b 1
	goto end
)

if "%1" == "sums" (
	vagrant up && vagrant ssh --command "/ohana/dev/calculate_sums.sh"
	if errorlevel 1 exit /b 1
	goto end
)

if "%1" == "clean" (
	vagrant destroy --force
	if errorlevel 1 exit /b 1
	goto end
)

:end
