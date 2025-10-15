@echo off
echo ====================================
echo Visual Product Matcher Setup
echo ====================================
echo.

REM Step 1: Creating virtual environment
echo Step 1: Creating virtual environment...
python -m venv venv
if %errorlevel% neq 0 (
    echo Error: Failed to create virtual environment
    pause
    exit /b 1
)
echo Virtual environment created successfully!
echo.

REM Step 2: Activating virtual environment
echo Step 2: Activating virtual environment...
call venv\Scripts\activate.bat
echo.

REM Step 3: Installing dependencies
echo Step 3: Installing dependencies...
pip install -r requirements.txt
if %errorlevel% neq 0 (
    echo Error: Failed to install dependencies
    pause
    exit /b 1
)
echo Dependencies installed successfully!
echo.

REM Step 4: Checking for .env file
echo Step 4: Checking for .env file...
if not exist .env (
    echo .env file not found. Creating from .env.example...
    copy .env.example .env
    echo.
    echo IMPORTANT: Please edit .env file and add your GEMINI_API_KEY
    echo Get your API key from: https://makersuite.google.com/app/apikey
    echo.
    notepad .env
)
echo.

echo ====================================
echo Setup Complete!
echo ====================================
echo.
echo To start the application:
echo   1. Make sure you've added your GEMINI_API_KEY to .env
echo   2. Activate the virtual environment: venv\Scripts\activate
echo   3. Run: python app.py
echo   4. Open http://localhost:5000 in your browser
echo.
echo Press any key to exit...
pause >nul
