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
           srcA : in std_logic_vector(2 downto 0);
           srcB : in std_logic_vector(2 downto 0);
           dest : in std_logic_vector(2 downto 0);
           write : in std_logic;
           Clk : in std_logic;
--           data_src : in std_logic;
--           data : in std_logic_vector(15 downto 0);
           
            reg0 : out std_logic_vector(15 downto 0);
            reg1 : out std_logic_vector(15 downto 0);
            reg2 : out std_logic_vector(15 downto 0);
            reg3 : out std_logic_vector(15 downto 0);
            reg4 : out std_logic_vector(15 downto 0);
            reg5 : out std_logic_vector(15 downto 0);
            reg6 : out std_logic_vector(15 downto 0);
            reg7 : out std_logic_vector(15 downto 0);
           
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
           signal srcA :  std_logic_vector(2 downto 0):= (others => '0');
           signal srcB :  std_logic_vector(2 downto 0):= (others => '0');
           signal dest :  std_logic_vector(2 downto 0):= (others => '0');
           signal write :  std_logic:= '0';
           signal Clk :  std_logic:= '0';
--           signal data_src :  std_logic:= '0';
--           signal data :  std_logic_vector(15 downto 0):= (others => '0');
           
           signal reg0 :  std_logic_vector(15 downto 0):= (others => '0');
           signal reg1 :  std_logic_vector(15 downto 0):= (others => '0');
           signal reg2 :  std_logic_vector(15 downto 0):= (others => '0');
           signal reg3 :  std_logic_vector(15 downto 0):= (others => '0');
           signal reg4 :  std_logic_vector(15 downto 0):= (others => '0');
           signal reg5 :  std_logic_vector(15 downto 0):= (others => '0');
           signal reg6 :  std_logic_vector(15 downto 0):= (others => '0');
           signal reg7 :  std_logic_vector(15 downto 0):= (others => '0');
           
           --out
           signal AdrOutA :   STD_LOGIC_VECTOR (15 downto 0):= (others => '0');
           signal AdrOutB :   STD_LOGIC_VECTOR (15 downto 0):= (others => '0');
           signal C :   STD_LOGIC:= '0';
   
   --Clk
   constant Clk_period : time := 5 ns;

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
           srcA => srcA,
           srcB => srcB,
           dest => dest,
           write => write,
           Clk => Clk,
--           data_src => data_src,
--           data => data,
           
            reg0 => reg0,
            reg1 => reg1,
            reg2 => reg2,
            reg3 => reg3,
            reg4 => reg4,
            reg5 => reg5,
            reg6 => reg6,
            reg7 => reg7,
           
           --out
           AdrOutA => AdrOutA,
           AdrOutB => AdrOutB,
           C => C
        );

    process begin
        wait for Clk_period;
          Clk <= not Clk;
    end process;

   stim_proc: process
   begin		
      wait for Clk_period*2;
      write <= '1';
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