----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/04/2020 01:31:06 PM
-- Design Name: 
-- Module Name: arithmeticLogicUnit_tb - Behavioral
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

entity arithmeticLogicUnit_tb is
--  Port ( );
end arithmeticLogicUnit_tb;

architecture Behavioral of arithmeticLogicUnit_tb is

COMPONENT arithmeticLogicUnit is
Port (
        A : in std_logic_vector(15 downto 0);
        B : in std_logic_vector(15 downto 0);
        S : in std_logic_vector(2 downto 0);
        Cin : in std_logic;
        G : out std_logic_vector(15 downto 0);
        Cout : out std_logic);
end COMPONENT arithmeticLogicUnit;

--in
        signal A :  std_logic_vector(15 downto 0):= (others => '0');
        signal B :  std_logic_vector(15 downto 0):= (others => '0');
        signal S :  std_logic_vector(2 downto 0):= (others => '0');
        signal Cin :  std_logic:= '0';
--out
        signal G :  std_logic_vector(15 downto 0):= (others => '0');
        signal Cout :  std_logic:= '0';

begin

uut: arithmeticLogicUnit PORT MAP (
          A => A,
          B => B,
          S => S,
          Cin => Cin,
          G => G,
          Cout => Cout
        );

stim_proc: process
   begin
      A <= x"4444";
      B <= x"6666";
		
      wait for 10 ns;	
      S(0) <= '0';
      S(1) <= '0';

      wait for 10 ns;	
	  S(0) <= '0';
      S(1) <= '1';
      
      wait for 10 ns;	
	  S(0) <= '1';
      S(1) <= '0';
      
      wait for 10 ns;	
      S(0) <= '1';
      S(1) <= '1';
      
      wait for 10 ns;	
      S(2) <= '1';
      
      
end process;
end Behavioral;
