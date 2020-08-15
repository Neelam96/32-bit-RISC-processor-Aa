

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


// #define last_inst_addr 13
// #define last_mem_addr 22
// #define last_reg_init 25

// //static mem_array[] = {}

// void Exit(int sig)
// {
// 	fprintf(stderr, "## Break! ##\n");
// 	exit(0);
// }



// void initialMem(){
	
	
// 	//X[0] = 151061506;		//ADD 1, 4, 2
// 		uint64_t write_signal =0;
// 		uint64_t read_signal = 1;
// 		uint64_t idx =0;
// 		//uint64_t opcode_ADD = 9;
// 		//uint64_t opcode_LOAD = 3;

		

// 		// ////////////////////////////////////////////////////////////

// 		//------------------------------------------
// 		uint64_t opcode_LOAD =3<<24;
// 		uint64_t rs1_imm = 14<<16;
// 		uint64_t rs2 = 0<<8;
// 		uint64_t rd = 0;

// 		uint64_t addr = 1<<22;
// 		uint64_t wdata = (opcode_LOAD | rs1_imm | rs2 | rd)<<32;
// 		uint64_t write_request = wdata | addr | write_signal;
// 		write_uint64("accessMem_request",write_request);

// 		uint64_t read_request = (wdata | addr | read_signal );
// 		write_uint64("accessMem_request",read_request);

// 		//------------------------------------------
// 		 opcode_LOAD =3<<24;
// 		 rs1_imm = 15<<16;
// 		 rs2 = 0<<8;
// 		 rd = 1;

// 		 addr = 2<<22;
// 		 wdata = (opcode_LOAD | rs1_imm | rs2 | rd)<<32;
// 		 write_request = wdata | addr | write_signal;
// 		write_uint64("accessMem_request",write_request);

// 		 read_request = (wdata | addr | read_signal );
// 		write_uint64("accessMem_request",read_request);

// 		//------------------------------------------
// 		opcode_LOAD =3<<24;
// 		 rs1_imm = 16<<16;
// 		 rs2 = 0<<8;
// 		 rd = 2;

// 		 addr = 3<<22;
// 		 wdata = (opcode_LOAD | rs1_imm | rs2 | rd)<<32;
// 		 write_request = wdata | addr | write_signal;
// 		write_uint64("accessMem_request",write_request);

// 		 read_request = (wdata | addr | read_signal );
// 		write_uint64("accessMem_request",read_request);

// 		//------------------------------------------
// 		opcode_LOAD =3<<24;
// 		 rs1_imm = 17<<16;
// 		 rs2 = 0<<8;
// 		 rd = 3;

// 		 addr = 4<<22;
// 		 wdata = (opcode_LOAD | rs1_imm | rs2 | rd)<<32;
// 		 write_request = wdata | addr | write_signal;
// 		write_uint64("accessMem_request",write_request);

// 		 read_request = (wdata | addr | read_signal );
// 		write_uint64("accessMem_request",read_request);

// 		//------------------------------------------
// 		opcode_LOAD =3<<24;
// 		 rs1_imm = 18<<16;
// 		 rs2 = 0<<8;
// 		 rd = 4;

// 		 addr = 5<<22;
// 		 wdata = (opcode_LOAD | rs1_imm | rs2 | rd)<<32;
// 		 write_request = wdata | addr | write_signal;
// 		write_uint64("accessMem_request",write_request);

// 		 read_request = (wdata | addr | read_signal );
// 		write_uint64("accessMem_request",read_request);

// 		//------------------------------------------
// 		opcode_LOAD =3<<24;
// 		 rs1_imm = 19<<16;
// 		 rs2 = 0<<8;
// 		 rd = 5;

// 		 addr = 6<<22;
// 		 wdata = (opcode_LOAD | rs1_imm | rs2 | rd)<<32;
// 		 write_request = wdata | addr | write_signal;
// 		write_uint64("accessMem_request",write_request);

// 		 read_request = (wdata | addr | read_signal );
// 		write_uint64("accessMem_request",read_request);

// 		//------------------------------------------
// 		opcode_LOAD =3<<24;
// 		 rs1_imm = 20<<16;
// 		 rs2 = 0<<8;
// 		 rd = 6;

// 		 addr = 7<<22;
// 		 wdata = (opcode_LOAD | rs1_imm | rs2 | rd)<<32;
// 		 write_request = wdata | addr | write_signal;
// 		write_uint64("accessMem_request",write_request);

// 		 read_request = (wdata | addr | read_signal );
// 		write_uint64("accessMem_request",read_request);

