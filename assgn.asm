.model small
.stack 100
.data
;newline
newline DB 10,13,'$'

;Login session
enter_password DB 10,13,"Enter Password: $"
password DB "abcd1234$"
user_password DB 15,?, 15 DUP('$')
login_count DB 0
invalid_password DB 10,13,"Invalid Password. Please Try Again $"
terminate DB 10,13,"User Authentication Failed. $"
success DB 10,13,"Access granted $"

;Menu session
line1 DB 10,13,"		--------------------		$"
line2 DB 10,13,"		 TAR PAYROLL SYSTEM			$"
menu_options DB 10,13, "1. Employee Details", 10,13,"2. Earnings", 10,13,"3. Overtime", 10,13,"4. Deductions", 10,13,"5. Employer Contributions", 10,13,"6. PaySlip", 10,13,"7. Logout",10,13, '$'
enter_selection DB 10,13,"Enter Selection: $"
invalid_selection_msg DB 10,13,"Invalid selection, please try again: $"
reenter_prompt DB 10,13,"Do you want to reenter? (Y for yes / Any key for no): $"
continue_prompt DB 10,13,"Back to Main Menu? (Y for yes / Any key for EXITING PROGRAM): $"
exit_message DB 10,13,"Exiting the program. Goodbye! $"

;Employee Detail session
promptName db "Enter name: $"
    promptEmpID db "Enter Employee ID (format:2WXXX | example:2W345) : $"
    promptDept db "Enter Department No (1-3): $"
    promptMonth db "Enter the Month (1-12): $"  
    employee_details1 DB "| 1 | Employee Details                                   |", 10, 13,'$' 
    employee_details6 DB "| 1 | Employee Details      |$" 
    choices_of_department1 DB "+----------+$" 
    choices_of_department DB "|Department|$"
    employee_details2 DB "|   Name                             |  ", '$'
    employee_details3 DB "|   Employee ID                      |  ", '$'
    employee_details4 DB "|   Department                       |  ", '$'    
    employee_details5 DB "|   Month                            |  ", '$' 
    error_id_length db "ID length must have 5 digit or character.",'$'
    error_id_format db "ID format must be (2WXXX)",'$'
    error_id_format2 db "(For the XXX in (2WXXX) must be number.)",'$'
    invalidNameMsg db "Please enter valid name format (NO NUMBERS AND SYMBOLS).",10,13,'$'
    serviceDept db "Service Dept.","$"
    salesDept  db "Sales Dept.","$"
    officeDept db "Office Dept.","$"  
    serviceDeptDisplay db "|1|Service Department",'$'
    salesDeptDisplay  db "|2|Sales Department",'$'
    officeDeptDisplay db "|3|Office Department",'$'
    invalid_selection_of_department DB 10,13,"Invalid selection.$"
    invalid_month DB 10,13,"Invalid month.$"
    empID db 10,?, 10 dup('$')         ; Reserve space for employee ID (max 10 chars)
    empName db 30,?, 30 dup('$')          ; Reserve space for name input (max 30 chars)
    dept db 20 dup('$')          ; Reserve space for department input (max 20 chars)
    month db 10,?,10 dup('$')         ; Reserve space for month input (max 10 chars)   

	
;Earnings session
exponent DW 1,10,100,1000,10000
earnings_header1 db 10,13,218, 15 DUP(196), 191, '$'
earnings_header2 db 10,13,179,"2 ", 179, " Earnings   ",179,'$'
earnings_header3 db 10,13,192, 15 DUP(196), 217, '$'
enter_basic_salary db 10,13,"Enter Basic Salary (FORMAT XXXXX.XX): $"
enter_allowances db 10,13, "Enter Allowances (FORMAT XXXXX.XX): $"
enter_bonuses db 10,13,"Enter Bonuses (FORMAT XXXXX.XX): $"
invalid_length_error db 10,13,"Please fill in 8 characters",10,13,"$"
invalid_format_error db 10,13,"Invalid format / no of characters. Please Try again",10,13,"$"
basic_salary db 10,?,10 DUP('$')
allowance db 10,?,10 DUP('$')
bonuses db 10,?,10 DUP('$')
total_earning_integral DW 0
total_earning_decimal DW 0
total_earning_string DB "00000.00$"
earning_out_of_range DB 10,13,"Total Earnings out of range (>65535.99). Calculation unavailable $"
earnings_table_line1 DB "+--------------------------------------------------------+", 10, 13,'$'
earnings_table_line2 DB "| 2 | Earnings                                           |", 10, 13,'$'      
earnings_table_line3 DB "+--------------------------------------------------------+", 10, 13,'$'
earnings_table_line4 DB "|   Basic Salary                     |   ", '$'
earnings_table_line5 DB "|   Allowances                       |   ", '$'
earnings_table_line6 DB "|   Bonuses                          |   ", '$'
earnings_table_line7 DB "|   Total Earning (MAX:65535.99)     |   ", '$' 
earnings_table_line8 DB 10,13,"+--------------------------------------------------------+", 10, 13, '$'

;Deduction session
deduction_header1 db 10,13,218, 15 DUP(196), 191, '$'
deduction_header2 db 10,13,179,"4 ", 179, " Deduction  ",179,'$'
deduction_header3 db 10,13,192, 15 DUP(196), 217, '$'
enter_employee_socso db 10,13,"Enter Employee SOCSO (FORMAT XXXXX.XX): $"
enter_income_tax db 10,13, "Enter Employee Income Tax Deduction (FORMAT XXXXX.XX): $"
employee_socso db 10,?,10 DUP('$')
income_tax db 10,?,10 DUP('$')
employee_epf_string dB "00000.00$"
employee_epf_integral DW 0
employee_epf_decimal DW 0
employee_epf_temp DW 0
employee_epf_3dp DB "00$"
employee_epf_34dp_temp DW 0
employee_epf_before_roundup_string DB "00000.00$"
total_deduction_integral DW 0
total_deduction_decimal DW 0
total_deduction_string DB "00000.00$"
deduction_out_of_range DB 10,13,"Total Deductions out of range (>65535.99). Calculation unavailable $"
deduction_table_line1 DB 10,13,"+---+-------------------------------------------------------------------+", 10, 13, '$' 
deduction_table_line2 DB "| 4 | Deduction                                                         |", 10, 13, '$'        
deduction_table_line3 DB "+---+-------------------------------------------------------------------+", 10, 13, '$'
deduction_table_line4_1 DB "|   Employee EPF (11% of basic salary: $"
deduction_table_line4_2 DB ")    |   ",'$'
deduction_table_line4_3 DB "|   Employee EPF Round OFF                          |   ",'$'
deduction_table_line5 DB "|   Employee SOCSO                                  |   ", '$'
deduction_table_line6 DB "|   Employee Income Tax Deduction                   |   ", '$'
deduction_table_line7 DB "|   Total Deduction                                 |   ", '$' 
deduction_table_line8 DB 10,13,"+-----------------------------------------------------------------------+", 10, 13, '$'

;Employer Contribution session
empContribution_table_line2 DB "| 5 | Employer Contributions|",'$'      
enterSocso db 10,13,"Enter SOCSO (FORMAT XXXXX.XX): $"                                           
enterEis db 10,13,"Enter EIS (FORMAT XXXXX.XX): $"    
Socso db 10,?,10 DUP('$')
Eis db 10,?,10 DUP('$')                                                                 
employer_Contribution_Display DB "| 5 | Employer Contributions                                            |$" 
epf_contribution_display DB "|   Employer EPF ROUND OFF                         |   ",'$'    
epf_contribution_display2_1 DB "|   Employer EPF (12% of basic salary: $"
epf_contribution_display2_2 DB ")   |   ",'$'
Socso_Display DB "|   Employer SOCSO                                 |   ", '$'
Eis_Display DB "|   EIS                                            |   ", '$'  
employer_epf_integral DW 0
employer_epf_decimal DW 0 
employer_epf_temp DW 0 
employer_epf_string dB "00000.00$"
employer_epf_before_roundup_string DB "00000.00$"
employer_epf_34dp_temp DW 0
employer_epf_3dp DB "00$"

;Display
displayLine1 DB 10,13,"+---------------------------+$"

;Overtime session
total_work_hour dw 195 
msgRate1_5 db 10,13,'Enter OT RATE 1.5 (Work Hours: FORMAT XXX.XX):','$'
msgRate2_0 db 10,13,'Enter OT RATE 2.0 (Work Hours: FORMAT XXX.XX):','$'
msgRate3_0 db 10,13,'Enter OT RATE 3.0 (Work Hours: FORMAT XXX.XX):','$'

overtime_1_5_hours db 8,?,8 DUP('$')
;for 1_5 divide 2 add original
overtime_2_0_hours db 8,?,8 DUP('$')
overtime_3_0_hours db 8,?,8 DUP('$')
basic_decimal dw 0
basic_integral dw 0
hourly_integral dw 0
hourly_decimal dw 0
hourly_string db "00000.00$"

overtime_exponent DW 1,10,100
overtime_1_5_hour_integral dw 0
overtime_1_5_hour_decimal dw 0
ot_1_5_hourly_rate_integral dw 0
ot_1_5_hourly_rate_decimal dw 0
overtime_1_5_hourly_rate_string db "00000.00$"
ot_1_5_hours_amount_decimal dw 0
ot_1_5_hours_amount_integral dw 0
overtime_1_5_hours_amount_string db "00000.00$"

overtime_2_hour_integral dw 0
overtime_2_hour_decimal dw 0
overtime_2_hourly_rate_integral dw 0
overtime_2_hourly_rate_decimal dw 0
overtime_2_hourly_rate_string db "00000.00$"
ot_2_hours_amount_decimal dw 0
ot_2_hours_amount_integral dw 0
overtime_2_hours_amount_string db "00000.00$"

overtime_3_hour_integral dw 0
overtime_3_hour_decimal dw 0
overtime_3_hourly_rate_integral dw 0
overtime_3_hourly_rate_decimal dw 0
overtime_3_hourly_rate_string db "00000.00$"
ot_3_hours_amount_decimal dw 0
ot_3_hours_amount_integral dw 0
overtime_3_hours_amount_string db "00000.00$"
total_ot_integral dw 0
total_ot_decimal dw 0
total_ot_string db "00000.00$"
total_ot_hours dw 0

invalid_length_error_overtime db 10,13,"Please fill in 6 characters (XXX.XX)",10,13,"$"
invalid_format_error_overtime db 10,13,"Invalid format / no of characters. Please Try again",10,13,"$"
exceed_max_ot_hours_error db 10,13,"Exceeded Maximum OT Hours (105). Please Try Again$."
ot_out_of_range DB 10,13,"Total Overtime Amount out of range (>65535.99). Calculation unavailable $"

overtime_table_line1 DB "+--------------------------------------------------------------+", 10, 13,'$'
overtime_table_line2 DB "| 3 | Overtime                                                 |", 10, 13,'$'      
overtime_table_line3 DB "+--------------------------------------------------------------+", 10, 13,'$'
overtime_table_line4 DB "|OVERTIME	HOURLY RATE	HOURS	AMOUNT 	          ", 10, 13,'$'
overtime_table_line5 DB "|OT RATE 1.5 ",'$'
overtime_table_line6 DB 10,13,"|OT RATE 2.0 ",'$'
overtime_table_line7 DB 10,13,"|OT RATE 3.0 ",'$'
overtime_table_line7_1 DB 10,13,"(Basic Hourly Rate: $"
overtime_table_line7_2 DB ")$"
overtime_table_line8 DB 10,13,"|Total OT Pay (MAX:65535.99) |          ", '$' 
overtime_table_line9 DB 10,13,"+--------------------------------------------------------------+", 10, 13, '$'
overtime_data_gap DB "	$"

