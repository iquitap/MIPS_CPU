@echo off
set xv_path=G:\\vivado\\Vivado\\2015.2\\bin
call %xv_path%/xsim all_tb_behav -key {Behavioral:sim_1:Functional:all_tb} -tclbatch all_tb.tcl -view C:/Users/zhou/Desktop/cpu/main_tb_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
