// is_halt := ($mux (opcode == HALT) one_1 zero_1)
// 				is_sbir := ($mux (opcode == SBIR) one_1 zero_1)
// 				is_load := ($mux (opcode == LOAD) one_1 zero_1)
// 				is_store := ($mux (opcode == STORE) one_1 zero_1)
// 				is_and := ($mux (opcode == L_AND) one_1 zero_1)
// 				is_or := ($mux (opcode == L_OR) one_1 zero_1)
// 				is_xnor := ($mux (opcode == L_XNOR) one_1 zero_1)
// 				is_xor := ($mux (opcode == L_XOR) one_1 zero_1)
// 				is_add := ($mux (opcode == ADD) one_1 zero_1)
// 				is_sub := ($mux (opcode == SUB) one_1 zero_1)
// 				is_sll := ($mux (opcode == L_SLL) one_1 zero_1)
// 				is_srl := ($mux (opcode == L_SRL) one_1 zero_1)
// 				is_sra := ($mux (opcode == L_SRA) one_1 zero_1)
// 				is_bz := ($mux (opcode == BZ) one_1 zero_1)
// 				is_bn := ($mux (opcode == BN) one_1 zero_1)
// 				is_call := ($mux (opcode == CALL) one_1 zero_1)
// 				 is_jmp := ($mux (opcode == JMP) one_1 zero_1)
// 				is_cmp := ($mux (opcode == CMP) one_1 zero_1)

////////////////////////////////////////////////////////////

// $module [regAccessDaemon2] $in () $out () $is
// {
	

// 	$branchblock[loop] {
// 		$dopipeline $depth 20 $buffering 2 $fullrate

// 		$merge $entry $loopback $endmerge

// 		cmd_1 := accessReg_request2

		
// 		$volatile $split (cmd_1 1 8 1 8 5 1 8 32) (valid_1 addr1 valid_2 addr2 unused valid_w addr_w data_to_be_written) 

		

// 		$call accessReg (valid_1 addr1 valid_2 addr2 valid_w addr_w data_to_be_written ) (rdata1 rdata2 )
		
// 		accessReg_response12 := rdata1
// 		accessReg_response22 := rdata2
		
// 	$while 1
// 	}
// }

///////////////////////////////////////////////////////////////////////////

//  $module [cal_Next_program_cnt] $in (opcode: $uint<8> rd1: $uint<32> rd2: $uint<32> program_cnt: $uint<10> is_rs1_neg: $uint<1>) $out (n_program_cnt: $uint<10>) $is
// {
// 	//$volatile is_BZ := ($mux (opcode == BZ) one_1 zero_1)
// 	//$volatile is_BN := ($mux (opcode == BN) one_1 zero_1)
// 	//$volatile is_CALL := ($mux (opcode == CALL) one_1 zero_1)
// 	//$volatile is_JMP := ($mux (opcode == JMP) one_1 zero_1)

// 	$volatile is_Branch := ($reduce | ($reduce & (opcode == BZ)  (~is_rs1_neg)) ($reduce & (opcode == BN)  is_rs1_neg))

// 	$volatile normalFlow := (~($reduce | is_Branch (opcode == CALL) (opcode == JMP)))
// 	$volatile $split (rd1 22 10) (unused1 addr1)
// 	$volatile $split (rd2 22 10) (unused2 addr2)

// 	$volatile n_program_cnt := ($excmux 
// 											(opcode == CALL) addr1
// 											(opcode == JMP) addr1
// 											(is_Branch == one_1) addr2
// 											(normalFlow == one_1) (program_cnt + 1)
// 											)
// 	$rreport(cal_Next_program_cnt status program_cnt n_program_cnt opcode is_Branch normalFlow addr1 addr2 is_rs1_neg)

// }

/////////////////////////////////////////////////////
$module [bridge] $in () $out ()  $is
{
	$branchblock[loop] {

		$dopipeline $depth 7 $buffering 2 $fullrate

		$merge $entry $loopback $endmerge

		//r_w = 1 (read), r_w = 0 (write)
		$split (input_to_bridge 1 32 10 21) (r_w data addr unused) 
		 is_uart_addr := ($mux (addr == uart_addr) one_1 zero_1)
		$guard (is_uart_addr) uart_data_0 := out_data
		$guard (is_uart_addr) uart_data_1 := out_data
		$guard (is_uart_addr) uart_data_2 := out_data
		$guard (is_uart_addr) uart_data_3 := out_data
		$guard (is_uart_addr) uart_data_out_32 := ($concat uart_data_0 uart_data_1 uart_data_2 uart_data_3)

		$guard (~is_uart_addr) mem_data_32 := ($bitcast ($uint<32>) 0)

		output_from_bridge := ($mux is_uart_addr uart_data_out_32 mem_data_32)

	$while 1
	}

}

