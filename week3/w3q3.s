	AREA	RESET, DATA, READONLY
	EXPORT __Vectors
__Vectors
	DCD 0X10001000
	DCD Reset_Handler
	ALIGN
	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	LDR R0,=OP1
	LDR R1,[R0]		;dividend
	LDR R0,=OP2
	LDR R2,[R0]		;divisor
	MOV R3,#0	;	quotient

LOOP
	CMP R1,R2
	BLO STORE
	SUB R1,R2
	ADD R3,#1
	B LOOP
	
STORE
	LDR R0, =QUO
	STR R3,[R0]
	LDR R0, =REM
	STR R1, [R0]
STOP B STOP
OP1 DCD 0x43
OP2 DCD 0x10
	AREA mydata, DATA, READWRITE
QUO DCD 0
REM DCD 0
	
	END