;Payslip session
	displayLine5555 db 10,13,"Name: ",'$'
	displayLine5111 db "   Employee ID: ",'$'
	displayLine5222 db "   Department: ",'$'
	displayLine1333 db "   Month: ",'$'
	displayLine4 db 10,13,"--------------------------------------------------------------------------------$"
	displayLine4_1 db "		EARNING					DEDUCTION$"
	displayLine5 db "Basic Salary		",'$'
	displayLine51 db 10,13,"Allowance		",'$'
	displayLine52 db 10,13,"Bonuses			",'$'
	displayLine13 db 10,13,"Total Earning		",'$'
	displayLine24 db "	Employee EPF		",'$'
	displayLine241 db "	Employee SOCSO		",'$'
	displayLine242 db "	Income Tax Deduction	",'$'
	displayLine243 db "	Total Deduction		",'$'
	displayLine6 db "OVERTIME	HOURLY RATE     HOURS   AMOUNT		EMPLOYER CONTRIBUTIONS$"
	displayLine121 db "OT RATE 1.5	",'$'
	displayLine122 db 10,13,"OT RATE 2.0	",'$'
	displayLine123 db 10,13,"OT RATE 3.0	",'$'
	displayLine124 db 10,13,"TOTAL OVERTIME				",'$'  
	displayLine290 db "	EPF	",'$'
    displayLine29 db "	SOCSO	",'$'
    displayLine30 DB "	EIS	",'$'
	data_gap db "	$"
	payslip_error_abbreviation db 10,13,"MAXIMUM VALUE: 65535.99 | EMV: EXCEED MAXIMUM VALUE / RNV: RETURN NEGATIVE VALUE",'$'

	displayLine7 db "EARNING		OVERTIME	GROSS PAY	DEDUCTION	NET PAY$"
	total_gross_pay_integral DW 0
	total_gross_pay_decimal DW 0
	total_gross_pay_string DB "00000.00$"
	gross_pay_out_of_range DB 10,13,"(>65535.99).",'$'
	total_net_pay_integral DW 0
	total_net_pay_decimal DW 0
	total_net_pay_string DB "00000.00$"
	
.code
LOGIN_SESS PROC

	login:
	MOV AH,09H
	LEA DX,enter_password
	INT 21H
	
	MOV AH,0AH
	LEA DX,user_password
	INT 21H
	
	XOR BX,BX
	MOV BL,user_password[1]
	MOV user_password[BX+2],'$'

	; Check if password length is 8
	CMP user_password[1], 8
	JNE invalid
	
	; Compare passwords
	MOV SI, 2              ; Start after length byte
	MOV DI, OFFSET password

compare_loop:
	MOV AL, user_password[SI] ;compare character by character
	CMP AL, [DI]
	JNE invalid
	INC SI
	INC DI
	CMP AL, '$'            ; Check if end of string
	JE success_login
	JMP compare_loop

invalid:
	INC login_count
	MOV AH,09H
	LEA DX,invalid_password
	INT 21H
	CMP login_count, 3     ; Allow 3 attempts
	JE terminate_sess
	JMP login

success_login:
	MOV AH,09H
	LEA DX,success
	INT 21H
	RET

terminate_sess:
	MOV AH,09H
	LEA DX,terminate
	INT 21H
	JMP exit_program
	

LOGIN_SESS ENDP

MENU_SESS PROC
	MOV AH,09H
	LEA DX,line1
	INT 21H
	
	MOV AH,09H
	LEA DX,line2
	INT 21H
	
	MOV AH,09H
	LEA DX,line1
	INT 21H

	;Display menu items
	MOV AH, 09H
	LEA DX, menu_options
	INT 21H

	;Prompt user for selection
	MOV AH, 09H
	LEA DX, enter_selection
	INT 21H
	
	RET
	
MENU_SESS ENDP

EMP_DETAIL_F PROC 
    mov ah,09h
	lea dx,newline
	int 21h
    
    LEA DX,displayLine1  ;Display line 
	mov ah, 09h           ; Function to display string
    int 21h               ; DOS interrupt to display string
    
	LEA DX, newline
    mov ah, 09h           ; Function to display string
    int 21h               ; DOS interrupt to display string
    
	LEA DX,employee_details6 
	mov ah, 09h           ; Function to display string
    int 21h               ; DOS interrupt to display string
    
	LEA DX,displayLine1 ;Display line 
	mov ah, 09h           ; Function to display string
    int 21h               ; DOS interrupt to display string
    
	LEA DX, newline
	mov ah, 09h           ; Function to display string
    int 21h               ; DOS interrupt to display string
    
    get_name:
    ; Prompt and input name 
    mov ah, 09h
    lea dx, promptName
    int 21h

    mov ah, 0Ah             ; DOS function to input a string
    lea dx, empName
    int 21h
	
    XOR BX,BX
    MOV BL, empName[1]
    MOV empName[BX+2], '$'
	
	MOV SI,2
	XOR CX,CX
	MOV CL,empName[1]
	
	validate_name:
	CMP empName[SI],' '
	JNE check_before_bigA
	JMP loop_name_validation
	
	check_before_bigA:
	CMP empName[SI], 'A'
	JB name_error
	JMP check_after_bigZ

	check_after_bigZ:
	CMP empName[SI], 'Z'
	JA check_before_a
	JMP loop_name_validation
	
	check_before_a:
	CMP empName[SI], 'a'
	JB name_error
	JMP check_after_z
	
	check_after_z:
	CMP empName[SI], 'z'
	JA name_error
	JMP loop_name_validation

	loop_name_validation:
	INC SI
	LOOP validate_name
	JMP Continue_To_Employee_Id
	
	name_error:
	MOV AH,09H
	LEA DX,newline
	INT 21H
	
	MOV AH,09H
	LEA DX,invalidNameMsg
	INT 21H
	
	JMP get_name
	
Continue_To_Employee_Id:
    xor si,si
    mov si,2	
	mov ah,09h
	lea dx,newline
	int 21h
	  
    mov ah, 09h
    lea dx, promptEmpID
    int 21h

    mov ah, 0Ah
    lea dx, empID
    int 21h

    XOR BX,BX
    MOV BL, empID[1]
    MOV empID[BX+2], '$' 
    
    cmp bl,5
    jne error_length_of_id 
    
    cmp empID[si],'2'
    jne error_format_of_id 
     
    inc si 
     
    cmp empID[si],'W'
    jne error_format_of_id
	je	correct_format_id
	
    error_length_of_id:    
	mov ah,09h
	lea dx,newline
	int 21h
    ; Display error message for invalid name input
    mov ah, 09h
    lea dx, error_id_length
    int 21h   
    
    mov ah,09h
	lea dx,newline
	int 21h
	
    jmp Continue_To_Employee_Id           ; Re-prompt for the name
     
	error_format_of_id:
	mov ah,09h
	lea dx,newline
	int 21h
    ; Display error message for invalid  id
    mov ah, 09h
    lea dx, error_id_format
    int 21h   
    
    mov ah,09h
	lea dx,newline
	int 21h
	
    jmp Continue_To_Employee_Id           ; Re-prompt for the name   
	
	correct_format_id:
    mov cx,3
    mov di,4 
	
	emp_id_number:	
    cmp empID[di],'0'
    jb error_format_of_id1     ; If AL is less than '0', jump to error
	JMP number_above_zero

	number_above_zero:
    cmp empID[di], '9'         ; Compare AL with '9' (ASCII 39h)
    ja error_format_of_id1     ; If AL is greater than '9', jump to error
	JMP continue_chencking_XXX
    
	error_format_of_id1:
	mov ah,09h
	lea dx,newline
	int 21h
    ; Display error message for invalid id
    mov ah, 09h
    lea dx, error_id_format2  
    int 21h   
    
    mov ah,09h
	lea dx,newline
	int 21h
	
    jmp Continue_To_Employee_Id           ; Re-prompt for id 
	
	continue_chencking_XXX:
	
    inc di  
    
    loop emp_id_number
    
    mov ah,09h
	lea dx,newline
	int 21h   
	   
    mov ah, 09h
    lea dx, choices_of_department1
    int 21h  
	
	mov ah,09h
	lea dx,newline
	int 21h   
	
    mov ah, 09h
    lea dx, choices_of_department
    int 21h
    
    mov ah,09h
	lea dx,newline
	int 21h   
	    
    mov ah, 09h
    lea dx, choices_of_department1
    int 21h
    
    mov ah, 09h
    lea dx, displayLine1
    int 21h 
    
    mov ah,09h
	lea dx,newline
	int 21h   
    
    mov ah, 09h
    lea dx, serviceDeptDisplay
    int 21h 
    
    mov ah, 09h
    lea dx, displayLine1
    int 21h 
    
    mov ah,09h
	lea dx,newline
	int 21h   
	
    mov ah, 09h
    lea dx, salesDeptDisplay
    int 21h     
   
    mov ah, 09h
    lea dx, displayLine1
    int 21h 
    
    mov ah,09h
	lea dx,newline
	int 21h
	
    mov ah, 09h
    lea dx, officeDeptDisplay
    int 21h  
	
    mov ah, 09h
    lea dx, displayLine1
    int 21h 
      
	mov ah,09h
	lea dx,newline
	int 21h
	
    ; Prompt and input department 
    input_department:
    mov ah, 09h
    lea dx, promptDept
    int 21h

    mov ah, 01h
    ;lea dx, dept
    int 21h
    
    CMP AL, '1'
    JB invalid_choice
    CMP AL, '3'
    JA invalid_choice
	
    cmp al, '1'
    je service_dept
    cmp al, '2'
    je sales_dept
    cmp al, '3'
    je office_dept
	
	invalid_choice:
	MOV AH, 09H
	LEA DX, invalid_selection_of_department
	INT 21H 
	
	mov ah,09h
	lea dx,newline
	int 21h
	
	JMP input_department 
     
    service_dept:
    lea si, serviceDept         ; Load address of "Service Department" into SI
    lea di, dept        ; Load address of selectedDept variable into DI
    call save_dept              ; Call routine to copy the department name
    jmp enter_month           ; Jump to next section after selection
     
    sales_dept:
    lea si, salesDept         ; Load address of "Service Department" into SI
    lea di, dept        ; Load address of selectedDept variable into DI
    call save_dept              ; Call routine to copy the department name
    jmp enter_month           ; Jump to next section after selection
     
    office_dept:
    lea si, officeDept         ; Load address of "Service Department" into SI
    lea di, dept        ; Load address of selectedDept variable into DI
    call save_dept              ; Call routine to copy the department name
	jmp enter_month           ; Jump to next section after selection
	
		save_dept: 
	  mov cx,50    
	  copy_dept_loop:
	  mov al,[si]
	  mov [di],al   
	  cmp al, '$'                 ; Check for end of string  
	  je copy_done 
	  inc si
	  inc di
	  loop copy_dept_loop   
	copy_done:
	ret
	
    enter_month:
    mov ah,09h
	lea dx,newline
	int 21h   
	
    ; Prompt and input month
    mov ah, 09h
    lea dx, promptMonth
    int 21h
    
    mov ah, 0Ah
    lea dx, month
    int 21h
	
	cmp month[1],2
	ja invalid_entered_month 
	
	cmp month[1],0
	je  invalid_entered_month
	
	cmp month[1],2
	je  more_than_nine_months
	
	cmp month[1],1
	je  less_than_ten_months
    
    more_than_nine_months:	
	CMP month[2], '1'
    Jne invalid_entered_month
	CMP month[3], '2'
    ja invalid_entered_month
	cmp month[3],'0'
	jb invalid_entered_month
	jmp valid_month
	
	less_than_ten_months:
	CMP month[2], '1'
    JB invalid_entered_month
	cmp month[2],'9'
	ja invalid_entered_month
	jmp valid_month
    
	invalid_entered_month:
	MOV AH, 09H
	LEA DX, invalid_month
	INT 21H
	JMP enter_month 
	
	mov ah,09h
	lea dx,newline
	int 21h
	
	valid_month:
;print result
	mov ah,09h
	lea dx,newline
	int 21h
	
	MOV AH, 09H
	LEA DX, earnings_table_line1
	INT 21H

	MOV AH, 09H
	LEA DX, employee_details1
	INT 21H

	MOV AH, 09H
	LEA DX, earnings_table_line3
	INT 21H

	MOV AH, 09H							;Display  name
	LEA DX, employee_details2
	INT 21H
	
	LEA DX,[empName + 2]  ; Print the employee name
    MOV AH,9
    INT 21H
	
	MOV AH, 09H
	LEA DX, newline
	INT 21H
	
	MOV AH, 09H							;Display employee id
	LEA DX, employee_details3
	INT 21H
	
	LEA DX,[empID + 2]  
    MOV AH,9
    INT 21H

	MOV AH, 09H
	LEA DX, newline
	INT 21H
	
	MOV AH, 09H							;Display department
	LEA DX, employee_details4
	INT 21H
	
	LEA DX,dept  ; Print the department
    MOV AH,9
    INT 21H 
    
    MOV AH, 09H
	LEA DX, newline
	INT 21H
    
    MOV AH, 09H							;Display month
	LEA DX, employee_details5
	INT 21H
	
    LEA DX,[month + 2]  ; Print the digit entered
    MOV AH,9
    INT 21H 
    
    MOV AH, 09H
	LEA DX, newline
	INT 21H
    
    MOV AH, 09H
	LEA DX, earnings_table_line1
	INT 21H
	
	RET  

