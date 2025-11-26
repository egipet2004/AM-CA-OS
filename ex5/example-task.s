_EXIT = 	1 
_READ	=	3  
_WRITE	=	4  
_OPEN	=	5  
_CLOSE	=	6  
_CREAT	=	8  
_LSEEK	=	19 
_GETCHAR =	117	! five system subroutine numbers  
_SPRINTF =	121  
_PUTCHAR =	122  
_SSCANF =	125 
_PRINTF	=	127 
STDIN	=	0	! three initially opened file descriptors 
STDOUT	=	1 
STDERR	=	2
.SECT   .TEXT

	PUSH	0600
        PUSH    file_name
	PUSH	_CREAT			! create file, file descriptor in AX
	SYS
	ADD 	SP, 6
	CMP AX, -1
	JZ	ERROR	

	PUSH	AX
	PUSH 	_CLOSE
	SYS
		
        ADD     SP, 4
        PUSH    0
        PUSH    _EXIT
        SYS
ERROR:		

        PUSH    str_error
        PUSH    _PRINTF         ! AX fmt _PRINTF
        SYS
        ADD     SP, 4
        PUSH    0
        PUSH    _EXIT
        SYS

.SECT   .DATA
file_name:    .ASCIZ  "./test1.dat"
str_error:    .ASCIZ  "Error.  File ./test1.dat is not created \n"	

.SECT   .BSS