#############################################################
#中断演示程序，简单走马灯测试，按下1号键用数字1循环移位测试
#中断演示程序，简单走马灯测试，按下2号键用数字2循环移位测试
#最右侧显示数据是循环计数
#这只是中断服务程序演示程序，方便大家检查中断嵌套，
#设计时需要考虑开中断，关中断，设置中断屏蔽字如何用软件指令实现，如何保护现场，中断隐指令需要多少周期
#############################################################
.text

#关中断
sw $s1,0($sp)
addi $s1,$zero,1
mtc0 $s1,$31
lw $s1,0($sp)
#保护现场
sw $zero,0($sp)
sw $at,4($sp)
sw $v0,8($sp)
sw $v1,12($sp)
sw $a0,16($sp)
sw $a1,20($sp)
sw $a2,24($sp)
sw $a3,28($sp)
sw $t0,32($sp)
sw $t1,36($sp)
sw $t2,40($sp)
sw $t3,44($sp)
sw $t4,48($sp)
sw $t5,52($sp)
sw $t6,56($sp)
sw $t7,60($sp)
sw $s0,64($sp)
sw $s1,68($sp)
sw $s2,72($sp)
sw $s3,76($sp)
sw $s4,80($sp)
sw $s5,84($sp)
sw $s6,88($sp)
sw $s7,92($sp)
sw $t8,96($sp)
sw $t9,100($sp)
sw $k0,104($sp)
sw $k1,108($sp)
sw $gp,112($sp)
sw $sp,116($sp)
sw $fp,120($sp)
sw $ra,124($sp)
mfc0 $k0, $18
sw $k0,128($sp)
addi $sp, $sp, 132
#开中断
mtc0 $zero,$31	

addi $s6,$zero,1       #中断号1,2,3   不同终端号显示值不一样

addi $s4,$zero,6      #循环次数初始值  
addi $s5,$zero,1       #计数器累加值
###################################################################
#                逻辑左移，每次移位4位 
# 显示区域依次显示0x00000016 0x00000106 0x00001006 0x00010006 ... 10000006  00000006 依次循环6次
###################################################################
IntLoop:
add $s0,$zero,$s6   

IntLeftShift:       


sll $s0, $s0, 4  
or $s3,$s0,$s4
add    $a0,$0,$s3       #display $s0
addi   $v0,$0,34         # display hex
syscall                 # we are out of here.   

bne $s0, $zero, IntLeftShift
sub $s4,$s4,$s5      #循环次数递减
bne $s4, $zero, IntLoop

addi   $v0,$zero,10         # system call for exit

#关中断
addi $s1,$zero,1
mtc0 $s1,$31	
#恢复现场
addi $sp, $sp, -132
lw $k0,128($sp)
mtc0 $k0, $18
lw $zero,0($sp)
lw $at,4($sp)
lw $v0,8($sp)
lw $v1,12($sp)
lw $a0,16($sp)
lw $a1,20($sp)
lw $a2,24($sp)
lw $a3,28($sp)
lw $t0,32($sp)
lw $t1,36($sp)
lw $t2,40($sp)
lw $t3,44($sp)
lw $t4,48($sp)
lw $t5,52($sp)
lw $t6,56($sp)
lw $t7,60($sp)
lw $s0,64($sp)
lw $s1,68($sp)
lw $s2,72($sp)
lw $s3,76($sp)
lw $s4,80($sp)
lw $s5,84($sp)
lw $s6,88($sp)
lw $s7,92($sp)
lw $t8,96($sp)
lw $t9,100($sp)
lw $k0,104($sp)
lw $k1,108($sp)
lw $gp,112($sp)
lw $sp,116($sp)
lw $fp,120($sp)
lw $ra,124($sp)

#开中断
mtc0 $zero,$31		

eret				#中断返回	