EMP_DETAIL_F ENDP

EARNINGS_F PROC
	earning_process_start:
	LEA DX,earnings_header1  ;Display header line 1
	MOV AH,09
	INT 21H

	LEA DX,earnings_header2 ;Display header line 2
	MOV AH,09
	INT 21H

	LEA DX,earnings_header3 ;Display header line 3
	MOV AH,09
	INT 21H
	
	input_basic_salary:
		LEA DX,enter_basic_salary				;Prompt and capture Basic Salary
		MOV AH,09
		INT 21H
		
		MOV AH,0AH
		LEA DX,basic_salary						
		INT 21H
		
		XOR BX,BX
		MOV BL,basic_salary[1]
		MOV basic_salary[BX+2], '$'
		
		CMP basic_salary[1],8					;if length != 8 characters
		JNE basic_salary_invalid_length 			;prompt invalid length error message
		CMP basic_salary[7],"."					;if index no 7 != '.'
		JNE basic_salary_invalid_format			;prompt invalid format
		JMP basic_salary_valid					;skip invalid label if format/length valid
	
	basic_salary_invalid_length:			;invalid length
		MOV AH,09H
		LEA DX,invalid_length_error
		INT 21H
		JMP input_basic_salary				;reenter basic salary
	basic_salary_invalid_format:
		MOV AH,09H
		LEA DX,invalid_format_error
		INT 21H
		JMP input_basic_salary
	basic_salary_valid:						;skip invalid label
	
	input_allowance:
		LEA DX,enter_allowances				; Prompt and capture Allowances
		MOV AH,09
		INT 21H

		MOV AH,0AH
		LEA DX,allowance
		INT 21H
		
		XOR BX,BX
		MOV BL,allowance[1]
		MOV allowance[BX+2], '$'
	
		CMP allowance[1],8					;if length != 8 characters
		JNE allowance_invalid_length 		;prompt invalid length error message
		CMP allowance[7],"."					;if index no 7 != '.'
		JNE allowance_invalid_format			;prompt invalid format
		JMP allowance_valid					;skip invalid label if format/length valid
	
	allowance_invalid_length:			;invalid length
		MOV AH,09H
		LEA DX,invalid_length_error
		INT 21H
		JMP input_allowance				;reenter basic salary
	allowance_invalid_format:
		MOV AH,09H
		LEA DX,invalid_format_error
		INT 21H
		JMP input_allowance
	allowance_valid:						;skip invalid label
	
	input_bonuses:
		LEA DX,enter_bonuses				;Prompt and capture Bonuses
		MOV AH,09
		INT 21H

		MOV AH,0AH
		LEA DX,bonuses
		INT 21H
		
		XOR BX,BX
		MOV BL,bonuses[1]
		MOV bonuses[BX+2], '$'
	
		CMP bonuses[1],8					;if length != 8 characters
		JNE bonuses_invalid_length 		;prompt invalid length error message
		CMP bonuses[7],"."					;if index no 7 != '.'
		JNE bonuses_invalid_format			;prompt invalid format
		JMP bonuses_valid					;skip invalid label if format/length valid
	
	bonuses_invalid_length:			;invalid length
		MOV AH,09H
		LEA DX,invalid_length_error
		INT 21H
		JMP input_bonuses				;reenter basic salary
	bonuses_invalid_format:
		MOV AH,09H
		LEA DX,invalid_format_error
		INT 21H
		JMP input_bonuses
	bonuses_valid:						;skip invalid label
	
	;Display the table
	MOV AH, 09H
	LEA DX, newline
	INT 21H
	
	MOV AH, 09H
	LEA DX, earnings_table_line1
	INT 21H

	MOV AH, 09H
	LEA DX, earnings_table_line2
	INT 21H

	MOV AH, 09H
	LEA DX, earnings_table_line3
	INT 21H

	MOV AH, 09H							;Display Basic Salary
	LEA DX, earnings_table_line4
	INT 21H
	
	MOV AH, 09H
	LEA DX, basic_salary[2]
	INT 21H
	
	MOV AH, 09H
	LEA DX, newline
	INT 21H
	
	MOV AH, 09H							;Display Allowance
	LEA DX, earnings_table_line5
	INT 21H
	
	MOV AH, 09H
	LEA DX, allowance[2]
	INT 21H

	MOV AH, 09H
	LEA DX, newline
	INT 21H
	
	MOV AH, 09H							;Display bonuses
	LEA DX, earnings_table_line6
	INT 21H
	
	MOV AH, 09H
	LEA DX, bonuses[2]
	INT 21H

	MOV AH, 09H
	LEA DX, newline
	INT 21H
	
	MOV AH, 09H
	LEA DX, earnings_table_line7
	INT 21H
	
	MOV CX,5
	MOV DI,2
	MOV SI,8
	MOV total_earning_integral,0
	calculate_total_earning_integral:
		XOR AX,AX
		MOV AL,basic_salary[DI]
		SUB AL,'0'
		MOV BX,exponent[SI]
		MUL BX
		JC earning_carry
		ADD total_earning_integral,AX
		JC earning_carry
		XOR AX,AX
		MOV AL,allowance[DI]
		SUB AL,'0'
		MOV BX,exponent[SI]
		MUL BX
		JC earning_carry
		ADD total_earning_integral,AX
		JC earning_carry
		XOR AX,AX
		MOV AL,bonuses[DI]
		SUB AL,'0'
		MOV BX,exponent[SI]
		MUL BX
		JC earning_carry
		ADD total_earning_integral,AX
		JC earning_carry
		INC DI
		SUB SI,2
		LOOP calculate_total_earning_integral
		JMP load_earning_data
		
	earning_carry:
		MOV AH,09H
		LEA DX,earning_out_of_range
		INT 21H
		MOV AH,09H
		LEA DX,earnings_table_line8
		INT 21H
		MOV AH, 09H           ; Display the reenter prompt
		LEA DX, reenter_prompt
		INT 21H
	
		XOR AX, AX 		;clear AX content
		MOV AH, 01H           ;Wait for a single character input
		INT 21H
	
		CMP AL, 'Y'           ;Compare input with 'Y'
		JE earning_input_restart   ;If 'Y', continue the program
		CMP AL, 'y'           ;Compare input with 'y'
		JE earning_input_restart   ;If 'y', continue the program
		JMP earning_end
		
	earning_input_restart:
		JMP earning_process_start
	
	load_earning_data:
		MOV CX,2
		MOV DI,8
		MOV SI,2 ;start from 10 in array (data word)
		MOV total_earning_decimal,0
	calculate_total_earning_decimal:
		XOR AX,AX
		MOV AL,basic_salary[DI]
		SUB AL,'0'
		MOV BX,exponent[SI]
		MUL BX
		ADD total_earning_decimal,AX
		XOR AX,AX
		MOV AL,allowance[DI]
		SUB AL,'0'
		MOV BX,exponent[SI]
		MUL BX
		ADD total_earning_decimal,AX
		XOR AX,AX
		MOV AL,bonuses[DI]
		SUB AL,'0'
		MOV BX,exponent[SI]
		MUL BX
		ADD total_earning_decimal,AX
		INC DI
		SUB SI,2
		LOOP calculate_total_earning_decimal
		
		check_decimal_greater_hundred:
			CMP total_earning_decimal, 100
			JAE integral_increment
			JMP earning_convertion
		
		integral_increment:
			INC total_earning_integral
			CMP total_earning_integral,0
			JE earning_carry_help
			SUB total_earning_decimal,100
			JMP check_decimal_greater_hundred
		
	earning_carry_help:
		JMP earning_carry
		
	earning_convertion:
		XOR AX,AX
		XOR DX,DX
		MOV CX,5
		MOV SI,4
		MOV AX,total_earning_integral
		
	earning_integral_to_string:
		XOR DX,DX
		DIV exponent[2]
		ADD DL,'0'
		MOV total_earning_string[SI],DL
		DEC SI
		LOOP earning_integral_to_string
		
	XOR AX,AX
	XOR DX,DX
	MOV CX,2
	MOV SI,7
	MOV AX,total_earning_decimal
	
	earning_decimal_to_string:
		XOR DX,DX
		DIV exponent[2]
		ADD DL,'0'
		MOV total_earning_string[SI],DL
		DEC SI
		LOOP earning_decimal_to_string
		
	MOV AH,09H
	LEA DX, total_earning_string
	INT 21H
	JMP earning_final_line
	
	earning_final_line:
	MOV AH, 09H
	LEA DX, earnings_table_line8
	INT 21H
	
	earning_end:
	RET
EARNINGS_F ENDP

