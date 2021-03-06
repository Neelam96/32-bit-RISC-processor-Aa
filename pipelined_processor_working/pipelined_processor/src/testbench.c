

#include <pthread.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <pthreadUtils.h>
#include <Pipes.h>
#include <pipeHandler.h>

#ifdef AA2C
#include "simple_proc_aa_c_model.h"
#else
#include "vhdlCStubs.h"
#endif


#define last_inst_addr 8
#define last_mem_addr 11
#define no_of_registers_to_be_initialized 10


void Exit(int sig)
{
	fprintf(stderr, "## Break! ##\n");
	exit(0);
}



void initialMem(){
	
	
	//X[0] = 151061506;		//ADD 1, 4, 2
		uint64_t write_signal =0;
		uint64_t read_signal = 1;
		uint64_t idx =0;
		
		uint64_t opcode_ZERO =0<<24;
		uint64_t opcode_HALT =1<<24;
		uint64_t opcode_SBIR =2<<24;
		uint64_t opcode_LOAD =3<<24;
		uint64_t opcode_STORE =4<<24;
		uint64_t opcode_AND =5<<24;
		uint64_t opcode_OR =6<<24;
		uint64_t opcode_XNOR =7<<24;
		uint64_t opcode_XOR =8<<24;
		uint64_t opcode_ADD =9<<24;
		uint64_t opcode_SUB =10<<24;
		uint64_t opcode_SLL =11<<24;
		uint64_t opcode_SRL =12<<24;
		uint64_t opcode_SRA =13<<24;
		uint64_t opcode_BZ =14<<24;
		uint64_t opcode_BN =15<<24;
		uint64_t opcode_CALL =16<<24;
		uint64_t opcode_JMP =17<<24;
		uint64_t opcode_CMP =18<<24;

		uint64_t rs1_imm, rs2, rd, addr, wdata, write_request, read_request;

		//////////////////////////////////////////////////////////
		// opcode_ZERO =0<<24;
		 rs1_imm = 0<<16;
		 rs2 = 0<<8;
		 rd = 0;

		 addr = 0<<22;
		 wdata = (opcode_ZERO | rs1_imm | rs2 | rd)<<32;
		 write_request = wdata | addr | write_signal;
		write_uint64("accessMem_request",write_request);

		 read_request = (wdata | addr | read_signal );
		write_uint64("accessMem_request",read_request);


		// //----------------------------------------------------

		// uint64_t opcode_ADD =9<<24;
		// rs1_imm = 1<<16;
		// rs2 = 2<<8;
		// rd = 3;

		//  addr = 1<<22;
		// wdata = (opcode_ADD | rs1_imm | rs2 | rd)<<32;
		//  write_request = wdata | addr | write_signal;
		// write_uint64("accessMem_request",write_request);

		//  read_request = (wdata | addr | read_signal );
		// write_uint64("accessMem_request",read_request);

		// //-------------------------------------------------------
		//  opcode_ADD =9<<24;
		//  rs1_imm = 2<<16;
		//  rs2 = 3<<8;
		//  rd = 4;

		//  addr = 2<<22;
		//  wdata = (opcode_ADD | rs1_imm | rs2 | rd)<<32;
		//  write_request = wdata | addr | write_signal;
		// write_uint64("accessMem_request",write_request);

		//  read_request = (wdata | addr | read_signal );
		// write_uint64("accessMem_request",read_request);

		// //------------------------------------------------------

		// opcode_ADD =9<<24;
		//  rs1_imm = 3<<16;
		//  rs2 = 4<<8;
		//  rd = 5;

		//  addr = 3<<22;
		//  wdata = (opcode_ADD | rs1_imm | rs2 | rd)<<32;
		//  write_request = wdata | addr | write_signal;
		// write_uint64("accessMem_request",write_request);

		//  read_request = (wdata | addr | read_signal );
		// write_uint64("accessMem_request",read_request);

		// //--------------------------------------------------------

		// opcode_ADD =9<<24;
		//  rs1_imm = 4<<16;
		//  rs2 = 5<<8;
		//  rd = 6;

		//  addr = 4<<22;
		//  wdata = (opcode_ADD | rs1_imm | rs2 | rd)<<32;
		//  write_request = wdata | addr | write_signal;
		// write_uint64("accessMem_request",write_request);

		//  read_request = (wdata | addr | read_signal );
		// write_uint64("accessMem_request",read_request);

		// //--------------------------------------------------------

		// opcode_ADD =9<<24;
		//  rs1_imm = 5<<16;
		//  rs2 = 6<<8;
		//  rd = 7;

		//  addr = 5<<22;
		//  wdata = (opcode_ADD | rs1_imm | rs2 | rd)<<32;
		//  write_request = wdata | addr | write_signal;
		// write_uint64("accessMem_request",write_request);

		//  read_request = (wdata | addr | read_signal );
		// write_uint64("accessMem_request",read_request);

		// //-----------------------------------------------------

		// uint64_t opcode_HALT =1<<24;
		//  rs1_imm = 1<<16;
		//  rs2 = 4<<8;
		//  rd = 0;

		//  addr = 6<<22;
		//  wdata = (opcode_HALT | rs1_imm | rs2 | rd)<<32;
		//  write_request = wdata | addr | write_signal;
		// write_uint64("accessMem_request",write_request);

		//  read_request = (wdata | addr | read_signal );
		// write_uint64("accessMem_request",read_request);

		///////////////////////////////////////////////////////////////

		//  opcode_ZERO =0<<24;
		//  rs1_imm = 0<<16;
		//  rs2 = 0<<8;
		//  rd = 0;

		//  addr = 0<<22;
		//  wdata = (opcode_ZERO | rs1_imm | rs2 | rd)<<32;
		//  write_request = wdata | addr | write_signal;
		// write_uint64("accessMem_request",write_request);

		//  read_request = (wdata | addr | read_signal );
		// write_uint64("accessMem_request",read_request);


		//----------------------------------------------------

		// uint64_t opcode_LOAD =3<<24;
		// rs1_imm = 1<<16;
		// rs2 = 2<<8;
		// rd = 3;

		//  addr = 1<<22;
		// wdata = (opcode_LOAD | rs1_imm | rs2 | rd)<<32;
		//  write_request = wdata | addr | write_signal;
		// write_uint64("accessMem_request",write_request);

		//  read_request = (wdata | addr | read_signal );
		// write_uint64("accessMem_request",read_request);

		// //-------------------------------------------------------
		//  opcode_LOAD =3<<24;
		//  rs1_imm = 2<<16;
		//  rs2 = 3<<8;
		//  rd = 4;

		//  addr = 2<<22;
		//  wdata = (opcode_LOAD | rs1_imm | rs2 | rd)<<32;
		//  write_request = wdata | addr | write_signal;
		// write_uint64("accessMem_request",write_request);

		//  read_request = (wdata | addr | read_signal );
		// write_uint64("accessMem_request",read_request);

		// //------------------------------------------------------

		// opcode_LOAD =3<<24;
		//  rs1_imm = 3<<16;
		//  rs2 = 4<<8;
		//  rd = 5;

		//  addr = 3<<22;
		//  wdata = (opcode_LOAD | rs1_imm | rs2 | rd)<<32;
		//  write_request = wdata | addr | write_signal;
		// write_uint64("accessMem_request",write_request);

		//  read_request = (wdata | addr | read_signal );
		// write_uint64("accessMem_request",read_request);

		// //--------------------------------------------------------

		// opcode_LOAD =3<<24;
		//  rs1_imm = 4<<16;
		//  rs2 = 5<<8;
		//  rd = 6;

		//  addr = 4<<22;
		//  wdata = (opcode_LOAD | rs1_imm | rs2 | rd)<<32;
		//  write_request = wdata | addr | write_signal;
		// write_uint64("accessMem_request",write_request);

		//  read_request = (wdata | addr | read_signal );
		// write_uint64("accessMem_request",read_request);

		// //--------------------------------------------------------

		// opcode_LOAD =3<<24;
		//  rs1_imm = 5<<16;
		//  rs2 = 6<<8;
		//  rd = 7;

		//  addr = 5<<22;
		//  wdata = (opcode_LOAD | rs1_imm | rs2 | rd)<<32;
		//  write_request = wdata | addr | write_signal;
		// write_uint64("accessMem_request",write_request);

		//  read_request = (wdata | addr | read_signal );
		// write_uint64("accessMem_request",read_request);

		// //-----------------------------------------------------

		// uint64_t opcode_HALT =1<<24;
		//  rs1_imm = 1<<16;
		//  rs2 = 4<<8;
		//  rd = 0;

		//  addr = 6<<22;
		//  wdata = (opcode_HALT | rs1_imm | rs2 | rd)<<32;
		//  write_request = wdata | addr | write_signal;
		// write_uint64("accessMem_request",write_request);

		//  read_request = (wdata | addr | read_signal );
		// write_uint64("accessMem_request",read_request);


		//////////////////////////////////////////////////////////


		// for(idx = 1; idx <= last_inst_addr; idx++){
		// 		uint64_t opcode = (opcode_LOAD <<24);
		// 		uint64_t rs1 = (idx<<16);
		// 		uint64_t rs2 = ((idx+1)<<8);
		// 		uint64_t rd = (idx+2);
		// 		uint64_t addr = (idx<<22);
				
		// 		uint64_t wdata = ((opcode | rs1 | rs2 | rd)<<32);
		// 		uint64_t write_request = (wdata | addr | write_signal);
		// 		write_uint64("accessMem_request",write_request);

		// 		uint64_t read_request = (wdata | addr | read_signal );
		// 		write_uint64("accessMem_request",read_request);
		// }

		// /////////////////////////////////////////////////////////////
		// uint64_t opcode_SUB =10<<24;
		//  rs1_imm = 1<<16;
		// rs2 = 2<<8;
		// rd = 1;

		// addr = 1<<22;
		// wdata = (opcode_SUB | rs1_imm | rs2 | rd)<<32;
		// write_request = wdata | addr | write_signal;
		// write_uint64("accessMem_request",write_request);

		// read_request = (wdata | addr | read_signal );
		// write_uint64("accessMem_request",read_request);
		// //-----------------------------------------
		// uint64_t opcode_BN =15<<24;
		//  rs1_imm = 1<<16;
		//  rs2 = 4<<8;
		//  rd = 0;

		//  addr = 2<<22;
		//  wdata = (opcode_BN | rs1_imm | rs2 | rd)<<32;
		//  write_request = wdata | addr | write_signal;
		// write_uint64("accessMem_request",write_request);

		//  read_request = (wdata | addr | read_signal );
		// write_uint64("accessMem_request",read_request);
		// //------------------------------------------
		// uint64_t opcode_HALT =1<<24;
		//  rs1_imm = 1<<16;
		//  rs2 = 4<<8;
		//  rd = 0;

		//  addr = 3<<22;
		//  wdata = (opcode_HALT | rs1_imm | rs2 | rd)<<32;
		//  write_request = wdata | addr | write_signal;
		// write_uint64("accessMem_request",write_request);

		//  read_request = (wdata | addr | read_signal );
		// write_uint64("accessMem_request",read_request);
		// //------------------------------------------
		// uint64_t opcode_AND =5<<24;
		//  rs1_imm = 0<<16;
		//  rs2 = 5<<8;
		//  rd = 7;

		//  addr = 4<<22;
		//  wdata = (opcode_AND | rs1_imm | rs2 | rd)<<32;
		//  write_request = wdata | addr | write_signal;
		// write_uint64("accessMem_request",write_request);

		//  read_request = (wdata | addr | read_signal );
		// write_uint64("accessMem_request",read_request);
		// //------------------------------------------
		// uint64_t opcode_ADD =9<<24;
		//  rs1_imm = 7<<16;
		//  rs2 = 2<<8;
		//  rd = 1;

		//  addr = 5<<22;
		//  wdata = (opcode_ADD | rs1_imm | rs2 | rd)<<32;
		//  write_request = wdata | addr | write_signal;
		// write_uint64("accessMem_request",write_request);

		//  read_request = (wdata | addr | read_signal );
		// write_uint64("accessMem_request",read_request);

		// //------------------------------------------
		// uint64_t opcode_JMP =17<<24;
		//  rs1_imm = 2<<16;
		//  rs2 = 0<<8;
		//  rd = 0;

		//  addr = 6<<22;
		//  wdata = (opcode_JMP | rs1_imm | rs2 | rd)<<32;
		//  write_request = wdata | addr | write_signal;
		// write_uint64("accessMem_request",write_request);

		//  read_request = (wdata | addr | read_signal );
		// write_uint64("accessMem_request",read_request);

		// ////////////////////////////////////////////////////////////

		 // opcode_LOAD =3<<24;
		// rs1_imm = 2<<16;
		//  rs2 = 0<<8;
		//  rd = 1;

		//  addr = 1<<22;
		//  wdata = (opcode_LOAD | rs1_imm | rs2 | rd)<<32;
		//  write_request = wdata | addr | write_signal;
		// write_uint64("accessMem_request",write_request);

		//  read_request = (wdata | addr | read_signal );
		// write_uint64("accessMem_request",read_request);
		// // //-----------------------------------------
		// // opcode_SRA =3<<24;
		// rs1_imm = 4<<16;
		//  rs2 = 1<<8;
		//  rd = 4;

		//  addr = 2<<22;
		//  wdata = (opcode_SLL | rs1_imm | rs2 | rd)<<32;
		//  write_request = wdata | addr | write_signal;
		// write_uint64("accessMem_request",write_request);

		//  read_request = (wdata | addr | read_signal );
		// write_uint64("accessMem_request",read_request);
		// // //-----------------------------------------

		//  opcode_HALT =1<<24;
		//  rs1_imm = 1<<16;
		//  rs2 = 4<<8;
		//  rd = 0;

		//  addr = 3<<22;
		//  wdata = (opcode_HALT | rs1_imm | rs2 | rd)<<32;
		//  write_request = wdata | addr | write_signal;
		// write_uint64("accessMem_request",write_request);

		//  read_request = (wdata | addr | read_signal );
		// write_uint64("accessMem_request",read_request);

		////////////////////////////////////////////////////////////////

			// // //-----------------------------------------
		// opcode_SRA =3<<24;
		rs1_imm = 1<<16;
		 rs2 = 1<<8;
		 rd = 1;

		 addr = 1<<22;
		 wdata = (opcode_ADD | rs1_imm | rs2 | rd)<<32;
		 write_request = wdata | addr | write_signal;
		write_uint64("accessMem_request",write_request);

		 read_request = (wdata | addr | read_signal );
		write_uint64("accessMem_request",read_request);
		// // //-----------------------------------------
		rs1_imm = 2<<16;
		 rs2 = 3<<8;
		 rd = 4;

		 addr = 2<<22;
		 wdata = (opcode_ADD | rs1_imm | rs2 | rd)<<32;
		 write_request = wdata | addr | write_signal;
		write_uint64("accessMem_request",write_request);

		 read_request = (wdata | addr | read_signal );
		write_uint64("accessMem_request",read_request);

		//-----------------------------------------------
		rs1_imm = 1<<16;
		 rs2 = 4<<8;
		 rd = 5;

		 addr = 3<<22;
		 wdata = (opcode_ADD | rs1_imm | rs2 | rd)<<32;
		 write_request = wdata | addr | write_signal;
		write_uint64("accessMem_request",write_request);

		 read_request = (wdata | addr | read_signal );
		write_uint64("accessMem_request",read_request);

		//-----------------------------------------------

		rs1_imm = 1<<16;
		 rs2 = 3<<8;
		 rd = 7;

		 addr = 4<<22;
		 wdata = (opcode_ADD | rs1_imm | rs2 | rd)<<32;
		 write_request = wdata | addr | write_signal;
		write_uint64("accessMem_request",write_request);

		 read_request = (wdata | addr | read_signal );
		write_uint64("accessMem_request",read_request);

		//-----------------------------------------------

		rs1_imm = 9<<16;
		 rs2 = 0<<8;
		 rd = 10;

		 addr = 5<<22;
		 wdata = (opcode_LOAD | rs1_imm | rs2 | rd)<<32;
		 write_request = wdata | addr | write_signal;
		write_uint64("accessMem_request",write_request);

		 read_request = (wdata | addr | read_signal );
		write_uint64("accessMem_request",read_request);

		//-----------------------------------------------

		rs1_imm = 1<<16;
		 rs2 = 10<<8;
		 rd = 0;

		 addr = 6<<22;
		 wdata = (opcode_STORE | rs1_imm | rs2 | rd)<<32;
		 write_request = wdata | addr | write_signal;
		write_uint64("accessMem_request",write_request);

		 read_request = (wdata | addr | read_signal );
		write_uint64("accessMem_request",read_request);

		//-----------------------------------------------

		rs1_imm = 2<<16;
		 rs2 = 0<<8;
		 rd = 3;

		 addr = 7<<22;
		 wdata = (opcode_LOAD | rs1_imm | rs2 | rd)<<32;
		 write_request = wdata | addr | write_signal;
		write_uint64("accessMem_request",write_request);

		 read_request = (wdata | addr | read_signal );
		write_uint64("accessMem_request",read_request);

		//-----------------------------------------------
		 
		 rs1_imm = 1<<16;
		 rs2 = 4<<8;
		 rd = 0;

		 addr = 8<<22;
		 wdata = (opcode_HALT | rs1_imm | rs2 | rd)<<32;
		 write_request = wdata | addr | write_signal;
		write_uint64("accessMem_request",write_request);

		 read_request = (wdata | addr | read_signal );
		write_uint64("accessMem_request",read_request);


			// /////////////////////////////////////////////////////////////
		//  opcode_CALL =16<<24;
		// rs1_imm = 5<<16;
		//  rs2 = 0<<8;
		//  rd = 4;

		//  addr = 1<<22;
		//  wdata = (opcode_CALL | rs1_imm | rs2 | rd)<<32;
		//  write_request = wdata | addr | write_signal;
		// write_uint64("accessMem_request",write_request);

		//  read_request = (wdata | addr | read_signal );
		// write_uint64("accessMem_request",read_request);
		// //-----------------------------------------
		//  opcode_BN =15<<24;
		//  rs1_imm = 0<<16;
		//  rs2 = 4<<8;
		//  rd = 0;

		//  addr = 2<<22;
		//  wdata = (opcode_BN | rs1_imm | rs2 | rd)<<32;
		//  write_request = wdata | addr | write_signal;
		// write_uint64("accessMem_request",write_request);

		//  read_request = (wdata | addr | read_signal );
		// write_uint64("accessMem_request",read_request);
		// //-------------------------------------------
		//   opcode_SLL =11<<24;
		//  rs1_imm = 7<<16;
		//  rs2 = 5<<8;
		//  rd = 8;

		//  addr = 3<<22;
		//  wdata = (opcode_SLL | rs1_imm | rs2 | rd)<<32;
		//  write_request = wdata | addr | write_signal;
		// write_uint64("accessMem_request",write_request);

		//  read_request = (wdata | addr | read_signal );
		// write_uint64("accessMem_request",read_request);
		// //------------------------------------------
		//  opcode_HALT =1<<24;
		//  rs1_imm = 1<<16;
		//  rs2 = 4<<8;
		//  rd = 0;

		//  addr = 4<<22;
		//  wdata = (opcode_HALT | rs1_imm | rs2 | rd)<<32;
		//  write_request = wdata | addr | write_signal;
		// write_uint64("accessMem_request",write_request);

		//  read_request = (wdata | addr | read_signal );
		// write_uint64("accessMem_request",read_request);
		// //------------------------------------------
		//  opcode_JMP =17<<24;
		//  rs1_imm = 2<<16;
		//  rs2 = 0<<8;
		//  rd = 0;

		//  addr = 5<<22;
		//  wdata = (opcode_JMP | rs1_imm | rs2 | rd)<<32;
		//  write_request = wdata | addr | write_signal;
		// write_uint64("accessMem_request",write_request);

		//  read_request = (wdata | addr | read_signal );
		// write_uint64("accessMem_request",read_request);
		//------------------------------------------
		///////////////////////////////////////////////////////////////

		// uint64_t opcode_ZERO =0<<24;
		// uint64_t rs1_imm = 0<<16;
		// uint64_t rs2 = 0<<8;
		// uint64_t rd = 0;

		// uint64_t addr = 0<<22;
		// uint64_t wdata = (opcode_ZERO | rs1_imm | rs2 | rd)<<32;
		// uint64_t write_request = wdata | addr | write_signal;
		// write_uint64("accessMem_request",write_request);

		// uint64_t read_request = (wdata | addr | read_signal );
		// write_uint64("accessMem_request",read_request);
		// //---------------------------------

		// uint64_t opcode_ADD =9<<24;
		//  rs1_imm = 5<<16;
		//  rs2 = 0<<8;
		//  rd = 9;

		//  addr = 1<<22;
		//  wdata = (opcode_ADD | rs1_imm | rs2 | rd)<<32;
		//  write_request = wdata | addr | write_signal;
		// write_uint64("accessMem_request",write_request);

		//  read_request = (wdata | addr | read_signal );
		// write_uint64("accessMem_request",read_request);
		// //-----------------------------------------
		// uint64_t opcode_SRL =12<<24;
		//  rs1_imm = 2<<16;
		//  rs2 = 1<<8;
		//  rd = 2;

		//  addr = 2<<22;
		//  wdata = (opcode_SRL | rs1_imm | rs2 | rd)<<32;
		//  write_request = wdata | addr | write_signal;
		// write_uint64("accessMem_request",write_request);

		//  read_request = (wdata | addr | read_signal );
		// write_uint64("accessMem_request",read_request);
		// //-------------------------------------------
		//  uint64_t opcode_CMP =18<<24;
		//  rs1_imm = 2<<16;
		//  rs2 = 9<<8;
		//  rd = 7;

		//  addr = 3<<22;
		//  wdata = (opcode_CMP | rs1_imm | rs2 | rd)<<32;
		//  write_request = wdata | addr | write_signal;
		// write_uint64("accessMem_request",write_request);

		//  read_request = (wdata | addr | read_signal );
		// write_uint64("accessMem_request",read_request);
		// //------------------------------------------
		// uint64_t opcode_BN =15<<24;
		//  rs1_imm = 7<<16;
		//  rs2 = 6<<8;
		//  rd = 0;

		//  addr = 4<<22;
		//  wdata = (opcode_BN | rs1_imm | rs2 | rd)<<32;
		//  write_request = wdata | addr | write_signal;
		// write_uint64("accessMem_request",write_request);

		//  read_request = (wdata | addr | read_signal );
		// write_uint64("accessMem_request",read_request);
		// //------------------------------------------
		// uint64_t opcode_HALT =1<<24;
		//  rs1_imm = 2<<16;
		//  rs2 = 0<<8;
		//  rd = 0;

		//  addr = 5<<22;
		//  wdata = (opcode_HALT | rs1_imm | rs2 | rd)<<32;
		//  write_request = wdata | addr | write_signal;
		// write_uint64("accessMem_request",write_request);

		//  read_request = (wdata | addr | read_signal );
		// write_uint64("accessMem_request",read_request);
		// //------------------------------------------
		// opcode_ADD =9<<24;
		//  rs1_imm = 8<<16;
		//  rs2 = 5<<8;
		//  rd = 8;

		//  addr = 6<<22;
		//  wdata = (opcode_ADD | rs1_imm | rs2 | rd)<<32;
		//  write_request = wdata | addr | write_signal;
		// write_uint64("accessMem_request",write_request);

		//  read_request = (wdata | addr | read_signal );
		// write_uint64("accessMem_request",read_request);
		// //------------------------------------------
		//  opcode_ADD =9<<24;
		//  rs1_imm = 2<<16;
		//  rs2 = 1<<8;
		//  rd = 2;

		//  addr = 7<<22;
		//  wdata = (opcode_ADD | rs1_imm | rs2 | rd)<<32;
		//  write_request = wdata | addr | write_signal;
		// write_uint64("accessMem_request",write_request);

		//  read_request = (wdata | addr | read_signal );
		// write_uint64("accessMem_request",read_request);

		// //------------------------------------------
		// uint64_t opcode_JMP =17<<24;
		//  rs1_imm = 3<<16;
		//  rs2 = 0<<8;
		//  rd = 0;

		//  addr = 8<<22;
		//  wdata = (opcode_JMP | rs1_imm | rs2 | rd)<<32;
		//  write_request = wdata | addr | write_signal;
		// write_uint64("accessMem_request",write_request);

		//  read_request = (wdata | addr | read_signal );
		// write_uint64("accessMem_request",read_request);

		// ////////////////////////////////////////////////////////////

		//------------------------------------------
		// uint64_t opcode_LOAD =3<<24;
		// uint64_t rs1_imm = 1<<16;
		// uint64_t rs2 = 0<<8;
		// uint64_t rd = 2;

		// uint64_t addr = 1<<22;
		// uint64_t wdata = (opcode_LOAD | rs1_imm | rs2 | rd)<<32;
		// uint64_t write_request = wdata | addr | write_signal;
		// write_uint64("accessMem_request",write_request);

		// uint64_t read_request = (wdata | addr | read_signal );
		// write_uint64("accessMem_request",read_request);

		// //------------------------------------------
		// uint64_t opcode_ADD =9<<24;
		//  rs1_imm = 4<<16;
		//  rs2 = 2<<8;
		//  rd = 0;

		//  addr = 2<<22;
		//  wdata = (opcode_ADD | rs1_imm | rs2 | rd)<<32;
		//  write_request = wdata | addr | write_signal;
		// write_uint64("accessMem_request",write_request);

		//  read_request = (wdata | addr | read_signal );
		// write_uint64("accessMem_request",read_request);
		// //------------------------------------------
		// uint64_t opcode_HALT =1<<24;
		//  rs1_imm = 1<<16;
		//  rs2 = 4<<8;
		//  rd = 0;

		//  addr = 3<<22;
		//  wdata = (opcode_HALT | rs1_imm | rs2 | rd)<<32;
		//  write_request = wdata | addr | write_signal;
		// write_uint64("accessMem_request",write_request);

		//  read_request = (wdata | addr | read_signal );
		// write_uint64("accessMem_request",read_request);

		// ///////////////////////////////////////////////////////////


		for(idx =last_inst_addr+1 ; idx <=last_mem_addr; idx++){
			 wdata = (idx << 32);
			 addr = (idx << 22);
			 write_request = wdata | addr | write_signal;
			write_uint64("accessMem_request",write_request);

			 read_request = wdata | addr | read_signal;
			write_uint64("accessMem_request",read_request);
		}
		

		

		printf("Memory initialized\n");
}

