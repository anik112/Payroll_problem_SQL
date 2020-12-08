@echo off
for /f "tokens=1-4 delims=/ " %%i in ("%date%") do (
     set dow=%%i
     set month=%%j
     set day=%%k
     set year=%%l
)
set datr=%day%%month%%year%
set num=%random% %%100
D:\oracle\product\10.2.0\db_1\bin\exp.exe payroll/payroll@payroll file=D:\DataBackup\%datr%%num%.dmp grants=Y rows=Y & exit