OVERTIME_F PROC
	overtime_process_start:
	MOV total_ot_hours,0					;initialise all variable to zero if restart
	MOV overtime_1_5_hour_integral,0
	MOV overtime_1_5_hour_decimal,0
	MOV ot_1_5_hours_amount_decimal,0
	MOV ot_1_5_hours_amount_integral,0
	MOV ot_1_5_hourly_rate_integral,0
	MOV ot_1_5_hourly_rate_decimal,0
	MOV overtime_2_hour_integral,0
	MOV overtime_2_hour_decimal,0
	MOV ot_2_hours_amount_decimal,0
	MOV ot_2_hours_amount_integral,0
	MOV overtime_2_hourly_rate_integral,0
	MOV overtime_2_hourly_rate_decimal,0
	MOV ot_3_hours_amount_decimal,0
	MOV ot_3_hours_amount_integral,0
	MOV overtime_3_hourly_rate_integral,0
	MOV overtime_3_hourly_rate_decimal,0
	MOV overtime_3_hour_integral,0
	MOV overtime_3_hour_decimal,0
	MOV hourly_integral,0
	MOV hourly_decimal,0
	MOV CX,5
	MOV DI,2
	MOV SI,8
	MOV basic_integral,0
	calculate_basic_integral:
		XOR AX,AX
		MOV AL,basic_salary[DI]
		SUB AL,'0'
		MOV BX,exponent[SI]
		MUL BX
		ADD basic_integral,AX
		INC DI
		SUB SI,2
		LOOP calculate_basic_integral
	
		MOV CX,2
		MOV DI,8
		MOV SI,2 ;start from 10 in array (data word)
		MOV basic_decimal,0
	calculate_basic_decimal:
		XOR AX,AX
		MOV AL,basic_salary[DI]
		SUB AL,'0'
		MOV BX,exponent[SI]
		MUL BX
		ADD basic_decimal,AX
		INC DI
		SUB SI,2
		LOOP calculate_basic_decimal
		
		check_basic_decimal_greater_hundred:
			CMP basic_decimal, 100
			JAE basic_integral_increment
			JMP calculate_hourly_rate
		
		basic_integral_increment:
			INC basic_integral
			SUB basic_decimal,100
			JMP check_basic_decimal_greater_hundred
			
		
	calculate_hourly_rate:
		
		calculate_hourly_integral:		
		MOV AX, basic_integral
		DIV total_work_hour 
		
		MOV hourly_integral,AX
		
		MOV AX,DX
		MUL exponent[4]
		DIV total_work_hour
		ADD hourly_decimal, AX
		ADD DX,basic_decimal
		CMP DX,98
		JAE increment_hourly_decimal2
		JMP input_ot_hour_1_5
	
	increment_hourly_decimal2:
		INC hourly_decimal
	
	input_ot_hour_1_5:
		LEA DX,msgRate1_5
		MOV AH,09H
		INT 21H
		
		MOV AH,0AH	
		LEA DX,overtime_1_5_hours
		INT 21H
		
		XOR BX,BX
		MOV BL,overtime_1_5_hours[1]
		MOV overtime_1_5_hours[BX+2],'$'
		
		CMP overtime_1_5_hours[1],6
		JNE overtime_1_5_invalid_length
		CMP overtime_1_5_hours[5],"."
		JNE overtime_1_5_invalid_format
		JMP overtime_hour_1_5_valid
	
	overtime_1_5_invalid_length:
		MOV AH,09H
		LEA DX,invalid_length_error_overtime
		INT 21H
		JMP input_ot_hour_1_5
	
	overtime_1_5_invalid_format:
		MOV AH,09H
		LEA DX,invalid_format_error_overtime
		INT 21H
		JMP input_ot_hour_1_5
	
	overtime_hour_1_5_valid:
	;------------------------------
	input_ot_hour_2_0:
		LEA DX,msgRate2_0
		MOV AH,09H
		INT 21H
		
		MOV AH,0AH	
		LEA DX,overtime_2_0_hours
		INT 21H
		
		XOR BX,BX
		MOV BL,overtime_2_0_hours[1]
		MOV overtime_2_0_hours[BX+2],'$'
		
		CMP overtime_2_0_hours[1],6
		JNE overtime_2_0_invalid_length
		CMP overtime_2_0_hours[5],"."
		JNE overtime_2_0_invalid_format
		JMP overtime_hour_2_0_valid
	
	overtime_2_0_invalid_length:
		MOV AH,09H
		LEA DX,invalid_length_error_overtime
		INT 21H
		JMP input_ot_hour_2_0
	
	overtime_2_0_invalid_format:
		MOV AH,09H
		LEA DX,invalid_format_error_overtime
		INT 21H
		JMP input_ot_hour_2_0
	
	overtime_hour_2_0_valid:
	;--------------------------------------------
	input_ot_hour_3_0:
		LEA DX,msgRate3_0
		MOV AH,09H
		INT 21H
		
		MOV AH,0AH	
		LEA DX,overtime_3_0_hours
		INT 21H
		
		XOR BX,BX
		MOV BL,overtime_3_0_hours[1]
		MOV overtime_3_0_hours[BX+2],'$'
		
		CMP overtime_3_0_hours[1],6
		JNE overtime_3_0_invalid_length
		CMP overtime_3_0_hours[5],"."
		JNE overtime_3_0_invalid_format
		JMP overtime_hour_3_0_valid
	
	overtime_3_0_invalid_length:
		MOV AH,09H
		LEA DX,invalid_length_error_overtime
		INT 21H
		JMP input_ot_hour_3_0
	
	overtime_3_0_invalid_format:
		MOV AH,09H
		LEA DX,invalid_format_error_overtime
		INT 21H
		JMP input_ot_hour_3_0
	
	overtime_hour_3_0_valid:	
	;----------------------------------	
	MOV CX,3
	MOV SI, 2
	MOV DI, 4
	XOR AX,AX
	MOV overtime_2_hour_integral, 0
	
	calculate_2_hour_integral:
	MOV AL,overtime_2_0_hours[SI]
	SUB AX,'0'
	MUL overtime_exponent[DI]
	ADD overtime_2_hour_integral,AX
	INC SI
	SUB DI,2
	LOOP calculate_2_hour_integral
	
	MOV CX, 2
	MOV SI, 6
	MOV DI,2
	MOV AX,AX
	MOV overtime_2_hour_decimal, 0
	
	calculate_2_hour_decimal:
	MOV AL,overtime_2_0_hours[SI]
	SUB AX,'0'
	MUL overtime_exponent[DI]
	ADD overtime_2_hour_decimal,AX
	INC SI
	SUB DI,2
	LOOP calculate_2_hour_decimal
	
	calculate_2_hour_rate_integral:
	MOV AX,hourly_integral
	MOV BX,2
	MUL BX
	MOV overtime_2_hourly_rate_integral,AX
	
	calculate_2_hour_rate_decimal:
	MOV AX, hourly_decimal
	MUL BX
	MOV  overtime_2_hourly_rate_decimal,AX
	
	check_ot_2_hourly_rate_integral_increment:
	CMP overtime_2_hourly_rate_decimal,100
	JAE ot_2_hourly_rate_integral_increment
	JMP calculate_2_hour_amount_integral
	
	ot_2_hourly_rate_integral_increment:
	INC overtime_2_hourly_rate_integral
	SUB overtime_2_hourly_rate_decimal,100
	JMP check_ot_2_hourly_rate_integral_increment
	
	calculate_2_hour_amount_integral:
	MOV AX, overtime_2_hourly_rate_integral
	MUL overtime_2_hour_integral
	JC ot_carry_help1
	MOV ot_2_hours_amount_integral,AX
	MOV AX,overtime_2_hourly_rate_decimal
	MUL overtime_2_hour_integral
	MOV ot_2_hours_amount_decimal,AX
	JMP calculate_2_hour_amount_decimal
	
	ot_carry_help1:
	JMP ot_carry
	
	calculate_2_hour_amount_decimal:
	MOV AX, overtime_2_hourly_rate_integral
	MUL overtime_2_hour_decimal
	DIV overtime_exponent[4]
	ADD ot_2_hours_amount_integral,AX
	ADD ot_2_hours_amount_decimal,DX
	MOV AX, overtime_2_hourly_rate_decimal
	MUL overtime_2_hour_decimal
	DIV overtime_exponent[4]
	ADD ot_2_hours_amount_decimal,AX
	CMP DX,50
	JAE ot_2_hours_amount_decimal_increment
	JMP check_ot_2_hours_amount_integral_increment
	
	ot_2_hours_amount_decimal_increment:
	INC ot_2_hours_amount_decimal
	
	check_ot_2_hours_amount_integral_increment:
	CMP ot_2_hours_amount_decimal,100
	JAE ot_2_hours_amount_integral_increment
	JMP ot_2_hour_amount_convertion
	
	ot_2_hours_amount_integral_increment:
	INC ot_2_hours_amount_integral
	SUB ot_2_hours_amount_decimal,100
	JMP check_ot_2_hours_amount_integral_increment
	
	ot_2_hour_amount_convertion:
		XOR AX,AX
		XOR DX,DX
		MOV CX,5
		MOV SI,4
		MOV AX,ot_2_hours_amount_integral
		
	ot_2_hours_amount_integral_to_string:
		XOR DX,DX
		DIV exponent[2]
		ADD DL,'0'
		MOV overtime_2_hours_amount_string[SI],DL
		DEC SI
		LOOP ot_2_hours_amount_integral_to_string
		
	XOR AX,AX
	XOR DX,DX
	MOV CX,2
	MOV SI,7
	MOV AX,ot_2_hours_amount_decimal
	
	ot_2_hours_amount_decimal_to_string:
		XOR DX,DX
		DIV exponent[2]
		ADD DL,'0'
		MOV overtime_2_hours_amount_string[SI],DL
		DEC SI
		LOOP ot_2_hours_amount_decimal_to_string
	
	MOV CX,3
	MOV SI, 2
	MOV DI, 4
	XOR AX,AX
	MOV overtime_3_hour_integral, 0
	
	calculate_3_hour_integral:
	MOV AL,overtime_3_0_hours[SI]
	SUB AX,'0'
	MUL overtime_exponent[DI]
	ADD overtime_3_hour_integral,AX
	INC SI
	SUB DI,2
	LOOP calculate_3_hour_integral
	
	MOV CX, 2
	MOV SI, 6
	MOV DI, 2
	MOV AX,AX
	MOV overtime_3_hour_decimal, 0
	
	calculate_3_hour_decimal:
	MOV AL,overtime_3_0_hours[SI]
	SUB AX,'0'
	MUL overtime_exponent[DI]
	ADD overtime_3_hour_decimal,AX
	INC SI
	SUB DI,2
	LOOP calculate_3_hour_decimal
	
	calculate_3_hour_rate_integral:
	MOV AX,hourly_integral
	MOV BX,3
	MUL BX
	MOV overtime_3_hourly_rate_integral,AX
	
	calculate_3_hour_rate_decimal:
	MOV AX, hourly_decimal
	MUL BX
	MOV  overtime_3_hourly_rate_decimal,AX
	
	check_ot_3_hourly_rate_integral_increment:
	CMP overtime_3_hourly_rate_decimal,100
	JAE ot_3_hourly_rate_integral_increment
	JMP calculate_3_hour_amount_integral
	
	ot_3_hourly_rate_integral_increment:
	INC overtime_3_hourly_rate_integral
	SUB overtime_3_hourly_rate_decimal,100
	JMP check_ot_3_hourly_rate_integral_increment
	
	calculate_3_hour_amount_integral:
	MOV AX, overtime_3_hourly_rate_integral
	MUL overtime_3_hour_integral
	JC ot_carry_help
	MOV ot_3_hours_amount_integral,AX
	MOV AX,overtime_3_hourly_rate_decimal
	MUL overtime_3_hour_integral
	MOV ot_3_hours_amount_decimal,AX
	JMP calculate_3_hour_amount_decimal
	
	ot_carry_help:
	JMP ot_carry
	
	calculate_3_hour_amount_decimal:
	MOV AX, overtime_3_hourly_rate_integral
	MUL overtime_3_hour_decimal
	DIV overtime_exponent[4]
	ADD ot_3_hours_amount_integral,AX
	ADD ot_3_hours_amount_decimal,DX
	MOV AX, overtime_3_hourly_rate_decimal
	MUL overtime_3_hour_decimal
	DIV overtime_exponent[4]
	ADD ot_3_hours_amount_decimal,AX
	CMP DX,50
	JAE ot_3_hours_amount_decimal_increment
	JMP check_ot_3_hours_amount_integral_increment
	
	ot_3_hours_amount_decimal_increment:
	INC ot_3_hours_amount_decimal
	
	check_ot_3_hours_amount_integral_increment:
	CMP ot_3_hours_amount_decimal,100
	JAE ot_3_hours_amount_integral_increment
	JMP ot_3_hour_amount_convertion
	
	ot_3_hours_amount_integral_increment:
	INC ot_3_hours_amount_integral
	SUB ot_3_hours_amount_decimal,100
	JMP check_ot_3_hours_amount_integral_increment
	
	ot_3_hour_amount_convertion:
		XOR AX,AX
		XOR DX,DX
		MOV CX,5
		MOV SI,4
		MOV AX,ot_3_hours_amount_integral
		
	ot_3_hours_amount_integral_to_string:
		XOR DX,DX
		DIV exponent[2]
		ADD DL,'0'
		MOV overtime_3_hours_amount_string[SI],DL
		DEC SI
		LOOP ot_3_hours_amount_integral_to_string
		
	XOR AX,AX
	XOR DX,DX
	MOV CX,2
	MOV SI,7
	MOV AX,ot_3_hours_amount_decimal
	
	ot_3_hours_amount_decimal_to_string:
		XOR DX,DX
		DIV exponent[2]
		ADD DL,'0'
		MOV overtime_3_hours_amount_string[SI],DL
		DEC SI
		LOOP ot_3_hours_amount_decimal_to_string
