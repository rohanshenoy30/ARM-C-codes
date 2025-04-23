	AREA RESET, DATA, READONLY
    EXPORT __Vectors
__Vectors
    DCD 0x40001000
    DCD Reset_Handler
    ALIGN
    AREA mycode, CODE, READONLY
    ENTRY
	EXPORT Reset_Handler
Reset_Handler
    LDR R0,=N
	LDR R1,[R0]
	LDR R0,=RES
	BL FACT
	STR R1,[R0]
STOP B STOP
	
FACT
	PUSH {R1,LR}
	CMP R1, #1
	BLE BASE
	SUB R1,#1
	BL FACT

BASE
	POP {R2,LR}
	MUL R1,R2
	BX LR

N   DCD 5                                ;// Initialize N with a value (e.g., 5 for factorial of 5).
	AREA mydata, DATA, READWRITE        ; // Define a read-write data section.
RES DCD 0                               ; // Define space for storing the result (RES).
    END