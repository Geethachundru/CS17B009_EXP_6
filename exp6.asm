.data
	s: .word 1
	i: .word 14         
	f: .word 805306368
.text
main:
	lw $s0,s
	lw $s1,i
	lw $s2,f
	add $s3,$s3,$32
	add $t0,$t0,$0
	add $t1,$t1,$1
	sll $t2,$t1,31
	add $t3,$t3,$0
loop1:
	slt $s4,$t0,$s3
	beq $s4,$t0,Exit
	and $s6,$t2,$t1
	sub $t6,$s3,$t1
	srl $s6,$s6,$t6
	beq $s6,$t0,loop2
	beq $s6,$t1,loop3
loop2:
	srl $t2,$t2,1
	sub $s3,$s3,$t1
	add $s7,$s3,$t0
	add $s8,$s3,$t0
	sub $s7,$s7,$t1
	sub $s8,$s8,$t1
	add $t4,$s8,$t0
	j loop1
loop3:
	slt $s4,$t0,$s7
	beq $s4,$t0,loop4
	sub $s7,$s7,$t1
	and $s6,$s1,$t1
	add $t3,$t3,$s6
	sll $t3,$t3,1
	srl $s1,$s1,1
	j loop3
loop4:
	slt $s4,$t0,$s8
	beq $s4,$t0,Exit
	srl $s2,$s2,1
	and $s5,$t3,1
	sll $s5,$s5,31
	add $s2,$s2,$s5
	srl $t3,$t3,1
	sub $s8,$s8,1
	j loop4
Exit:
	sw $s0,s
	sw $t4,i
	sw $s2,f
jr $ra