;--------------------------------------------------------		
	MOV CX,3
	MOV SI,2
	MOV DI,4
	XOR AX,AX
	MOV overtime_1_5_hour_integral,0
	
	calculate_1_5_hour_integral:
	MOV AL,overtime_1_5_hours[SI]
	SUB AX,'0'
	MUL overtime_exponent[DI]
	ADD overtime_1_5_hour_integral,AX
	INC SI
	SUB DI,2
	LOOP calculate_1_5_hour_integral
	
	MOV CX, 2
	MOV SI, 6
	MOV DI, 2
	MOV AX,AX
	MOV overtime_1_5_hour_decimal, 0
	
	calculate_1_5_hour_decimal:
	MOV AL,overtime_1_5_hours[SI]
	SUB AX,'0'
	MUL overtime_exponent[DI]
	ADD overtime_1_5_hour_decimal,AX
	INC SI
	SUB DI,2
	LOOP calculate_1_5_hour_decimal	
	
	calculate_1_5_hour_rate_integral:
	MOV AX,hourly_integral 
	MOV BX,2
	DIV BX
	ADD ot_1_5_hourly_rate_integral,AX
	CMP DX,1
	JE ot_1_5_hourly_rate_decimal_add50
	JMP calculate_1_5_hour_rate_decimal

	ot_1_5_hourly_rate_decimal_add50:
	ADD ot_1_5_hourly_rate_decimal,50
	
	calculate_1_5_hour_rate_decimal:
	XOR AX,AX
	MOV AX,hourly_decimal 
	DIV BX
	MOV AH, 0		;bugs seems to popup here, have to manually move ah to 0
	ADD ot_1_5_hourly_rate_decimal,AX
	CMP DX,1
	JE ot_1_5_hourly_rate_decimal_increment
	JMP add_ori_with_half
	
	ot_1_5_hourly_rate_decimal_increment:
	INC ot_1_5_hourly_rate_decimal
	
	;add original rate to 0.5
	add_ori_with_half:
	MOV AX, hourly_integral
	MOV DX, hourly_decimal
	ADD ot_1_5_hourly_rate_integral, AX
	ADD ot_1_5_hourly_rate_decimal, DX 
	
	check_ot_1_5_hourly_rate_integral_increment:
	CMP ot_1_5_hourly_rate_decimal,100
	JAE ot_1_5_hourly_rate_integral_increment
	JMP calculate_1_5_hour_amount_integral
	
	ot_1_5_hourly_rate_integral_increment:
	INC ot_1_5_hourly_rate_integral
	SUB ot_1_5_hourly_rate_decimal,100
	JMP check_ot_1_5_hourly_rate_integral_increment
	
	calculate_1_5_hour_amount_integral:
	MOV AX, ot_1_5_hourly_rate_integral
	MUL overtime_1_5_hour_integral
	MOV ot_1_5_hours_amount_integral,AX
	MOV AX,ot_1_5_hourly_rate_decimal
	MUL overtime_1_5_hour_integral
	MOV ot_1_5_hours_amount_decimal,AX
	
	calculate_1_5_hour_amount_decimal:
	MOV AX, ot_1_5_hourly_rate_integral
	MUL overtime_1_5_hour_decimal
	DIV overtime_exponent[4]
	ADD ot_1_5_hours_amount_integral,AX
	ADD ot_1_5_hours_amount_decimal,DX
	MOV AX, ot_1_5_hourly_rate_decimal
	MUL overtime_1_5_hour_decimal
	DIV overtime_exponent[4]
	ADD ot_1_5_hours_amount_decimal,AX
	CMP DX,50
	JAE ot_1_5_hours_amount_decimal_increment
	JMP check_ot_1_5_hours_amount_integral_increment
		
	ot_1_5_hours_amount_decimal_increment:
	INC ot_1_5_hours_amount_decimal
	
	check_ot_1_5_hours_amount_integral_increment:
	CMP ot_1_5_hours_amount_decimal,100
	JAE ot_1_5_hours_amount_integral_increment
	JMP ot_1_5_hour_amount_convertion
	
	ot_1_5_hours_amount_integral_increment:
	INC ot_1_5_hours_amount_integral
	SUB ot_1_5_hours_amount_decimal,100
	JMP check_ot_1_5_hours_amount_integral_increment
	
	ot_1_5_hour_amount_convertion:
		XOR AX,AX
		XOR DX,DX
		MOV CX,5
		MOV SI,4
		MOV AX,ot_1_5_hours_amount_integral		
	
	ot_1_5_hours_amount_integral_to_string:
		XOR DX,DX
		DIV exponent[2]
		ADD DL,'0'
		MOV overtime_1_5_hours_amount_string[SI],DL
		DEC SI
		LOOP ot_1_5_hours_amount_integral_to_string	

	XOR AX,AX
	XOR DX,DX
	MOV CX,2
	MOV SI,7
	MOV AX,ot_1_5_hours_amount_decimal
	
	ot_1_5_hours_amount_decimal_to_string:
		XOR DX,DX
		DIV exponent[2]
		ADD DL,'0'
		MOV overtime_1_5_hours_amount_string[SI],DL
		DEC SI
		LOOP ot_1_5_hours_amount_decimal_to_string

;-------------------------------------------	
	;convert hourly rate to string
	XOR AX,AX
		XOR DX,DX
		MOV CX,5
		MOV SI,4
		MOV AX,hourly_integral
		
	basic_hour_rate_integral_to_string:
		XOR DX,DX
		DIV exponent[2]
		ADD DL,'0'
		MOV hourly_string[SI],DL
		DEC SI
		LOOP basic_hour_rate_integral_to_string
		
	XOR AX,AX
	XOR DX,DX
	MOV CX,2
	MOV SI,7
	MOV AX,hourly_decimal
	
	basic_hour_rate_decimal_to_string:
		XOR DX,DX
		DIV exponent[2]
		ADD DL,'0'
		MOV hourly_string[SI],DL
		DEC SI
		LOOP basic_hour_rate_decimal_to_string
		
		XOR AX,AX
		XOR DX,DX
		MOV CX,5
		MOV SI,4
		MOV AX,overtime_2_hourly_rate_integral
		
	ot_2_hour_rate_integral_to_string:
		XOR DX,DX
		DIV exponent[2]
		ADD DL,'0'
		MOV overtime_2_hourly_rate_string[SI],DL
		DEC SI
		LOOP ot_2_hour_rate_integral_to_string
		
	XOR AX,AX
	XOR DX,DX
	MOV CX,2
	MOV SI,7
	MOV AX,overtime_2_hourly_rate_decimal
	
	ot_2_hour_rate_decimal_to_string:
		XOR DX,DX
		DIV exponent[2]
		ADD DL,'0'
		MOV overtime_2_hourly_rate_string[SI],DL
		DEC SI
		LOOP ot_2_hour_rate_decimal_to_string
		
	XOR AX,AX
		XOR DX,DX
		MOV CX,5
		MOV SI,4
		MOV AX,overtime_3_hourly_rate_integral
		
	ot_3_hour_rate_integral_to_string:
		XOR DX,DX
		DIV exponent[2]
		ADD DL,'0'
		MOV overtime_3_hourly_rate_string[SI],DL
		DEC SI
		LOOP ot_3_hour_rate_integral_to_string
		
	XOR AX,AX
	XOR DX,DX
	MOV CX,2
	MOV SI,7
	MOV AX,overtime_3_hourly_rate_decimal
	
	ot_3_hour_rate_decimal_to_string:
		XOR DX,DX
		DIV exponent[2]
		ADD DL,'0'
		MOV overtime_3_hourly_rate_string[SI],DL
		DEC SI
		LOOP ot_3_hour_rate_decimal_to_string
	
	XOR AX,AX
	XOR DX,DX
	MOV CX,5
	MOV SI,4
	MOV AX,ot_1_5_hourly_rate_integral
	
	ot_1_5_hour_rate_integral_to_string:
		XOR DX,DX
		DIV exponent[2]
		ADD DL,'0'
		MOV overtime_1_5_hourly_rate_string[SI],DL
		DEC SI 
		LOOP ot_1_5_hour_rate_integral_to_string
		
	XOR AX,AX
	XOR DX,DX
	MOV CX,2
	MOV SI,7
	MOV AX,ot_1_5_hourly_rate_decimal
	
	ot_1_5_hour_rate_decimal_to_string:
		XOR DX,DX
		DIV exponent[2]
		ADD DL,'0'
		MOV overtime_1_5_hourly_rate_string[SI],DL
		DEC SI 
		LOOP ot_1_5_hour_rate_decimal_to_string	

	calculate_total_ot_integral:
	XOR AX,AX
	MOV AX,ot_1_5_hours_amount_integral
	ADD AX,ot_2_hours_amount_integral
	JC ot_carry
	ADD AX,ot_3_hours_amount_integral
	JC ot_carry
	MOV total_ot_integral,AX
	
	calculate_total_ot_decimal:
	XOR AX,AX
	MOV AX,ot_1_5_hours_amount_decimal
	ADD AX,ot_2_hours_amount_decimal
	ADD AX,ot_3_hours_amount_decimal
	MOV total_ot_decimal,AX
	
	check_total_ot_integral_increment:
	CMP total_ot_decimal,100
	JAE total_ot_intergral_increment
	JMP total_ot_to_string
	
	total_ot_intergral_increment:
	INC total_ot_integral
	CMP total_ot_integral,0
	JE ot_carry
	SUB total_ot_decimal,100
	JMP check_total_ot_integral_increment
	
	ot_carry:
		MOV AH,09H
		LEA DX,ot_out_of_range
		INT 21H
		MOV AH, 09H           ; Display the reenter prompt
		LEA DX, reenter_prompt
		INT 21H
	
		XOR AX, AX 		;clear AX content
		MOV AH, 01H           ;Wait for a single character input
		INT 21H
	
		CMP AL, 'Y'           ;Compare input with 'Y'
		JE ot_input_restart   ;If 'Y', continue the program
		CMP AL, 'y'           ;Compare input with 'y'
		JE ot_input_restart   ;If 'y', continue the program
		JMP ot_end
		
	ot_input_restart:
		JMP overtime_process_start
	
	total_ot_to_string:
	XOR AX,AX
	XOR DX,DX
	MOV CX,5
	MOV SI,4
	MOV AX,total_ot_integral
	
	total_ot_intergral_to_string:
		XOR DX,DX
		DIV exponent[2]
		ADD DL,'0'
		MOV total_ot_string[SI],DL
		DEC SI 
		LOOP total_ot_intergral_to_string
		
	XOR AX,AX
	XOR DX,DX
	MOV CX,2
	MOV SI,7
	MOV AX,total_ot_decimal
	
	total_ot_decimal_to_string:
		XOR DX,DX
		DIV exponent[2]
		ADD DL,'0'
		MOV total_ot_string[SI],DL
		DEC SI 
		LOOP total_ot_decimal_to_string	
	
;============================================
	
	calculate_total_ot_hours_integral:
	XOR AX,AX
	MOV AX, overtime_2_hour_integral
	ADD AX, overtime_3_hour_integral
	ADD AX, overtime_1_5_hour_integral
	MOV total_ot_hours,AX
	
	calculate_total_ot_hours_decimal:
	XOR AX,AX
	MOV AX, overtime_2_hour_decimal
	ADD AX, overtime_3_hour_decimal
	ADD AX, overtime_1_5_hour_decimal
	
	check_total_ot_hours_decimal:
	CMP AX,100
	JAE total_ot_hours_integral_increment
	JMP check_ot_hour
	
	total_ot_hours_integral_increment:
	INC total_ot_hours
	SUB AX,100
	JMP check_total_ot_hours_decimal
	
	check_ot_hour:
	CMP total_ot_hours,105 	;max ot hours by law
	JE check_ot_hour_decimal
	JA exceed_max_ot_hours
	JMP ot_display
	
	exceed_max_ot_hours:
	MOV AH,09H
	LEA DX,exceed_max_ot_hours_error
	INT 21H
	JMP overtime_process_start

	check_ot_hour_decimal:
	CMP AX,0
	JA exceed_max_ot_hours
	
	ot_display:
	MOV AH,09H
	LEA DX,newline
	INT 21H
	
	MOV AH,09H
	LEA DX,overtime_table_line1
	INT 21H
	
	MOV AH,09H
	LEA DX,overtime_table_line2
	INT 21H
	
	MOV AH,09H
	LEA DX,overtime_table_line3
	INT 21H
	
	MOV AH,09H
	LEA DX,overtime_table_line4
	INT 21H
	
	MOV AH,09H
	LEA DX,overtime_table_line5
	INT 21H
	
	MOV AH,09H
	LEA DX,overtime_data_gap
	INT 21H
	
	MOV AH,09H
	LEA DX,overtime_1_5_hourly_rate_string
	INT 21H

	MOV AH,09H
	LEA DX,overtime_data_gap
	INT 21H
	
	MOV AH,09H
	LEA DX,overtime_1_5_hours[2]
	INT 21H
	
	MOV AH,09H
	LEA DX,overtime_data_gap
	INT 21H
	
	MOV AH,09H
	LEA DX,overtime_1_5_hours_amount_string
	INT 21H
	
	MOV AH,09H
	LEA DX,overtime_table_line6
	INT 21H
	
	MOV AH,09H
	LEA DX,overtime_data_gap
	INT 21H	
	
	MOV AH,09H
	LEA DX,overtime_2_hourly_rate_string
	INT 21H
	
	MOV AH,09H
	LEA DX,overtime_data_gap
	INT 21H
	
	MOV AH,09H
	LEA DX, overtime_2_0_hours[2]
	INT 21H
	
	MOV AH,09H
	LEA DX,overtime_data_gap
	INT 21H
	
	MOV AH,09H
	LEA DX,overtime_2_hours_amount_string
	INT 21H
	
	MOV AH,09H
	LEA DX,overtime_table_line7
	INT 21H
	
	MOV AH,09H
	LEA DX,overtime_data_gap
	INT 21H
	
	MOV AH,09H
	LEA DX,overtime_3_hourly_rate_string
	INT 21H
	
	MOV AH,09H
	LEA DX,overtime_data_gap
	INT 21H
	
	MOV AH,09H
	LEA DX, overtime_3_0_hours[2]
	INT 21H
	
	MOV AH,09H
	LEA DX,overtime_data_gap
	INT 21H
	
	MOV AH,09H
	LEA DX,overtime_3_hours_amount_string
	INT 21H
	
	MOV AH,09H
	LEA DX,overtime_table_line7_1
	INT 21H
	
	MOV AH,09H
	LEA DX,hourly_string
	INT 21H
	
	MOV AH,09H
	LEA DX,overtime_table_line7_2
	INT 21H
	
	MOV AH,09H
	LEA DX,overtime_table_line8
	INT 21H
	
	MOV AH,09H
	LEA DX,total_ot_string
	INT 21H
	
	MOV AH,09H
	LEA DX,overtime_table_line9
	INT 21H
	
	ot_end:
	RET
