----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/04/2020 04:53:50 PM
-- Design Name: 
-- Module Name: logic - Behavioral
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

entity logic is
    port(S0 : in std_logic;
         S1 : in std_logic;
         A  : in std_logic;
         B  : in std_logic;
         Y  : out std_logic
         );
end logic;

architecture Behavioral of logic is

COMPONENT multiplexer4_1 is
    Port ( S : in  STD_LOGIC_VECTOR (1 downto 0);
           opAND : in  std_logic;
           opOR : in  std_logic;
           opXOR : in  std_logic;
           opNOT : in  std_logic;
           z : out  std_logic);
end COMPONENT multiplexer4_1;

signal opAND, opOR, opXOR, opNOT : std_logic;
signal S :  std_logic_vector(1 downto 0);

begin
    opAND <= (A and B) after 1ns;
    opOR <= (A or B) after 1ns;
    opXOR <= (A xor B) after 1ns;
    opNOT <= (not A) after 1ns;
    S(0) <= S0;
    S(1) <= S1;
    
     multiplex: multiplexer4_1 PORT MAP(
        S => S,
        opAND => opAND,
        opOR => opOR,
        opXOR => opXOR,
        opNOT => opNOT,
        z => Y
    );
end Behavioral;