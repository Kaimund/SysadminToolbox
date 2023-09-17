:: ResetAutodeskLicense.bat
:: Copyright (C) 2023 Kaimund
:: 
:: Use this script to reset the licensing information in Autodesk's AutoCAD and Revit versions 2017-2023
:: This will prompt the user to select a licensing mode when opening one of these apps
:: This can be useful when changing between network licenses and user licenses 

@echo off

net session >nul 2>&1
if not %errorLevel% == 0 (
    echo Sorry, you must run this file as an administrator.
    pause
    exit
)

if exist "C:\ProgramData\Autodesk\RVT 2023" (
    echo Resetting Revit 2023 licensing information...
    "%CommonProgramFiles(x86)%\Autodesk Shared\AdskLicensing\Current\helper\AdskLicensingInstHelper" change -pk 829O1 -pv 2023.0.0.F -lm ""
) else (
    echo Revit 2023 is not installed on this system.
)

if exist "C:\ProgramData\Autodesk\RVT 2022" (
    echo Resetting Revit 2022 licensing information...
    "%CommonProgramFiles(x86)%\Autodesk Shared\AdskLicensing\Current\helper\AdskLicensingInstHelper" change -pk 829N1 -pv 2022.0.0.F -lm ""
) else (
    echo Revit 2022 is not installed on this system.
)

if exist "C:\ProgramData\Autodesk\RVT 2021" (
    echo Resetting Revit 2021 licensing information...
    "%CommonProgramFiles(x86)%\Autodesk Shared\AdskLicensing\Current\helper\AdskLicensingInstHelper" change -pk 829M1 -pv 2021.0.0.F -lm ""
) else (
    echo Revit 2021 is not installed on this system.
)

if exist "C:\ProgramData\Autodesk\RVT 2020" (
    echo Resetting Revit 2020 licensing information...
    "%CommonProgramFiles(x86)%\Autodesk Shared\AdskLicensing\Current\helper\AdskLicensingInstHelper" change -pk 829L1 -pv 2020.0.0.F -lm ""
) else (
    echo Revit 2020 is not installed on this system.
)

if exist "C:\ProgramData\Autodesk\CLM\LGS\829K1_2019.0.0.F\LGS.data" (
    echo Resetting Revit 2019 licensing information...
    del C:\ProgramData\Autodesk\CLM\LGS\829K1_2019.0.0.F\LGS.data
) else (
    echo No existing licensing information for Revit 2019 was found on this system.
)

if exist "C:\ProgramData\Autodesk\CLM\LGS\829J1_2018.0.0.F\LGS.data" (
    echo Resetting Revit 2018 licensing information...
    del C:\ProgramData\Autodesk\CLM\LGS\829J1_2018.0.0.F\LGS.data
) else (
    echo No existing licensing information for Revit 2018 was found on this system.
)

if exist "C:\ProgramData\Autodesk\CLM\LGS\829I1_2017.0.0.F\LGS.data" (
    echo Resetting Revit 2017 licensing information...
    del C:\ProgramData\Autodesk\CLM\LGS\829I1_2017.0.0.F\LGS.data
) else (
    echo No existing licensing information for Revit 2017 was found on this system.
)

if exist "C:\ProgramData\Autodesk\AutoCAD 2023" (
    echo Resetting AutoCAD 2023 licensing information...
    "%CommonProgramFiles(x86)%\Autodesk Shared\AdskLicensing\Current\helper\AdskLicensingInstHelper" change -pk 001O1 -pv 2023.0.0.F -lm ""
) else (
    echo AutoCAD 2023 is not installed on this system.
)

if exist "C:\ProgramData\Autodesk\AutoCAD 2022" (
    echo Resetting AutoCAD 2022 licensing information...
    "%CommonProgramFiles(x86)%\Autodesk Shared\AdskLicensing\Current\helper\AdskLicensingInstHelper" change -pk 001N1 -pv 2022.0.0.F -lm ""
) else (
    echo AutoCAD 2022 is not installed on this system.
)

if exist "C:\ProgramData\Autodesk\AutoCAD 2021" (
    echo Resetting AutoCAD 2021 licensing information...
    "%CommonProgramFiles(x86)%\Autodesk Shared\AdskLicensing\Current\helper\AdskLicensingInstHelper" change -pk 001M1 -pv 2021.0.0.F -lm ""
) else (
    echo AutoCAD 2021 is not installed on this system.
)

if exist "C:\ProgramData\Autodesk\AutoCAD 2020" (
    echo Resetting AutoCAD 2020 licensing information...
    "%CommonProgramFiles(x86)%\Autodesk Shared\AdskLicensing\Current\helper\AdskLicensingInstHelper" change -pk 001L1 -pv 2020.0.0.F -lm ""
) else (
    echo AutoCAD 2020 is not installed on this system.
)

if exist "C:\ProgramData\Autodesk\CLM\LGS\001K1_2019.0.0.F\LGS.data" (
    echo Resetting AutoCAD 2019 licensing information...
    del C:\ProgramData\Autodesk\CLM\LGS\001K1_2019.0.0.F\LGS.data
) else (
    echo No existing licensing information for AutoCAD 2019 was found on this system.
)

if exist "C:\ProgramData\Autodesk\CLM\LGS\001J1_2018.0.0.F\LGS.data" (
    echo Resetting AutoCAD 2018 licensing information...
    del C:\ProgramData\Autodesk\CLM\LGS\001J1_2018.0.0.F\LGS.data
) else (
    echo No existing licensing information for AutoCAD 2018 was found on this system.
)

if exist "C:\ProgramData\Autodesk\CLM\LGS\001I1_2017.0.0.F\LGS.data" (
    echo Resetting AutoCAD 2017 licensing information...
    del C:\ProgramData\Autodesk\CLM\LGS\001I1_2017.0.0.F\LGS.data
) else (
    echo No existing licensing information for AutoCAD 2017 was found on this system.
)

echo -----------------------------------------------
echo The licensing information for your Autodesk products versions 2017-2023 have been reset.
echo The next time you open your product, please sign in with your Autodesk account to activate.
pause