OVERTIME_F ENDP

DEDUCTIONS_F PROC
	deduction_process_start:
	MOV CX,5
	MOV DI,2
	MOV SI,8
	MOV employee_epf_integral,0
	
	calculate_employee_epf_integral:
		XOR AX,AX
		MOV AL,basic_salary[DI]
		SUB AL,'0'
		MOV BX,exponent[SI]
		MUL BX
		ADD employee_epf_integral,AX
		INC DI
		SUB SI,2
		LOOP calculate_employee_epf_integral
	
		MOV CX,2
		MOV DI,8
		MOV SI,2 ;start from 10 in array (data word)
		MOV employee_epf_decimal,0
		
	calculate_employee_epf_decimal:
		XOR AX,AX
		MOV AL,basic_salary[DI]
		SUB AL,'0'
		MOV BX,exponent[SI]
		MUL BX
		ADD employee_epf_decimal,AX
		INC DI
		SUB SI,2
		LOOP calculate_employee_epf_decimal
		
		epf_check_decimal_greater_hundred:
			CMP employee_epf_decimal, 100
			JAE epf_integral_increment
			JMP calculate_employee_epf_after
		epf_integral_increment:
			INC employee_epf_integral
			SUB employee_epf_decimal,100
			JMP epf_check_decimal_greater_hundred
		
	calculate_employee_epf_after:
		MOV AX,employee_epf_integral
		DIV exponent[4]
		MOV employee_epf_integral,AX
		MOV employee_epf_temp,DX
		MOV BX,11
		MUL BX
		MOV employee_epf_integral,AX
		MOV AX,employee_epf_temp
		MUL BX
		MOV employee_epf_temp,AX
		
		check_epf_temp_increment:
			CMP employee_epf_temp,100
			JAE integral_b4_increment
			JMP calculate_decimal_11percent
			
		integral_b4_increment:
			INC employee_epf_integral
			SUB employee_epf_temp,100
			JMP check_epf_temp_increment
		
		calculate_decimal_11percent:
		MOV AX, employee_epf_decimal
		MUL BX
		DIV exponent[4]
		MOV BX,employee_epf_temp
		MOV employee_epf_decimal,AX
		ADD employee_epf_decimal,BX
		MOV employee_epf_34dp_temp,DX ;store for later roundoff check
		MOV AX,DX					;store third dp
		XOR DX,DX
		DIV exponent[2]
		ADD AX,'0'
		ADD DX,'0'
		MOV employee_epf_3dp[0],AL
		MOV employee_epf_3dp[1],DL
		
	check_epf_decimal_increment:
			CMP employee_epf_decimal,100
			JAE integral_b4_increment_2
			JMP process_epf_to_2string_b4_roundup
			
		integral_b4_increment_2:
			INC employee_epf_integral
			SUB employee_epf_decimal,100
			JMP check_epf_decimal_increment
			
	process_epf_to_2string_b4_roundup:
		XOR AX,AX
		XOR DX,DX
		MOV CX,5
		MOV SI,4
		MOV AX,employee_epf_integral
		
	employee_epf_integral_2string_b4_roundup:
		XOR DX,DX
		DIV exponent[2]
		ADD DL,'0'
		MOV employee_epf_before_roundup_string[SI],DL
		DEC SI
		LOOP employee_epf_integral_2string_b4_roundup
		
	XOR AX,AX
	XOR DX,DX
	MOV CX,2
	MOV SI,7
	MOV AX,employee_epf_decimal
	
	employee_epf_decimal_2string_b4_roundup:
		XOR DX,DX
		DIV exponent[2]
		ADD DL,'0'
		MOV employee_epf_before_roundup_string[SI],DL
		DEC SI
		LOOP employee_epf_decimal_2string_b4_roundup
		
		check_employee_epf_34dp_temp_increment:
			CMP employee_epf_34dp_temp,50
			JAE increment
			JMP check_decimal_increment
		
		increment:
			SUB employee_epf_34dp_temp,50
			INC employee_epf_decimal
			JMP check_employee_epf_34dp_temp_increment
		
	         check_decimal_increment:
			CMP employee_epf_decimal,100
			JAE decimal_increment
			JMP process_epf_to_string
			
		decimal_increment:
			INC employee_epf_integral
			SUB employee_epf_decimal,100
			JMP check_decimal_increment
			
		
	process_epf_to_string:
		XOR AX,AX
		XOR DX,DX
		MOV CX,5
		MOV SI,4
		MOV AX,employee_epf_integral
		
	employee_epf_integral_to_string:
		XOR DX,DX
		DIV exponent[2]
		ADD DL,'0'
		MOV employee_epf_string[SI],DL
		DEC SI
		LOOP employee_epf_integral_to_string
		
	XOR AX,AX
	XOR DX,DX
	MOV CX,2
	MOV SI,7
	MOV AX,employee_epf_decimal
	
	employee_epf_decimal_to_string:
		XOR DX,DX
		DIV exponent[2]
		ADD DL,'0'
		MOV employee_epf_string[SI],DL
		DEC SI
		LOOP employee_epf_decimal_to_string
	
	deduction_output:
	LEA DX,deduction_header1			;display header line 1
	MOV AH,09
	INT 21H

	LEA DX,deduction_header2			;display header line 2
	MOV AH,09
	INT 21H

	LEA DX,deduction_header3			;;display header line 3
	MOV AH,09
	INT 21H
	
	input_employee_socso:
		LEA DX,enter_employee_socso		;Prompt and capture Employee SOCSO
		MOV AH,09
		INT 21H
		
		MOV AH,0AH
		LEA DX,employee_socso
		INT 21H
		
		XOR BX,BX
		MOV BL,employee_socso[1]
		MOV employee_socso[BX+2], '$'
	
		CMP employee_socso[1],8					;if length != 8 characters
		JNE employee_socso_invalid_length 			;prompt invalid length error message
		CMP employee_socso[7],"."					;if index no 7 != '.'
		JNE employee_socso_invalid_format			;prompt invalid format
		JMP employee_socso_valid					;skip invalid label if format/length valid
	
	employee_socso_invalid_length:			;invalid length
		MOV AH,09H
		LEA DX,invalid_length_error
		INT 21H
		JMP input_employee_socso			;reenter employee_socso
	employee_socso_invalid_format:
		MOV AH,09H
		LEA DX,invalid_format_error
		INT 21H
		JMP input_employee_socso
	employee_socso_valid:						;skip invalid label
	
	input_income_tax:
		LEA DX,enter_income_tax				; Prompt and capture income_tax
		MOV AH,09
		INT 21H

		MOV AH,0AH
		LEA DX,income_tax
		INT 21H
		
		XOR BX,BX
		MOV BL,income_tax[1]
		MOV income_tax[BX+2], '$'
	
		CMP income_tax[1],8					;if length != 8 characters
		JNE income_tax_invalid_length 			;prompt invalid length error message
		CMP income_tax[7],"."					;if index no 7 != '.'
		JNE income_tax_invalid_format			;prompt invalid format
		JMP income_tax_valid					;skip invalid label if format/length valid
	
	income_tax_invalid_length:			;invalid length
		MOV AH,09H
		LEA DX,invalid_length_error
		INT 21H
		JMP input_income_tax		;reenter employee_socso
	income_tax_invalid_format:
		MOV AH,09H
		LEA DX,invalid_format_error
		INT 21H
		JMP input_income_tax
	income_tax_valid:						;skip invalid label
	
	 ;Display the table
	MOV AH, 09H
	LEA DX, deduction_table_line1
	INT 21H

	MOV AH, 09H
	LEA DX, deduction_table_line2
	INT 21H

	MOV AH, 09H
	LEA DX, deduction_table_line3
	INT 21H

	; Display EPF
	MOV AH, 09H
	LEA DX, deduction_table_line4_1
	INT 21H
	
	MOV AH, 09H
	LEA DX, basic_salary[2]
	INT 21H
	
	MOV AH, 09H
	LEA DX, deduction_table_line4_2
	INT 21H
	
	MOV AH, 09H
	LEA DX, employee_epf_before_roundup_string
	INT 21H
	
	;Display third and fourth decimal point
	MOV AH, 09H
	LEA DX, employee_epf_3dp[0]
	INT 21H
	
	MOV AH, 09H
	LEA DX, newline
	INT 21H
	
	MOV AH, 09H
	LEA DX, deduction_table_line4_3
	INT 21H
	
	MOV AH, 09H
	LEA DX, employee_epf_string
	INT 21H
	
	MOV AH, 09H
	LEA DX, newline
	INT 21H
	
	MOV AH, 09H
	LEA DX, deduction_table_line5
	INT 21H
	
	MOV AH, 09H
	LEA DX, employee_socso[2]
	INT 21H

	MOV AH, 09H
	LEA DX, newline
	INT 21H
	
	MOV AH, 09H
	LEA DX, deduction_table_line6
	INT 21H
	
	MOV AH, 09H
	LEA DX, income_tax[2]
	INT 21H

	MOV AH, 09H
	LEA DX, newline
	INT 21H
	
	MOV AH, 09H
	LEA DX, deduction_table_line7
	INT 21H
	
	MOV CX,5
	MOV DI,2
	MOV SI,8
	MOV total_deduction_integral,0
	
	calculate_total_deduction_integral:
		XOR AX,AX
		MOV AL,employee_epf_string[DI-2]
		SUB AL,'0'
		MOV BX,exponent[SI]
		MUL BX
		JC deduction_carry
		ADD total_deduction_integral,AX
		JC deduction_carry
		XOR AX,AX
		MOV AL,employee_socso[DI]
		SUB AL,'0'
		MOV BX,exponent[SI]
		MUL BX
		JC deduction_carry
		ADD total_deduction_integral,AX
		JC deduction_carry
		XOR AX,AX
		MOV AL,income_tax[DI]
		SUB AL,'0'
		MOV BX,exponent[SI]
		MUL BX
		JC deduction_carry
		ADD total_deduction_integral,AX
		JC deduction_carry
		INC DI
		SUB SI,2
		LOOP calculate_total_deduction_integral
		JMP load_deduction_data
	
	deduction_carry:
		MOV AH,09H
		LEA DX,deduction_out_of_range
		INT 21H
		MOV AH,09H
		LEA DX,deduction_table_line8
		INT 21H
		
		MOV AH, 09H           ; Display the reenter prompt
		LEA DX, reenter_prompt
		INT 21H
	
		XOR AX, AX 		;clear AX content
		MOV AH, 01H           ;Wait for a single character input
		INT 21H
	
		CMP AL, 'Y'           ;Compare input with 'Y'
		JE deduction_input_restart   ;If 'Y', continue the program
		CMP AL, 'y'           ;Compare input with 'y'
		JE deduction_input_restart   ;If 'y', continue the program
		JMP deduction_end
		
	deduction_input_restart:
		JMP deduction_process_start
		
	load_deduction_data:	
		MOV CX,2
		MOV DI,8
		MOV SI,2 ;start from 10 in array (data word)
		MOV total_deduction_decimal,0
	calculate_total_deduction_decimal:
		XOR AX,AX
		MOV AL,employee_epf_string[DI-2]
		SUB AL,'0'
		MOV BX,exponent[SI]
		MUL BX
		ADD total_deduction_decimal,AX
		XOR AX,AX
		MOV AL,employee_socso[DI]
		SUB AL,'0'
		MOV BX,exponent[SI]
		MUL BX
		ADD total_deduction_decimal,AX
		XOR AX,AX
		MOV AL,income_tax[DI]
		SUB AL,'0'
		MOV BX,exponent[SI]
		MUL BX
		ADD total_deduction_decimal,AX
		INC DI
		SUB SI,2
		LOOP calculate_total_deduction_decimal
		
		deduction_check_decimal_greater_hundred:
			CMP total_deduction_decimal, 100
			JAE deduction_integral_increment
			JMP deduction_convertion
		
		deduction_integral_increment:
			INC total_deduction_integral
			CMP total_deduction_integral,0
			JE deduction_carry_help
			SUB total_deduction_decimal,100
			JMP deduction_check_decimal_greater_hundred
		
	deduction_carry_help:
		JMP deduction_carry
		
	deduction_convertion:
		XOR AX,AX
		XOR DX,DX
		MOV CX,5
		MOV SI,4
		MOV AX,total_deduction_integral
		
	deduction_integral_to_string:
		XOR DX,DX
		DIV exponent[2]
		ADD DL,'0'
		MOV total_deduction_string[SI],DL
		DEC SI
		LOOP deduction_integral_to_string
		
	XOR AX,AX
	XOR DX,DX
	MOV CX,2
	MOV SI,7
	MOV AX,total_deduction_decimal
	
	deduction_decimal_to_string:
		XOR DX,DX
		DIV exponent[2]
		ADD DL,'0'
		MOV total_deduction_string[SI],DL
		DEC SI
		LOOP deduction_decimal_to_string
		
	MOV AH,09H
	LEA DX, total_deduction_string
	INT 21H
	
	deduction_final_line:
	MOV AH, 09H
	LEA DX, deduction_table_line8
	INT 21H
	
	deduction_end:
	RET