// 		//------------------------------------------
// 		opcode_LOAD =3<<24;
// 		 rs1_imm = 21<<16;
// 		 rs2 = 0<<8;
// 		 rd = 7;

// 		 addr = 8<<22;
// 		 wdata = (opcode_LOAD | rs1_imm | rs2 | rd)<<32;
// 		 write_request = wdata | addr | write_signal;
// 		write_uint64("accessMem_request",write_request);

// 		 read_request = (wdata | addr | read_signal );
// 		write_uint64("accessMem_request",read_request);

// 		//------------------------------------------
// 		uint64_t opcode_ADD =9<<24;
// 		 rs1_imm = 3<<16;
// 		 rs2 = 7<<8;
// 		 rd = 3;

// 		 addr = 9<<22;
// 		 wdata = (opcode_ADD | rs1_imm | rs2 | rd)<<32;
// 		 write_request = wdata | addr | write_signal;
// 		write_uint64("accessMem_request",write_request);

// 		 read_request = (wdata | addr | read_signal );
// 		write_uint64("accessMem_request",read_request);
// 		//------------------------------------------
// 		 opcode_ADD =9<<24;
// 		 rs1_imm = 2<<16;
// 		 rs2 = 6<<8;
// 		 rd = 2;

// 		 addr = 10<<22;
// 		 wdata = (opcode_ADD | rs1_imm | rs2 | rd)<<32;
// 		 write_request = wdata | addr | write_signal;
// 		write_uint64("accessMem_request",write_request);

// 		 read_request = (wdata | addr | read_signal );
// 		write_uint64("accessMem_request",read_request);
// 		//------------------------------------------
// 		 opcode_ADD =9<<24;
// 		 rs1_imm = 1<<16;
// 		 rs2 = 5<<8;
// 		 rd = 1;

// 		 addr = 11<<22;
// 		 wdata = (opcode_ADD | rs1_imm | rs2 | rd)<<32;
// 		 write_request = wdata | addr | write_signal;
// 		write_uint64("accessMem_request",write_request);

// 		 read_request = (wdata | addr | read_signal );
// 		write_uint64("accessMem_request",read_request);
// 		//------------------------------------------
// 		 opcode_ADD =9<<24;
// 		 rs1_imm = 0<<16;
// 		 rs2 = 4<<8;
// 		 rd = 0;

// 		 addr = 12<<22;
// 		 wdata = (opcode_ADD | rs1_imm | rs2 | rd)<<32;
// 		 write_request = wdata | addr | write_signal;
// 		write_uint64("accessMem_request",write_request);

// 		 read_request = (wdata | addr | read_signal );
// 		write_uint64("accessMem_request",read_request);
// 		//------------------------------------------
// 		uint64_t opcode_HALT =1<<24;
// 		 rs1_imm = 1<<16;
// 		 rs2 = 4<<8;
// 		 rd = 0;

// 		 addr = 13<<22;
// 		 wdata = (opcode_HALT | rs1_imm | rs2 | rd)<<32;
// 		 write_request = wdata | addr | write_signal;
// 		write_uint64("accessMem_request",write_request);

// 		 read_request = (wdata | addr | read_signal );
// 		write_uint64("accessMem_request",read_request);

// 		// ///////////////////////////////////////////////////////////
// 		uint64_t two_raise_31 =2147483647;
// 			wdata = (two_raise_31 << 32);
// 			 addr = (14 << 22);
// 			 write_request = wdata | addr | write_signal;
// 			write_uint64("accessMem_request",write_request);

// 			 read_request = wdata | addr | read_signal;
// 			write_uint64("accessMem_request",read_request);
// //---------------------------------------------------------
// 			wdata = (two_raise_31 << 32);
// 			 addr = (15 << 22);
// 			 write_request = wdata | addr | write_signal;
// 			write_uint64("accessMem_request",write_request);

// 			 read_request = wdata | addr | read_signal;
// 			write_uint64("accessMem_request",read_request);

// 		for(idx =last_inst_addr+3 ; idx <=last_mem_addr; idx++){
// 			 wdata = (idx << 32);
// 			 addr = (idx << 22);
// 			 write_request = wdata | addr | write_signal;
// 			write_uint64("accessMem_request",write_request);

// 			 read_request = wdata | addr | read_signal;
// 			write_uint64("accessMem_request",read_request);
// 		}
		

		

// 		printf("Memory initialized\n");
// }

// void receive_responses_from_memory(){

// 			int idx=0;

// 		for(idx=1; idx <= 2*last_mem_addr; idx++){
// 			printf("Read ele from accessMem_response: %d\n",read_uint32("accessMem_response") );
// 		}

// }

// void initializeRegisterFile(){

