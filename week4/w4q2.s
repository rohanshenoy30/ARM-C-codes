	AREA RESET, DATA, READONLY
	EXPORT __Vectors

__Vectors
	DCD 0x40001000 ; stack pointer value when stack is empty
	DCD Reset_Handler
	ALIGN
	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	LDR R0, =SRC
	LDR R1, [R0]
	MOV R2, #0
	MOV R3, #1
	MOV R5, #0xA
Loop
	AND R4, R1, #0xF
	LSR R1, #4
	MLA R2, R4, R3, R2
	MUL R3, R5
	CMP R1, #0
	BNE Loop
	LDR R0, =DST
	STR R2, [R0]
STOP B STOP
SRC DCD 0x00000281
	AREA data, DATA, READWRITE
DST DCD 0
	END