DEDUCTIONS_F ENDP

EMP_CONTRI_F PROC  
	employer_contribution_process_start:
	MOV CX,5
	MOV DI,2
	MOV SI,8
	MOV employer_epf_integral,0
	
	calculate_employer_epf_integral:
		XOR AX,AX
		MOV AL,basic_salary[DI]
		SUB AL,'0'
		MOV BX,exponent[SI]
		MUL BX
		ADD employer_epf_integral,AX
		INC DI
		SUB SI,2
		LOOP calculate_employer_epf_integral
	
		MOV CX,2
		MOV DI,8
		MOV SI,2 ;start from 10 in array (data word)
		MOV employer_epf_decimal,0
		
	calculate_employer_epf_decimal:
		XOR AX,AX
		MOV AL,basic_salary[DI]
		SUB AL,'0'
		MOV BX,exponent[SI]
		MUL BX
		ADD employer_epf_decimal,AX
		INC DI
		SUB SI,2
		LOOP calculate_employer_epf_decimal
		
		employer_epf_check_decimal_greater_hundred:
			CMP employer_epf_decimal, 100
			JAE epf_integral_incrementation
			JMP calculate_employer_epf_after
		epf_integral_incrementation:
			INC employer_epf_integral
			SUB employer_epf_decimal,100
			JMP employer_epf_check_decimal_greater_hundred
		
	calculate_employer_epf_after:
		MOV AX,employer_epf_integral
		DIV exponent[4]
		MOV employer_epf_integral,AX
		MOV employer_epf_temp,DX
		MOV BX,12
		MUL BX
		MOV employer_epf_integral,AX
		MOV AX,employer_epf_temp
		MUL BX
		MOV employer_epf_temp,AX
		
		check_epf_temp_incrementationation:
			CMP employer_epf_temp,100
			JAE employer_integral_B4_incrementationation
			JMP calculate_decimal_12percent
			
		employer_integral_B4_incrementationation:
			INC employer_epf_integral
			SUB employer_epf_temp,100
			JMP check_epf_temp_incrementationation
		
		calculate_decimal_12percent:
		MOV AX, employer_epf_decimal
		MUL BX
		DIV exponent[4]
		MOV BX,employer_epf_temp
		MOV employer_epf_decimal,AX
		ADD employer_epf_decimal,BX
		MOV employer_epf_34dp_temp,DX ;store for later roundoff check
		MOV AX,DX					;store third dp
		XOR DX,DX
		DIV exponent[2]
		ADD AX,'0'
		ADD DX,'0'
		MOV employer_epf_3dp[0],AL
		MOV employer_epf_3dp[1],DL
		
	check_epf_decimal_incrementationation:
			CMP employer_epf_decimal,100
			JAE employer_employer_integral_B4_incrementationation_2
			JMP process_employer_epf_to_2string_b4_roundup
			
		employer_employer_integral_B4_incrementationation_2:
			INC employer_epf_integral
			SUB employer_epf_decimal,100
			JMP check_epf_decimal_incrementationation
			
	process_employer_epf_to_2string_b4_roundup:
		XOR AX,AX
		XOR DX,DX
		MOV CX,5
		MOV SI,4
		MOV AX,employer_epf_integral
		
	employer_epf_integral_2string_b4_roundup:
		XOR DX,DX
		DIV exponent[2]
		ADD DL,'0'
		MOV employer_epf_before_roundup_string[SI],DL
		DEC SI
		LOOP employer_epf_integral_2string_b4_roundup
		
	XOR AX,AX
	XOR DX,DX
	MOV CX,2
	MOV SI,7
	MOV AX,employer_epf_decimal
	
	employer_epf_decimal_2string_b4_roundup:
		XOR DX,DX
		DIV exponent[2]
		ADD DL,'0'
		MOV employer_epf_before_roundup_string[SI],DL
		DEC SI
		LOOP employer_epf_decimal_2string_b4_roundup
		
		check_employer_epf_34dp_temp_incrementation:
			CMP employer_epf_34dp_temp,50
			JAE incrementation
			JMP check_decimal_incrementation
		
		incrementation:
			SUB employer_epf_34dp_temp,50
			INC employer_epf_decimal
			JMP check_employer_epf_34dp_temp_incrementation
		
	         check_decimal_incrementation:
			CMP employer_epf_decimal,100
			JAE decimal_incrementation
			JMP process_employer_epf_to_string
			
		decimal_incrementation:
			INC employer_epf_integral
			SUB employer_epf_decimal,100
			JMP check_decimal_incrementation
			
		
	process_employer_epf_to_string:
		XOR AX,AX
		XOR DX,DX
		MOV CX,5
		MOV SI,4
		MOV AX,employer_epf_integral
		
	employer_epf_integral_to_string:
		XOR DX,DX
		DIV exponent[2]
		ADD DL,'0'
		MOV employer_epf_string[SI],DL
		DEC SI
		LOOP employer_epf_integral_to_string
		
	XOR AX,AX
	XOR DX,DX
	MOV CX,2
	MOV SI,7
	MOV AX,employer_epf_decimal
	
	employer_epf_decimal_to_string:
		XOR DX,DX
		DIV exponent[2]
		ADD DL,'0'
		MOV employer_epf_string[SI],DL
		DEC SI
		LOOP employer_epf_decimal_to_string
	
	employer_contribution_output:
	LEA DX,displayLine1  ;Display line 
	MOV AH, 09H
	INT 21H
    
	LEA DX, newline
	MOV AH, 09H
	INT 21H
    
	LEA DX,empContribution_table_line2 
	MOV AH, 09H
	INT 21H
    
	LEA DX,displayLine1 ;Display line 
	MOV AH, 09H
	INT 21H
	
	input_employer_socso:
		LEA DX,enterSocso		;Prompt and capture Employer SOCSO
		MOV AH, 09H
		INT 21H
		
		MOV AH,0AH
		LEA DX,Socso
		INT 21H
		
		XOR BX,BX
		MOV BL,Socso[1]
		MOV Socso[BX+2], '$'
	
	    CMP Socso[1],8					;if length != 8 characters
		JNE employer_socso_invalid_length 			;prompt invalid length error message
		CMP Socso[7],"."					;if index no 7 != '.'
		JNE employer_socso_invalid_format			;prompt invalid format
		JMP employer_socso_valid					;skip invalid label if format/length valid
	
	employer_socso_invalid_length:			;invalid length
		LEA DX,invalid_length_error
		MOV AH, 09H
		INT 21H
		JMP input_employer_socso			;reenter employee_socso
	employer_socso_invalid_format:
		LEA DX,invalid_format_error
		MOV AH, 09H
		INT 21H
		JMP input_employer_socso
	employer_socso_valid:						;skip invalid label
	
	input_Employer_Eis:
		LEA DX,enterEis				; Prompt and capture income_tax
		MOV AH, 09H
		INT 21H

		MOV AH,0AH
		LEA DX,Eis
		INT 21H
		
		XOR BX,BX
		MOV BL,Eis[1]
		MOV Eis[BX+2], '$'
	
		CMP Eis[1],8					;if length != 8 characters
		JNE eis_invalid_length 			;prompt invalid length error message
		CMP Eis[7],"."					;if index no 7 != '.'
		JNE eis_invalid_format			;prompt invalid format
		JMP eis_valid					;skip invalid label if format/length valid
	
	eis_invalid_length:			;invalid length
		LEA DX,invalid_length_error
		MOV AH, 09H
		INT 21H
		JMP input_Employer_Eis		;reenter employee_socso
	eis_invalid_format:
		LEA DX,invalid_format_error
		MOV AH, 09H
		INT 21H
		JMP input_Employer_Eis
	eis_valid:						;skip invalid label
	
	 ;Display the table
	LEA DX, newline
	MOV AH, 09H
	INT 21H
	
	LEA DX, deduction_table_line1
	MOV AH, 09H
	INT 21H                 
    
	LEA DX, employer_Contribution_Display
	MOV AH, 09H
	INT 21H
	   
	LEA DX, newline
	MOV AH, 09H
	INT 21H
	
	LEA DX, deduction_table_line3 
    MOV AH, 09H
	INT 21H 

	; Display EPF with 4 decimal point			
	LEA DX, epf_contribution_display2_1
	MOV AH, 09H
	INT 21H 
	
	LEA DX, basic_salary[2]
	MOV AH, 09H
	INT 21H 
	
	LEA DX, epf_contribution_display2_2
	MOV AH, 09H
	INT 21H 
    
	LEA DX, employer_epf_before_roundup_string
	MOV AH, 09H
	INT 21H
	
	;Display third and fourth decimal point
	LEA DX, employer_epf_3dp[0]
	MOV AH, 09H
	INT 21H
	
	LEA DX, newline
	MOV AH, 09H
	INT 21H 

	; Display EPF with 2 decimal point 					
	LEA DX, epf_contribution_display
	MOV AH, 09H
	INT 21H 
	
	LEA DX, employer_epf_string
	MOV AH, 09H
	INT 21H 
	
	LEA DX, newline
	MOV AH, 09H
	INT 21H 
						
	LEA DX, Socso_Display;Display Socso
	MOV AH, 09H
	INT 21H  
	
	LEA DX, Socso[2]
	MOV AH, 09H
	INT 21H  
	
	LEA DX, newline
	MOV AH, 09H
	INT 21H  
							
	LEA DX, Eis_Display;Display eis
	MOV AH, 09H
	INT 21H  
	
	LEA DX, Eis[2]
	MOV AH, 09H
	INT 21H  
	
	LEA DX, deduction_table_line1
	MOV AH, 09H
	INT 21H
	RET
EMP_CONTRI_F ENDP

PAYSLIP_F PROC
lea dx,newline
    mov ah, 09h        
    int 21h 
	
	lea dx,displayLine5555
    mov ah, 09h           ; Function to display string
    int 21h               ; DOS interrupt to display string 

	LEA DX,[empName + 2]  ; Print the employee name
    MOV AH,9
    INT 21H
    
    lea dx,displayLine5111
    mov ah, 09h           ; Function to display string
    int 21h               ; DOS interrupt to display string 

	LEA DX,[empID + 2]  
    MOV AH,9
    INT 21H
		
	lea dx,displayLine5222
    mov ah, 09h           ; Function to display string
    int 21h               ; DOS interrupt to display string    
	
	LEA DX,dept  ; Print the department
    MOV AH,9
    INT 21H 
	
	lea dx,displayLine1333
    mov ah, 09h           ; Function to display string
    int 21h               ; DOS interrupt to display string  
	
	LEA DX,[month + 2]  ; Print the digit entered
    MOV AH,9
    INT 21H 
	
	;display line
    lea dx,displayLine4
    mov ah, 09h           ; Function to display string
    int 21h               ; DOS interrupt to display string     
	
   lea dx,displayLine4_1
    mov ah, 09h         
    int 21h  
	
