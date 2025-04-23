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
    LDR R0,=SRC
    MOV R1, #3         
    MOV R3, #0            
LOOP
    LSL R3, #4     
    LDRB R2, [R0,R1]      
    ADD R3, R2       
    SUBS R1,#1        
	BPL LOOP
	LDR R0,=DST
	STRH R3,[R0]
STOP B STOP   

SRC DCD 0X04030201
    AREA data, DATA, READWRITE
		
DST DCD 0
			
  END
