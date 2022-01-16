@echo off
cd %~p0
IF NOT EXIST "d3vilTemp0" md d3vilTemp0
cd %~p0\d3vilTemp0
del *.txt
del sed*
set /p id=Id utilisateur : 
curl "https://blablaland.fun/member/%id%" > profil%id%.txt
seed -i -e "s/>//g" profil%id%.txt
seed -i -e "s/<//g" profil%id%.txt
seed -i -e "s/|//g" profil%id%.txt
seed -i -e "s/\"//g" profil%id%.txt
seed -i -e "s/=//g" profil%id%.txt
cls
ugrep -iF ",rencontre,jeu,tchatter,virtuel" profil%id%.txt > 2profil%id%.txt
:aa
set /p str=< 2profil%id%.txt
set "result=%str:,=" & set "result=%"
seed -i -e "s/,%result%//g" 2profil%id%.txt
set /p str=< 2profil%id%.txt
set "result=%str:,=" & set "result=%"
seed -i -e "s/,%result%//g" 2profil%id%.txt
echo %result%
pause>Nul
goto aa