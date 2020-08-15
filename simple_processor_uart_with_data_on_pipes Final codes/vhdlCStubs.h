#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <Pipes.h>
#include <SocketLib.h>
void global_storage_initializer_();
void memory_daemon();
void processor();
uint32_t receive_from_uart();
void send_to_uart(uint32_t data_to_send);