/////////////////////////////////////////
// $module [memAccessDaemon] $in () $out () $is
// {
	

// 	$branchblock[loop] {
// 		$dopipeline $depth 20 $buffering 2 $fullrate

// 		$merge $entry $loopback $endmerge

// 		cmd_1 := accessMem_request

		
// 		$volatile $split (cmd_1 32 10 21 1) (wdata addr unused rwbar)
		

// 		$call accessMem (rwbar  addr wdata ) (rdata )
		
// 		accessMem_response := rdata
		
// 	$while 1
// 	}
// }

// $module [regAccessDaemon] $in () $out () $is
// {
	

// 	$branchblock[loop] {
// 		$dopipeline $depth 20 $buffering 2 $fullrate

// 		$merge $entry $loopback $endmerge

// 		cmd_1 := accessReg_request

		
// 		$volatile $split (cmd_1 1 8 1 8 5 1 8 32) (valid_1 addr1 valid_2 addr2 unused valid_w addr_w data_to_be_written) 

		

// 		$call accessReg (valid_1 addr1 valid_2 addr2 valid_w addr_w data_to_be_written ) (rdata1 rdata2 )
		
// 		accessReg_response1 := rdata1
// 		accessReg_response2 := rdata2
		
// 	$while 1
// 	}
// }

////////////////////////////////////////////////////
// $module [memAccessDaemon] $in () $out () $is
// {
	

// 	$branchblock[loop] {
// 		$dopipeline $depth 20 $buffering 2 $fullrate

// 		$merge $entry $loopback $endmerge

// 		cmd_1 := accessMem_request

		
// 		$volatile $split (cmd_1 32 10 21 1) (wdata addr unused rwbar)
		

// 		$call accessMem (rwbar  addr wdata ) (rdata )
		
// 		accessMem_response := rdata
		
// 	$while 1
// 	}
// }

// $module [regAccessDaemon] $in () $out () $is
// {
	

// 	$branchblock[loop] {
// 		$dopipeline $depth 20 $buffering 2 $fullrate

// 		$merge $entry $loopback $endmerge

// 		cmd_1 := accessReg_request

		
// 		$volatile $split (cmd_1 1 8 1 8 5 1 8 32) (valid_1 addr1 valid_2 addr2 unused valid_w addr_w data_to_be_written) 

		

// 		$call accessReg (valid_1 addr1 valid_2 addr2 valid_w addr_w data_to_be_written ) (rdata1 rdata2 )
		
// 		accessReg_response1 := rdata1
// 		accessReg_response2 := rdata2
		
// 	$while 1
// 	}
// }


// $pipeline $depth 7 $module [accessMem]
// $in (read_write_bar: $uint<1>  addr: $uint<10> write_data: $uint<32> )
// $out (read_data: $uint<32> ) $is
// {
	
// 	$guard (read_write_bar) t_read_data := mem_array[addr]


// 	$guard (~read_write_bar) mem_array[addr] := write_data 



// 	//G: if(1) then last parameter is taken
// 	read_data := ($mux read_write_bar  t_read_data 0)
	

// }

// $pipeline $depth 7 $module [accessReg]
// $in (valid_1: $uint<1>  addr_1: $uint<8> valid_2: $uint<1> addr_2: $uint<8> valid_w: $uint<1> addr_w: $uint<8> data_to_be_written: $uint<32>)
// $out (read_data_1: $uint<32> read_data_2: $uint<32> ) $is
// {
	
	
// 	$guard (valid_1) t_read_data_1 := reg_array[addr_1]
// 	$guard (valid_2) t_read_data_2 := reg_array[addr_2]

// 	read_data_1 := ($mux valid_1 t_read_data_1 0)
// 	read_data_2 := ($mux valid_2 t_read_data_2 0)

// 	$guard (valid_w) reg_array[addr_w] := data_to_be_written

// }