// 	//X[0] = 151061506;		//ADD 1, 4, 2
// 		uint64_t write_signal =1;
// 		uint64_t valid_read =1;
// 		uint64_t idx =0;

// 		for(idx = 0; idx<last_reg_init;idx++){
// 			uint64_t reg_write_request =((write_signal<<40) | (idx <<32) | (idx));
// 			write_uint64("accessReg_request",reg_write_request);

// 			uint64_t reg_read_request = ((valid_read<<63) | (idx<<55));
// 			write_uint64("accessReg_request",reg_read_request);

// 		}

// 		printf("Register file initialized\n");
// }

// void receive_responses_from_registerFile_response1(){

// 			int idx=0;

// 		for(idx=0; idx < 2*last_reg_init; idx++){
// 			printf("Read ele from accessMem_response1: %d\n",read_uint32("accessReg_response1") );
// 		}

// }

// void receive_responses_from_registerFile_response2(){

// 			int idx=0;

// 		for(idx=0; idx < 2*last_reg_init; idx++){
// 			printf("Read ele from accessMem_response2: %d\n",read_uint32("accessReg_response2") );
// 		}

// }

// // Since blocking pipes are used so, we can read forever




// void write_start_processor(){

	

// 	uint8_t start = 1;
// 	write_uint8("start_processor",start);
// 	printf("Started processor\n");

// }
// void read_processor_result(){
// 	int idx;

// 	for(idx=0;idx < 24;idx++){

// 	uint32_t processor_res = read_uint32("processor_result");
// 	printf("processor result: %d\n", processor_res );
// 	}
// }





// DEFINE_THREAD(initialMem)
// DEFINE_THREAD(receive_responses_from_memory)
// DEFINE_THREAD(initializeRegisterFile)
// DEFINE_THREAD(receive_responses_from_registerFile_response1)
// DEFINE_THREAD(receive_responses_from_registerFile_response2)
// DEFINE_THREAD(write_start_processor)

// DEFINE_THREAD(read_processor_result)



// int main(int argc, char* argv[])
// {
	
// 	signal(SIGINT,  Exit);
//   	signal(SIGTERM, Exit);
// #ifdef AA2C
// 	init_pipe_handler();
// 	simple_proc_start_daemons (stdout, 0);
// #endif



// 	PTHREAD_DECL(initialMem);
// 	PTHREAD_CREATE(initialMem);

// 	PTHREAD_DECL(receive_responses_from_memory);
// 	PTHREAD_CREATE(receive_responses_from_memory);

// 	PTHREAD_JOIN(initialMem);
// 	PTHREAD_JOIN(receive_responses_from_memory);

// 	PTHREAD_DECL(initializeRegisterFile);
// 	PTHREAD_CREATE(initializeRegisterFile);

// 	PTHREAD_DECL(receive_responses_from_registerFile_response1);
// 	PTHREAD_CREATE(receive_responses_from_registerFile_response1);

// 	PTHREAD_DECL(receive_responses_from_registerFile_response2);
// 	PTHREAD_CREATE(receive_responses_from_registerFile_response2);

// 	PTHREAD_JOIN(initializeRegisterFile);
// 	PTHREAD_JOIN(receive_responses_from_registerFile_response1);
// 	PTHREAD_JOIN(receive_responses_from_registerFile_response2);

// 	PTHREAD_DECL(write_start_processor);
// 	PTHREAD_CREATE(write_start_processor);

// 	PTHREAD_JOIN(write_start_processor);	

// 	PTHREAD_DECL(read_processor_result);
// 	PTHREAD_CREATE(read_processor_result);

// 	PTHREAD_JOIN(read_processor_result);

	

// #ifdef AA2C
// 	simple_proc_stop_daemons();
// #endif





// 	return(0);
// }


int strbin2uint64(char* s) {
  register unsigned char *p = s;
  register unsigned int   r = 0;

  while (p && *p ) {
    r <<= 1;
    r += (unsigned int)((*p++) & 0x01);
  }
  return (uint64_t)r;
}


int strbin2uint32(char* s) {
  register unsigned char *p = s;
  register unsigned int   r = 0;

  while (p && *p ) {
    r <<= 1;
    r += (unsigned int)((*p++) & 0x01);
  }
  return (uint32_t)r;
}


void Exit(int sig)
{
	fprintf(stderr, "## Break! ##\n");
	exit(0);
}


unsigned long int power(int base, int exp) {
    if (exp == 0)
        return 1;
    else if (exp % 2)
        return base * power(base, exp - 1);
    else {
        unsigned long int temp = power(base, exp / 2);
        return temp * temp;
    }
}

