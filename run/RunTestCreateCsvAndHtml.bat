cd..

set CUR_YYYY=%date:~10,4%
set CUR_MM=%date:~7,2%
set CUR_DD=%date:~4,2%
set CUR_HH=%time:~0,2%
if %CUR_HH% lss 10 (set CUR_HH=0%time:~1,1%)
set CUR_NN=%time:~3,2%
set CUR_SS=%time:~6,2%
set CUR_MS=%time:~9,2%

set CURRENTDATETIME=%CUR_YYYY%%CUR_MM%%CUR_DD%_%CUR_HH%%CUR_NN%%CUR_SS%
set RESULTSFOLDERNAME=results_%CURRENTDATETIME%

mkdir %RESULTSFOLDERNAME%

cd..
jmeter -n -t jmeter-selenium\scripts\TrueClientTests.jmx -l jmeter-selenium\%RESULTSFOLDERNAME%\TestOutput.csv -e -o jmeter-selenium\%RESULTSFOLDERNAME%\html\