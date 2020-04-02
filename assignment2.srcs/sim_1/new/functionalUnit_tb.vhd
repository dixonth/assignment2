----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/04/2020 08:44:32 PM
-- Design Name: 
-- Module Name: functionalUnit_tb - Behavioral
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

entity functionalUnit_tb is
--  Port ( );
end functionalUnit_tb;

architecture Behavioral of functionalUnit_tb is

COMPONENT functionalUnit is
Port (
        A : in std_logic_vector(15 downto 0);
        B : in std_logic_vector(15 downto 0);
        Gsel : in std_logic_vector(3 downto 0);
        MF : in std_logic;
        H : in std_logic_vector(1 downto 0);
        F : out std_logic_vector(15 downto 0);
        Cout : out std_logic);
end COMPONENT functionalUnit;

--in
        signal A :  std_logic_vector(15 downto 0):= (others => '0');
        signal B :  std_logic_vector(15 downto 0):= (others => '0');
        signal Gsel :  std_logic_vector(3 downto 0):= (others => '0');
        signal MF :  std_logic:= '0';
        signal H :  std_logic_vector(1 downto 0):= (others => '0');
--out
        signal F :  std_logic_vector(15 downto 0):= (others => '0');
        signal Cout :  std_logic:= '0';

begin

uut: functionalUnit PORT MAP (
          A => A,
          B => B,
          Gsel => Gsel,
          MF => MF,
          H => H,
          F => F,
          Cout => Cout
        );

stim_proc: process
   begin
      A <= x"4444";
      B <= x"6666";
		
      wait for 10 ns;	
      Gsel <= "0010";
      

      wait for 10 ns;	
	  Gsel <= "1100";
      
      wait for 10 ns;	
	  MF <= '1';
      H <= "01";
      
      
end process;
end Behavioral;
