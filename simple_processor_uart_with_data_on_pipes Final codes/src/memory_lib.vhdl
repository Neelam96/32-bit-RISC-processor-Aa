library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dual_port_u32_ram_with_init is
   generic (g_addr_width: natural := 8);
   port (
       datain_0 : in std_logic_vector(32-1 downto 0);
         dataout_0: out std_logic_vector(32-1 downto 0);
         addrin_0: in std_logic_vector(g_addr_width-1 downto 0);
         enable_0: in std_logic;
         writebar_0 : in std_logic;
       datain_1 : in std_logic_vector(32-1 downto 0);
         dataout_1: out std_logic_vector(32-1 downto 0);
         addrin_1: in std_logic_vector(g_addr_width-1 downto 0);
         enable_1: in std_logic;
         writebar_1 : in std_logic;
         clk: in std_logic;
         reset : in std_logic);
end entity dual_port_u32_ram_with_init;


architecture XilinxBramInfer of dual_port_u32_ram_with_init is

  type U32Array is array (natural range <>) of std_logic_vector(31 downto 0);

  -- signal mem-array with initial value for Vivado.
  --IMPORTANT
  --signal mem_array : U32Array(0 to (2**g_addr_width)-1):=  (
    --0 => X"02ff0000", 
    --1 => X"02fe0001", 
    --2 => X"02fd0003", 
    --3 => X"02fc0004", 
    --4 => X"02fb0205", 
    --5 => X"02fa0006", 
    --6 => X"02f90307",
    --7 => X"02f80008", 
    --8 => X"02f70009", 
    --9 => X"02f6000a", 
    --10 => X"02f5000b",

    --11 => X"03010002", 
    --12 => X"04030200", 
    --13 => X"03010002", 
    --14 => X"04040200", 
    --15 => X"03010002", 
    --16 => X"04050200", 
    --17 => X"03010002", 
    --18 => X"04060200", 
    --19 => X"03010002", 
    --20 => X"04070200",
    --21 => X"03010002", 
    --22 => X"04080200", 

    --23 => X"0305000c", 
    --24 => X"0308000d", 
    --25 => X"090c0d0e", 
    --26 => X"040b0e00",

    --27 => X"0304000c", 
    --28 => X"0307000d", 
    --29 => X"090c0d0f", 
    --30 => X"040a0f00",

    --31 => X"0303000c", 
    --32 => X"0306000d", 
    --33 => X"090c0d10", 
    --34 => X"04091000", 

    --35 => X"04001000",
    --36 => X"04000f00",
    --37 => X"04000e00",

    --38 => X"02000011",
    --39 => X"09111112", 
    --40 => X"11110000",
    --others => X"00000001");

--------------------------------------------------------
--signal mem_array : U32Array(0 to (2**g_addr_width)-1):=  (
	--0 => X"02200002",
	--1 => X"02000000",
	--2 => X"02090004",
	--3 => X"09020409",
	--4 => X"04090900",
	----5 => X"030900FE",
	--5 => X"01000000",
	--others => X"00000001");
--------------------------------------------------------
--signal mem_array : U32Array(0 to (2**g_addr_width)-1):=  (
	--0 => X"02_FE_00_01",
	--1 => X"02_30_00_07",
	--2 => X"02_31_00_08",
	--3 => X"02_01_00_09",
	--4 => X"02_33_00_12",
	--5 => X"09_07_08_11",
	--6 => X"09_11_09_11",
	--7 => X"04_01_08_00",
	--8 => X"01_00_00_00",
	----8 => X"0E050700",
	----9 => X"01000000",
	--others => X"00000001");
--------------------------------------------------------
signal mem_array : U32Array(0 to (2**g_addr_width)-1):=  (
	0 => X"02_30_00_03",
	1 => X"02_31_00_02",
	2 => X"02_32_00_01",
	3 => X"02_33_00_00",
	4 => X"02_31_00_04",
	5 => X"02_32_00_05",
	6 => X"02_33_00_06",
	7 => X"02_34_00_07",
	8 => X"09_00_04_08",
	9 => X"09_01_05_09",
	10 => X"09_02_06_10",
	11 => X"09_03_07_11",
	12 => X"01_00_00_00",
	others => X"00000001");
