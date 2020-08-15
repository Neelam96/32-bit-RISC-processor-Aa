#include <vhdlCStubs.h>
void global_storage_initializer_()
{
char buffer[1024];  char* ss;  sprintf(buffer, "call global_storage_initializer_ ");
append_int(buffer,0); ADD_SPACE__(buffer);
append_int(buffer,0); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
return;
}
void memory_daemon()
{
char buffer[1024];  char* ss;  sprintf(buffer, "call memory_daemon ");
append_int(buffer,0); ADD_SPACE__(buffer);
append_int(buffer,0); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
return;
}
void processor()
{
char buffer[1024];  char* ss;  sprintf(buffer, "call processor ");
append_int(buffer,0); ADD_SPACE__(buffer);
append_int(buffer,0); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
return;
}
uint32_t receive_from_uart()
{
char buffer[1024];  char* ss;  sprintf(buffer, "call receive_from_uart ");
append_int(buffer,0); ADD_SPACE__(buffer);
append_int(buffer,1); ADD_SPACE__(buffer);
append_int(buffer,32); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
uint32_t receive_data_from_uart = get_uint32_t(buffer,&ss);
return(receive_data_from_uart);
}
void send_to_uart(uint32_t data_to_send)
{
char buffer[1024];  char* ss;  sprintf(buffer, "call send_to_uart ");
append_int(buffer,1); ADD_SPACE__(buffer);
append_uint32_t(buffer,data_to_send); ADD_SPACE__(buffer);
append_int(buffer,0); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
return;
}