void receive_responses_from_memory(){

			int idx=0;

		for(idx=0; idx <= 2*last_mem_addr; idx++){
			printf("Read ele from accessMem_response: %d\n",read_uint32("accessMem_response") );
		}

}

void initializeRegisterFile(){

	//X[0] = 151061506;		//ADD 1, 4, 2
		uint64_t write_signal =1;
		uint64_t valid_read =1;
		uint64_t idx =0;
		uint64_t  zero= 0, minus_6 =4294967290;
		uint64_t reg_write_request, reg_read_request;

		//  uint64_t reg_write_request =((write_signal<<40) | (zero <<32) | (minus_6));
		// 	write_uint64("accessReg_request",reg_write_request);

		// uint64_t reg_read_request = ((valid_read<<63) | (zero<<55));
		// 	write_uint64("accessReg_request",reg_read_request);

		for(idx = 0; idx<=no_of_registers_to_be_initialized;idx++){
			 reg_write_request =((write_signal<<40) | (idx <<32) | (idx));
			write_uint64("accessReg_request",reg_write_request);

			 reg_read_request = ((valid_read<<63) | (idx<<55));
			write_uint64("accessReg_request",reg_read_request);

		}

		printf("Register file initialized\n");
}

void receive_responses_from_registerFile_response1(){

			int idx=0;

		for(idx=0; idx <= 2*no_of_registers_to_be_initialized; idx++){
			printf("Read ele from accessMem_response1: %x\n",read_uint32("accessReg_response1") );
		}

}