--------------------------------------------------------

  signal addr_reg_0, addr_reg_1 : std_logic_vector(g_addr_width-1 downto 0);
  signal rd_enable_reg_0, rd_enable_reg_1 : std_logic;
  signal read_data_0, read_data_reg_0: std_logic_vector(32-1 downto 0);
  signal read_data_1, read_data_reg_1: std_logic_vector(32-1 downto 0);
begin  -- XilinxBramInfer

  -- read/write process
  process(clk,addrin_0,enable_0,writebar_0, datain_0, addrin_1, enable_1, writebar_1, datain_1)
  begin

    -- synch read-write memory
    if(clk'event and clk ='1') then

      -- register the address
  -- and use it in a separate assignment
  -- for the delayed read.
      addr_reg_0 <= addrin_0;
      addr_reg_1 <= addrin_1;

  -- generate a registered read enable
      if(reset = '1') then
  rd_enable_reg_0 <= '0';
  rd_enable_reg_1 <= '0';
      else
  rd_enable_reg_0 <= enable_0 and writebar_0;
  rd_enable_reg_1 <= enable_1 and writebar_1;
      end if;

      if(enable_0 = '1' and writebar_0 = '0') then
        mem_array(To_Integer(unsigned(addrin_0))) <= datain_0;
      end if;
      if(enable_1 = '1' and writebar_1 = '0') then
        mem_array(To_Integer(unsigned(addrin_1))) <= datain_1;
      end if;
    end if;
  end process;

  -- read data.
  read_data_0 <= mem_array(To_Integer(unsigned(addr_reg_0)));
  read_data_1 <= mem_array(To_Integer(unsigned(addr_reg_1)));
  process(clk) 
  begin
  if(clk'event and clk = '1') then
    if(rd_enable_reg_0 = '1') then
      read_data_reg_0 <= read_data_0;
    end if;
    if(rd_enable_reg_1 = '1') then
      read_data_reg_1 <= read_data_1;
    end if;
  end if;
  end process;

  -- to maintain dataout to the last value that was read!
  dataout_0 <= read_data_0 when (rd_enable_reg_0 = '1') else read_data_reg_0;
  dataout_1 <= read_data_1 when (rd_enable_reg_1 = '1') else read_data_reg_1;

end XilinxBramInfer;


--
library ieee;
use ieee.std_logic_1164.all;

package memory_libComponents is

 component memory_daemon is -- 
  generic (tag_length : integer);
  port ( -- 
    mem_in_pipe_read_req : out  std_logic_vector(0 downto 0);
    mem_in_pipe_read_ack : in   std_logic_vector(0 downto 0);
    mem_in_pipe_read_data : in   std_logic_vector(63 downto 0);
    mem_out_pipe_write_req : out  std_logic_vector(0 downto 0);
    mem_out_pipe_write_ack : in   std_logic_vector(0 downto 0);
    mem_out_pipe_write_data : out   std_logic_vector(31 downto 0);
    --mem_out_uart_pipe_read_req : out  std_logic_vector(0 downto 0);
    --mem_out_uart_pipe_read_ack : in   std_logic_vector(0 downto 0);
    --mem_out_uart_pipe_read_data : out   std_logic_vector(32 downto 0);
    tag_in: in std_logic_vector(tag_length-1 downto 0);
    tag_out: out std_logic_vector(tag_length-1 downto 0) ;
    clk : in std_logic;
    reset : in std_logic;
    start_req : in std_logic;
    start_ack : out std_logic;
    fin_req : in std_logic;
    fin_ack   : out std_logic-- 
  );
  -- 
 end component memory_daemon;

end memory_libComponents;


library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library memory_lib;
use memory_lib.memory_libComponents.all;
entity memory_daemon is -- 
  generic (tag_length : integer);
  port ( -- 
    mem_in_pipe_read_req : out  std_logic_vector(0 downto 0);
    mem_in_pipe_read_ack : in   std_logic_vector(0 downto 0);
    mem_in_pipe_read_data : in   std_logic_vector(63 downto 0);
    mem_out_pipe_write_req : out  std_logic_vector(0 downto 0);
    mem_out_pipe_write_ack : in   std_logic_vector(0 downto 0);
    mem_out_pipe_write_data : out   std_logic_vector(31 downto 0);
    --mem_out_uart_pipe_read_req : out  std_logic_vector(0 downto 0);
    --mem_out_uart_pipe_read_ack : in   std_logic_vector(0 downto 0);
    --mem_out_uart_pipe_read_data : out   std_logic_vector(32 downto 0);
    tag_in: in std_logic_vector(tag_length-1 downto 0);
    tag_out: out std_logic_vector(tag_length-1 downto 0) ;
    clk : in std_logic;
    reset : in std_logic;
    start_req : in std_logic;
    start_ack : out std_logic;
    fin_req : in std_logic;
    fin_ack   : out std_logic-- 
  );
  -- 
end entity memory_daemon;


architecture memory_daemon_arch of memory_daemon is -- 
	component dual_port_u32_ram_with_init is
	   generic (g_addr_width: natural := 8);  -- Changed from 10 to 8
	   port (
	    	 datain_0 : in std_logic_vector(32-1 downto 0);  -- Changed from 8 to 32
	         dataout_0: out std_logic_vector(32-1 downto 0);
	         addrin_0: in std_logic_vector(g_addr_width-1 downto 0);
	         enable_0: in std_logic;
	         writebar_0 : in std_logic;
	    	 datain_1 : in std_logic_vector(32-1 downto 0);
	         dataout_1: out std_logic_vector(32-1 downto 0);
	         addrin_1: in std_logic_vector(g_addr_width-1 downto 0);
	         enable_1: in std_logic;
	         writebar_1 : in std_logic;
	         clk: in std_logic;
	         reset : in std_logic);
	end component;
 
signal mem_in_available, enable_1_sig : std_logic;
signal mem_in_received_data : std_logic_vector(64-1 downto 0);
signal mem_in_data, datain_1_sig, mem_in_out, dataout_1_sig, mem_out_data : std_logic_vector(32-1 downto 0);
signal mem_in_addr, addrin_1_sig : std_logic_vector(8-1 downto 0);
signal mem_in_read_write_bar, writebar_1_sig, mem_out_writing : std_logic;
begin --  
	-- start_req handling
	start_ack <= '1'; -- LATER
	fin_ack <= '0'; -- LATER
    tag_out <= (others => '0'); --LATER

	mem_in_available <= '1' when (mem_in_pipe_read_ack(0) = '1') else '0';
	mem_in_received_data <= mem_in_pipe_read_data;
	mem_in_data <= mem_in_received_data(31 downto 0);
	mem_in_addr <= mem_in_received_data(62 downto 55);		--changed
	mem_in_read_write_bar <= mem_in_received_data(63);
	
	dpram : dual_port_u32_ram_with_init port map (
		datain_0 => mem_in_data,
        dataout_0 => mem_out_data,
        addrin_0 => mem_in_addr,
        enable_0 => mem_in_available,
        writebar_0 => mem_in_read_write_bar,
    	datain_1 => datain_1_sig,
        dataout_1 => dataout_1_sig,
        addrin_1 => addrin_1_sig,
        enable_1 => enable_1_sig,
        writebar_1 => writebar_1_sig,
        clk => clk,
        reset => reset	
	);
  
  process(clk, mem_in_read_write_bar, mem_in_available, mem_out_data, mem_in_pipe_read_ack, mem_out_writing) 
  begin
  if(clk'event and clk = '1') then
if ((mem_in_read_write_bar = '1') and (mem_in_available = '1')) then		--mem_in_read_write_bar = '0' condition changed
      mem_out_writing <= '1';
    else
      mem_out_writing <= '0';
    end if;
  end if;
  end process;

  mem_out_pipe_write_data <= mem_out_data;
  mem_out_pipe_write_req(0) <= '1' when (mem_out_writing = '1') else '0';

  mem_in_pipe_read_req(0) <= mem_in_available and mem_out_pipe_write_ack(0);
	
end memory_daemon_arch;
