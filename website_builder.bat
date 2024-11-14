@echo off
cls

:: Welcome message
echo Welcome to the Terminal Website Builder!
echo.

:: Get the website title from the user
set /p title=Enter the website title: 

:: Create a directory for the website using the title name
mkdir "%title%"
cd "%title%"

:: Create the index.html file
echo ^<!DOCTYPE html^> > index.html
echo ^<html lang="en"^> >> index.html
echo ^<head^> >> index.html
echo     ^<meta charset="UTF-8"^> >> index.html
echo     ^<meta name="viewport" content="width=device-width, initial-scale=1.0"^> >> index.html
echo     ^<title^>%title%^</title^> >> index.html
echo     ^<link rel="stylesheet" href="style.css"^> >> index.html
echo ^</head^> >> index.html
echo ^<body^> >> index.html
echo     ^<h1^>%title%^</h1^> >> index.html

:: Get sections for the HTML
:sections
set /p section=Enter a section name (or press Enter to finish): 
if "%section%"=="" goto create_js
echo     ^<section^> >> index.html
echo         ^<h2^>%section%^</h2^> >> index.html
echo         ^<p^>This is the %section% section.^</p^> >> index.html
echo     ^</section^> >> index.html
goto sections

:: Create the style.css file
echo body { > style.css
echo     font-family: Arial, sans-serif; >> style.css
echo     background-color: #f0f0f0; >> style.css
echo     color: #333; >> style.css
echo     text-align: center; >> style.css
echo } >> style.css
echo. >> style.css
echo h1 { >> style.css
echo     color: #0066cc; >> style.css
echo     margin-top: 20px; >> style.css
echo } >> style.css
echo. >> style.css
echo section { >> style.css
echo     margin: 20px; >> style.css
echo     padding: 20px; >> style.css
echo     border: 1px solid #ddd; >> style.css
echo     background-color: #fff; >> style.css
echo } >> style.css

:: Create the script.js file
echo console.log('Welcome to the website!'); > script.js

:: Completion message
echo Website '%title%' created successfully!
echo Check the '%title%' folder for the files: index.html, style.css, and script.js.
pause
exit
