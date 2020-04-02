----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2020 08:01:57 PM
-- Design Name: 
-- Module Name: dathpath_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dathpath_tb is
--  Port ( );
end dathpath_tb;

architecture Behavioral of dathpath_tb is

-- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT datapath
    Port ( --datapath
           constIn : in std_logic_vector(15 downto 0);
           MBsel : in std_logic;
           dataIn : in std_logic_vector(15 downto 0);
           MDsel : in std_logic;
           
           --functionalUnit
--           A : in std_logic_vector(15 downto 0);
--           B : in std_logic_vector(15 downto 0);
           FS : in std_logic_vector(4 downto 0);
--           H : in std_logic_vector(1 downto 0);
           
           --registerFile
           Aaddr : in std_logic_vector(2 downto 0);
           Baddr : in std_logic_vector(2 downto 0);
           dest : in std_logic_vector(2 downto 0);
           enable : in std_logic;
           Clock : in std_logic;
--           data_src : in std_logic;
--           data : in std_logic_vector(15 downto 0);
           
            r0 : out std_logic_vector(15 downto 0);
            r1 : out std_logic_vector(15 downto 0);
            r2 : out std_logic_vector(15 downto 0);
            r3 : out std_logic_vector(15 downto 0);
            r4 : out std_logic_vector(15 downto 0);
            r5 : out std_logic_vector(15 downto 0);
            r6 : out std_logic_vector(15 downto 0);
            r7 : out std_logic_vector(15 downto 0);
           
           --out
           AdrOutA : out  STD_LOGIC_VECTOR (15 downto 0);
           AdrOutB : out  STD_LOGIC_VECTOR (15 downto 0);
           C : out  STD_LOGIC);
end component;

           --datapath
           signal constIn :  std_logic_vector(15 downto 0):= (others => '0');
           signal MBsel :  std_logic:= '0';
           signal dataIn :  std_logic_vector(15 downto 0):= (others => '0');
           signal MDsel :  std_logic:= '0';
           
           --functionalUnit
--           signal A :  std_logic_vector(15 downto 0):= (others => '0');
--           signal B :  std_logic_vector(15 downto 0):= (others => '0');
           signal FS :  std_logic_vector(4 downto 0):= (others => '0');
--           signal H :  std_logic_vector(1 downto 0):= (others => '0');
           
           --registerFile
           signal Aaddr :  std_logic_vector(2 downto 0):= (others => '0');
           signal Baddr :  std_logic_vector(2 downto 0):= (others => '0');
           signal dest :  std_logic_vector(2 downto 0):= (others => '0');
           signal enable :  std_logic:= '0';
           signal Clock :  std_logic:= '0';
--           signal data_src :  std_logic:= '0';
--           signal data :  std_logic_vector(15 downto 0):= (others => '0');
           
           signal r0 :  std_logic_vector(15 downto 0):= (others => '0');
           signal r1 :  std_logic_vector(15 downto 0):= (others => '0');
           signal r2 :  std_logic_vector(15 downto 0):= (others => '0');
           signal r3 :  std_logic_vector(15 downto 0):= (others => '0');
           signal r4 :  std_logic_vector(15 downto 0):= (others => '0');
           signal r5 :  std_logic_vector(15 downto 0):= (others => '0');
           signal r6 :  std_logic_vector(15 downto 0):= (others => '0');
           signal r7 :  std_logic_vector(15 downto 0):= (others => '0');
           
           --out
           signal AdrOutA :   STD_LOGIC_VECTOR (15 downto 0):= (others => '0');
           signal AdrOutB :   STD_LOGIC_VECTOR (15 downto 0):= (others => '0');
           signal C :   STD_LOGIC:= '0';
   
   --Clk
   constant Clk_period : time := 10 ns;

begin
-- Instantiate the Unit Under Test (UUT)
   uut: datapath PORT MAP (
          --datapath
           constIn => constIn,
           MBsel => MBsel,
           dataIn => dataIn,
           MDsel => MDsel,
           
           --functionalUnit
--           A => A,
--           B => B,
           FS => FS,
--           H => H,
           
           --registerFile
           Aaddr => Aaddr,
           Baddr => Baddr,
           dest => dest,
           enable => enable,
           Clock => Clock,
--           data_src => data_src,
--           data => data,
           
            r0 => r0,
            r1 => r1,
            r2 => r2,
            r3 => r3,
            r4 => r4,
            r5 => r5,
            r6 => r6,
            r7 => r7,
           
           --out
           AdrOutA => AdrOutA,
           AdrOutB => AdrOutB,
           C => C
        );

    process begin
        wait for Clk_period;
          Clock <= not Clock;
    end process;

   stim_proc: process
   begin		
      wait for Clk_period*2;
      enable <= '1';
      MDsel <= '1';
	  dest <= "000";
	  dataIn <= x"0000";
	  
	  wait for Clk_period*2;
      dest <= "001";
	  dataIn <= x"1111";
	  
	  wait for Clk_period*2;
	  dest <= "010";
	  dataIn <= x"2222";
	  
	  wait for Clk_period*2;
      FS <= "00001";
	  MDsel <= '0';
	  dest <= "000";
	  
	  wait for Clk_period*2;
	  MDsel <= '1';
	  dest <= "011";
	  dataIn <= x"3333";
	  
	  wait for Clk_period*2;
	  dest <= "100";
	  dataIn <= x"4444";
	  
	  wait for Clk_period*2;
	  dest <= "101";
	  dataIn <= x"5555";
	  
	  wait for Clk_period*2;
	  dest <= "110";
	  dataIn <= x"6666";
	  
	  
--	  wait for Clk_period*2;	 
--	  FS <= "00001";
--	  MDsel <= '0';
--	  dest <= "000";
	  
	  wait for Clk_period*2;
	  dest <= "111";
	  dataIn <= x"7777";
	  
	  wait for Clk_period*2;
	  
 --     wait;
   end process;

end Behavioral;