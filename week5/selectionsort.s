	AREA RESET, DATA, READONLY
	EXPORT __Vectors
__Vectors 
	DCD 0x10001000 
	DCD Reset_Handler 
	ALIGN
	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	LDR R0, =ARR
	MOV R1, #0 
	ADD R7, R0, #36 
	MOV R9, #10
loop	
	STR R9, [R0], #4
	SUBS R9, #1
	BNE loop
	LDR R0, =ARR
loopI	
		LDR R3, [R0]
		MOV R4, R0
		MOV R6, R0

loopJ	
		ADD R6, #4
		CMP R6, R7
		BGT exitloopJ
		LDR R5, [R6]
		CMP R5, R3
		BGT skip
		MOV R3, R5
		MOV R4, R6 
skip	
		B loopJ
exitloopJ	
		LDR R8, [R0]	
		STR R3, [R0]
		STR R8, [R4]
		ADD R0, #4
		CMP R0, R7
		BEQ STOP
		B loopI
STOP B STOP
	AREA mydata, DATA, READWRITE
ARR DCD 1
	END