@echo off


REM change monitor layout
"C:\Program Files (x86)\MonitorProfileSwitcher/MonitorSwitcher.exe" -load:"C:\Users\johan\AppData\Roaming\MonitorSwitcher\Profiles\TV.xml"

REM Change audio output to TV
nircmd setdefaultsounddevice "Beyond TV" 1

REM start steam in big picture mode
echo "Starting steam..."
start steam://open/bigpicture