void receive_responses_from_registerFile_response2(){

			int idx=0;

		for(idx=0; idx < 2*no_of_registers_to_be_initialized; idx++){
			printf("Read ele from accessMem_response2: %d\n",read_uint32("accessReg_response2") );
		}

}

// Since blocking pipes are used so, we can read forever




void write_start_processor(){

	

	uint8_t start = 1;
	write_uint8("start_processor",start);
	printf("Started processor\n");

}
void read_processor_result(){
	int idx;

	for(idx=0;idx < 20;idx++){

	uint32_t processor_res = read_uint32("processor_result");
	printf("processor result: %d\n", processor_res );
	}
}





DEFINE_THREAD(initialMem)
DEFINE_THREAD(receive_responses_from_memory)
DEFINE_THREAD(initializeRegisterFile)
DEFINE_THREAD(receive_responses_from_registerFile_response1)
DEFINE_THREAD(receive_responses_from_registerFile_response2)
DEFINE_THREAD(write_start_processor)

DEFINE_THREAD(read_processor_result)



int main(int argc, char* argv[])
{
	
	signal(SIGINT,  Exit);
  	signal(SIGTERM, Exit);
#ifdef AA2C
	init_pipe_handler();
	simple_proc_start_daemons (stdout, 0);
#endif



	PTHREAD_DECL(initialMem);
	PTHREAD_CREATE(initialMem);

	PTHREAD_DECL(receive_responses_from_memory);
	PTHREAD_CREATE(receive_responses_from_memory);

	PTHREAD_JOIN(initialMem);
	PTHREAD_JOIN(receive_responses_from_memory);

	PTHREAD_DECL(initializeRegisterFile);
	PTHREAD_CREATE(initializeRegisterFile);

	PTHREAD_DECL(receive_responses_from_registerFile_response1);
	PTHREAD_CREATE(receive_responses_from_registerFile_response1);

	PTHREAD_DECL(receive_responses_from_registerFile_response2);
	PTHREAD_CREATE(receive_responses_from_registerFile_response2);

	PTHREAD_JOIN(initializeRegisterFile);
	PTHREAD_JOIN(receive_responses_from_registerFile_response1);
	PTHREAD_JOIN(receive_responses_from_registerFile_response2);

	PTHREAD_DECL(write_start_processor);
	PTHREAD_CREATE(write_start_processor);

	PTHREAD_JOIN(write_start_processor);	

	PTHREAD_DECL(read_processor_result);
	PTHREAD_CREATE(read_processor_result);

	PTHREAD_JOIN(read_processor_result);

	

#ifdef AA2C
	simple_proc_stop_daemons();
#endif





	return(0);
}