;display line
    lea dx,displayLine4
    mov ah, 09h           ; Function to display string
    int 21h               ; DOS interrupt to display string 
	
	;display earning
	lea dx, displayLine5         ; Load the address of line2 (Basic Salary)
    mov ah, 09h           ; Function to display string
    int 21h               ; DOS interrupt to display string

;display basic_salary
	MOV AH, 09H
	LEA DX, basic_salary[2]
	INT 21H
	
	;display employee epf
	MOV AH, 09H
	LEA DX, displayLine24
	INT 21H
	
	;display employee epf
	MOV AH, 09H
	LEA DX, employee_epf_string
	INT 21H
	
	;display allowance
	MOV AH, 09H
	LEA DX, displayLine51
	INT 21H
	
	;display allowance
	MOV AH, 09H
	LEA DX, allowance[2]
	INT 21H
	
	;display employee socso
	MOV AH, 09H
	LEA DX, displayLine241
	INT 21H
	
	;display employee socso
	MOV AH, 09H
	LEA DX, employee_socso[2]
	INT 21H
	
	;display bonuses
	MOV AH, 09H
	LEA DX, displayLine52
	INT 21H
	
	;display bonuses
	MOV AH, 09H
	LEA DX, bonuses[2]
	INT 21H
	
	;display employee pcb
	MOV AH, 09H
	LEA DX, displayLine242
	INT 21H
	
	;display employee pcb
	MOV AH, 09H
	LEA DX, income_tax[2]
	INT 21H
	
	lea dx,newline
    mov ah, 09h        
    int 21h 
	
	;display total earning
	MOV AH, 09H
	LEA DX, displayLine13
	INT 21H
	
	;display total earning
	MOV AH, 09H
	LEA DX, total_earning_string
	INT 21H
	
	;display total deduction
	MOV AH, 09H
	LEA DX, displayLine243
	INT 21H
	
	;display total deduction
	MOV AH, 09H
	LEA DX, total_deduction_string
	INT 21H
	
	;display line
    lea dx,displayLine4
    mov ah, 09h           ; Function to display string
    int 21h               ; DOS interrupt to display string  
	
	lea dx, displayLine6
    mov ah, 09h          
    int 21h               
	
	lea dx, displayLine4     
    mov ah, 09h      
    int 21h              
	
	lea dx, displayLine121     
    mov ah, 09h      
    int 21h
	
	lea dx, overtime_1_5_hourly_rate_string     ;display ot 1.5
    mov ah, 09h      
    int 21h
	
	lea dx, data_gap    
    mov ah, 09h      
    int 21h
	
	lea dx, overtime_1_5_hours[2]     
    mov ah, 09h      
    int 21h
	
	lea dx, data_gap    
    mov ah, 09h      
    int 21h
	
	lea dx, overtime_1_5_hours_amount_string     
    mov ah, 09h      
    int 21h
	
	lea dx, displayLine290     ;display employer epf
    mov ah, 09h      
    int 21h
	
	lea dx, employer_epf_string   
    mov ah, 09h      
    int 21h
	
	lea dx, displayLine122     ;display ot 2.0
    mov ah, 09h      
    int 21h
	
	lea dx, overtime_2_hourly_rate_string   
    mov ah, 09h      
    int 21h
	
	lea dx, data_gap    
    mov ah, 09h      
    int 21h
	
	lea dx, overtime_2_0_hours[2]     
    mov ah, 09h      
    int 21h
	
	lea dx, data_gap    
    mov ah, 09h      
    int 21h
	
	lea dx, overtime_2_hours_amount_string     
    mov ah, 09h      
    int 21h
	
	lea dx, displayLine29     ;display employer socso
    mov ah, 09h      
    int 21h
	
	lea dx, Socso[2]
    mov ah, 09h      
    int 21h
	
	lea dx, displayLine123     ;display ot 3.0
    mov ah, 09h      
    int 21h
	
	lea dx, overtime_3_hourly_rate_string     ;display ot 3.0
    mov ah, 09h      
    int 21h
	
	lea dx, data_gap    
    mov ah, 09h      
    int 21h
	
	lea dx, overtime_3_0_hours[2]     
    mov ah, 09h      
    int 21h
	
	lea dx, data_gap    
    mov ah, 09h      
    int 21h
	
	lea dx, overtime_3_hours_amount_string     
    mov ah, 09h      
    int 21h
	
	lea dx, displayLine30     ;display employer EIS
    mov ah, 09h      
    int 21h
	
	lea dx, Eis[2]
    mov ah, 09h      
    int 21h
	
	lea dx,newline
    mov ah, 09h        
    int 21h 
	
	lea dx, displayLine124     ;display total ot
    mov ah, 09h      
    int 21h
	
	lea dx, total_ot_string
    mov ah, 09h      
    int 21h
	
	;calculate gross Pay integral
	MOV AX,total_earning_integral
	ADD AX, total_ot_integral
	JC gross_pay_na
	MOV total_gross_pay_integral,AX
	
	;calculate gross Pay decimal
	MOV AX,total_earning_decimal
	ADD AX, total_ot_decimal
	MOV total_gross_pay_decimal,AX
	
	check_total_gross_pay_decimal:
	CMP total_gross_pay_decimal,100
	JAE total_gross_pay_increment
	JMP gross_pay_convertion
	
	total_gross_pay_increment:
	INC total_gross_pay_integral
	CMP total_gross_pay_integral,0
	JE gross_pay_na
	SUB total_gross_pay_decimal,100
	JMP check_total_gross_pay_decimal
	
	gross_pay_convertion:
		XOR AX,AX
		XOR DX,DX
		MOV CX,5
		MOV SI,4
		MOV AX,total_gross_pay_integral
		
	gross_pay_integral_to_string:
		XOR DX,DX
		DIV exponent[2]
		ADD DL,'0'
		MOV total_gross_pay_string[SI],DL
		DEC SI
		LOOP gross_pay_integral_to_string
		
	XOR AX,AX
	XOR DX,DX
	MOV CX,2
	MOV SI,7
	MOV AX,total_gross_pay_decimal
	
	gross_pay_decimal_to_string:
		XOR DX,DX
		DIV exponent[2]
		ADD DL,'0'
		MOV total_gross_pay_string[SI],DL
		DEC SI
		LOOP gross_pay_decimal_to_string
		JMP calculate_net_pay_decimal
		
	gross_pay_na:
	MOV total_gross_pay_string[0],"E"
	MOV total_gross_pay_string[1],"M"
	MOV total_gross_pay_string[2],"V"
	MOV total_gross_pay_string[3]," "
	MOV total_gross_pay_string[4]," "
	MOV total_gross_pay_string[5],"."
	MOV total_gross_pay_string[6]," "
	MOV total_gross_pay_string[7]," "
	MOV total_gross_pay_string[8],"$"
	
	;calculate net Pay decimal
	calculate_net_pay_decimal:
	MOV AX,total_deduction_decimal
	CMP total_gross_pay_decimal,AX
	JB total_gross_pay_decimal_increment
	MOV AX,total_gross_pay_decimal
	SUB AX, total_deduction_decimal
	MOV total_net_pay_decimal,AX
	JMP calculate_net_pay_integral
	
	total_gross_pay_decimal_increment:
	DEC total_gross_pay_integral
	ADD total_gross_pay_decimal,100
	JMP calculate_net_pay_decimal
	
	;calculate net Pay integral
	calculate_net_pay_integral:
	MOV AX,total_gross_pay_integral
	SUB AX, total_deduction_integral
	MOV total_net_pay_integral,AX
	
	net_pay_convertion:
		XOR AX,AX
		XOR DX,DX
		MOV CX,5
		MOV SI,4
		MOV AX,total_net_pay_integral
		
	net_pay_integral_to_string:
		XOR DX,DX
		DIV exponent[2]
		ADD DL,'0'
		MOV total_net_pay_string[SI],DL
		DEC SI
		LOOP net_pay_integral_to_string
		
	XOR AX,AX
	XOR DX,DX
	MOV CX,2
	MOV SI,7
	MOV AX,total_net_pay_decimal
	
	net_pay_decimal_to_string:
		XOR DX,DX
		DIV exponent[2]
		ADD DL,'0'
		MOV total_net_pay_string[SI],DL
		DEC SI
		LOOP net_pay_decimal_to_string
	
	cmp_gross_deduction:
	MOV AX, total_deduction_integral
	CMP total_gross_pay_integral,AX
	JB net_pay_na
	JMP final_display
	
	net_pay_na:
	MOV total_net_pay_string[0],"R"
	MOV total_net_pay_string[1],"N"
	MOV total_net_pay_string[2],"V"
	MOV total_net_pay_string[3]," "
	MOV total_net_pay_string[4]," "
	MOV total_net_pay_string[5],"."
	MOV total_net_pay_string[6]," "
	MOV total_net_pay_string[7]," "
	MOV total_net_pay_string[8],"$"
	
	final_display:
	;display line
    lea dx,displayLine4
    mov ah, 09h        
    int 21h               
	
    lea dx, displayLine7
    mov ah, 09h     
    int 21h              
	
	lea dx,displayLine4
    mov ah, 09h        
    int 21h 
	
	lea dx,total_earning_string
    mov ah, 09h        
    int 21h 
	
	lea dx,data_gap
    mov ah, 09h        
    int 21h 
	
	lea dx,total_ot_string
    mov ah, 09h        
    int 21h 
	
	lea dx,data_gap
    mov ah, 09h        
    int 21h 
	
	lea dx,total_gross_pay_string
    mov ah, 09h        
    int 21h 
	
	lea dx,data_gap
    mov ah, 09h        
    int 21h 
	
	lea dx,total_deduction_string
    mov ah, 09h        
    int 21h 
	
	lea dx,data_gap
    mov ah, 09h        
    int 21h 
	
	lea dx,total_net_pay_string
    mov ah, 09h        
    int 21h 
	
	lea dx,newline
    mov ah, 09h        
    int 21h
	
	lea dx,payslip_error_abbreviation
    mov ah, 09h        
    int 21h
	
	RET
PAYSLIP_F ENDP

MAIN PROC FAR
; Data initialization
MOV AX,@data
MOV DS,AX

; Login session
CALL LOGIN_SESS
main_menu:
	CALL MENU_SESS
	XOR AX,AX ;clear AX content

validate_selection:
	;Read the user's selection
	MOV AH, 01H  ; Read a single character input
	INT 21H

	;Check if the selection is within valid range (1-6)
	CMP AL, '1'
	JB invalid_selection
	CMP AL, '7'
	JA invalid_selection

	;Valid selection - process accordingly
	JMP process_selection

invalid_selection:
	MOV AH, 09H
	LEA DX, invalid_selection_msg
	INT 21H
	JMP validate_selection ; Restart the menu

process_selection:
	;Process based on the value in user_selection
	CMP AL, '1'
	JE M1
	CMP AL, '2'
	JE M2
	CMP AL, '3'
	JE M3
	CMP AL, '4'
	JE M4
	CMP AL, '5'
	JE M5
	CMP AL, '6'
	JE M6
	CMP AL, '7'
	JE exit_program

M1:
	CALL EMP_DETAIL_F
	JMP continue
M2:
	CALL EARNINGS_F
	JMP continue
M3:
	CALL OVERTIME_F
	JMP continue
M4:
	CALL DEDUCTIONS_F
	JMP continue
M5:
	CALL EMP_CONTRI_F
	JMP continue
M6:
	CALL PAYSLIP_F
	JMP continue
	
continue:
	MOV AH, 09H           ; Display the continue prompt
	LEA DX, continue_prompt
	INT 21H
	
	XOR AX, AX ;clear AX content
	MOV AH, 01H           ;Wait for a single character input
	INT 21H
	
	CMP AL, 'Y'           ;Compare input with 'Y'
	JE main_menu   ;If 'Y', continue the program
	CMP AL, 'y'           ;Compare input with 'y'
	JE main_menu   ;If 'y', continue the program

	;If input is not 'Y' or 'y', exit the program
	JMP exit_program      ;Exit the program

; Terminate program
exit_program:
	MOV AH,09H
	LEA DX, exit_message
	INT 21H
	
	MOV AH, 4CH
	INT 21H

MAIN ENDP
END MAIN