----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/04/2020 05:52:38 PM
-- Design Name: 
-- Module Name: logicUnit_tb - Behavioral
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

entity logicUnit_tb is
--  Port ( );
end logicUnit_tb;

architecture Behavioral of logicUnit_tb is

COMPONENT logicUnit is
   Port (
        src_A : in std_logic_vector(15 downto 0);
        src_B : in std_logic_vector(15 downto 0);
        S0 : in std_logic;
        S1 : in std_logic;
        result : out std_logic_vector(15 downto 0));
end COMPONENT logicUnit;

--in
        signal src_A :  std_logic_vector(15 downto 0):= (others => '0');
        signal src_B :  std_logic_vector(15 downto 0):= (others => '0');
        signal S0 :  std_logic:= '0';
        signal S1 :  std_logic:= '0';
--out
        signal result :  std_logic_vector(15 downto 0):= (others => '0');

begin

uut: logicUnit PORT MAP(
        src_A => src_A,
        src_B => src_B,
        S0 => S0,
        S1 => S1,
        result => result
        );
        
        stim_proc: process
   begin		
	  src_A <= x"2222";
	  src_B <= x"6666";
		
      wait for 10 ns;	
      S0 <= '0';
      S1 <= '0';

      wait for 10 ns;	
	  S0 <= '0';
      S1 <= '1';
      
      wait for 10 ns;	
	  S0 <= '1';
      S1 <= '0';
      
      wait for 10 ns;	
      S0 <= '1';
      S1 <= '1';
      
end process;

end Behavioral;