uint64_t stringToNumber(char string1[9]){
	int i=0;
	uint64_t answer = 0;
	for (i = 0; i < 8; i++)
	{
		switch(string1[i]){
			case '0': answer+=0;
			break;
			case '1': answer+=power(16, 7-i);
			break;
			case '2': answer+=2*power(16, 7-i);
			break;
			case '3': answer+=3*power(16, 7-i);
			break;
			case '4': answer+=4*power(16, 7-i);
			break;
			case '5': answer+=5*power(16, 7-i);
			break;
			case '6': answer+=6*power(16, 7-i);
			break;
			case '7': answer+=7*power(16, 7-i);
			break;
			case '8': answer+=8*power(16, 7-i);
			break;
			case '9': answer+=9*power(16, 7-i);
			break;
			case 'a': answer+=10*power(16, 7-i);
			break;
			case 'b': answer+=11*power(16, 7-i);
			break;
			case 'c': answer+=12*power(16, 7-i);
			break;
			case 'd': answer+=13*power(16, 7-i);
			break;
			case 'e': answer+=14*power(16, 7-i);
			break;
			case 'f': answer+=15*power(16, 7-i);
			break;
		}
	}
	return answer;
}

void starting_processor(){
	uint8_t start =1;
	write_uint8("start_processor",start);
}

void Env_Writer()
{
		uint8_t Q[32]; 
		Q[0] = 0b01010101;
		Q[1] = 0b01010101;
		Q[2] = 0b01010101;
		Q[3] = 0b01010101;
		Q[4] = 0b01010101;
		Q[5] = 0b01010101;
		Q[6] = 0b01010101;
		Q[7] = 0b01010101;
		Q[8] = 0b01010101;
		Q[9] = 0b01010101;
		Q[10] = 0b01010101;
		Q[11] = 0b01010101;

		Q[12] = 0b01010101;
		Q[13] = 0b01010101;
		Q[14] = 0b01010101;
		Q[15] = 0b01010101;
		Q[16] = 0b01010101;
		Q[17] = 0b01010101;
		Q[18] = 0b01010101;
		Q[19] = 0b01010101;
		Q[20] = 0b01010101;
		Q[21] = 0b01010101;
		Q[22] = 0b01010101;
		Q[23] = 0b01010101;

		Q[24] = 0b01010101;
		Q[25] = 0b01010101;
		Q[26] = 0b01010101;
		Q[27] = 0b01010101;
		Q[28] = 0b01010101;
		Q[29] = 0b01010101;
		Q[30] = 0b01010101;
		Q[31] = 0b01010101;

		uint8_t W[1];
		int i=0;
		for (i = 0; i < 6; i++)
		{
			W[0] = Q[i];
			printf("Sending via UART %x \n", Q[i]);
			write_uint8_n("in_pipe", W, 1);
			//usleep(10);
		}
		
}
// both for C
void Env_Reader()
{	
	// int q=0;
	// while(1){	
	uint8_t i;	
		for (i =0 ; i<200;i++){
		uint8_t Q[1]; 
		read_uint8_n("out_pipe", Q, 1);
		printf("Received from UART: %x \n", Q[0]);
			}
	// }
	
}

void Acc_Writer()
{
	while(1){
	}
}

void Acc_Reader()
{
	while(1){		
	}
}


DEFINE_THREAD(starting_processor)
DEFINE_THREAD(Env_Writer)
DEFINE_THREAD(Env_Reader)
DEFINE_THREAD(Acc_Writer)
DEFINE_THREAD(Acc_Reader)



int main(int argc, char* argv[])
{
	signal(SIGINT,  Exit);
  	signal(SIGTERM, Exit);

  	

#ifdef AA2C
	init_pipe_handler();
	simple_proc_start_daemons (stdout, 0);
#endif

	PTHREAD_DECL(starting_processor)
	PTHREAD_CREATE(starting_processor)


	PTHREAD_DECL(Env_Writer);
	PTHREAD_CREATE(Env_Writer);
	PTHREAD_DECL(Env_Reader);
	PTHREAD_CREATE(Env_Reader);
	PTHREAD_DECL(Acc_Writer);
	PTHREAD_CREATE(Acc_Writer);
	PTHREAD_DECL(Acc_Reader);
	PTHREAD_CREATE(Acc_Reader);

	// PTHREAD_JOIN(Env_Writer)

	PTHREAD_JOIN(starting_processor)
	PTHREAD_JOIN(Env_Reader)
	// PTHREAD_JOIN(Acc_Writer)
	// PTHREAD_JOIN(Acc_Reader)

#ifdef AA2C
	simple_proc_stop_daemons();
#endif

	return(0);
}