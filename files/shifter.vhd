----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2020 02:52:01 PM
-- Design Name: 
-- Module Name: shifter - Behavioral
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

entity shifter is
   Port (
        src_B : in std_logic_vector(15 downto 0);
        S0 : in std_logic;
        S1 : in std_logic;
        result : out std_logic_vector(15 downto 0));
end shifter;

architecture Behavioral of shifter is

COMPONENT multiplexer3_1 is
    Port (            
           S : in  std_logic_vector (1 downto 0);
           left : in std_logic;
           right : in std_logic;
           transfer : in std_logic;
           H : out std_logic);
end COMPONENT multiplexer3_1;


begin

    bit0: multiplexer3_1 PORT MAP(
        S(0) => S0,
        S(1) => S1,
        left => '0',
        right => src_B(1),
        transfer => src_B(0),
        H => result(0)
    );
    
    bit1: multiplexer3_1 PORT MAP(
        S(0) => S0,
        S(1) => S1,
        left => src_B(0),
        right => src_B(2),
        transfer => src_B(1),
        H => result(1)
    );
    
    bit2: multiplexer3_1 PORT MAP(
        S(0) => S0,
        S(1) => S1,
        left => src_B(1),
        right => src_B(3),
        transfer => src_B(2),
        H => result(2)
    );
    
    bit3: multiplexer3_1 PORT MAP(
        S(0) => S0,
        S(1) => S1,
        left => src_B(2),
        right => src_B(4),
        transfer => src_B(3),
        H => result(3)
    );
    
    bit4: multiplexer3_1 PORT MAP(
        S(0) => S0,
        S(1) => S1,
        left => src_B(3),
        right => src_B(5),
        transfer => src_B(4),
        H => result(4)
    );
    
    bit5: multiplexer3_1 PORT MAP(
        S(0) => S0,
        S(1) => S1,
        left => src_B(4),
        right => src_B(6),
        transfer => src_B(5),
        H => result(5)
    );
    
    bit6: multiplexer3_1 PORT MAP(
        S(0) => S0,
        S(1) => S1,
        left => src_B(5),
        right => src_B(7),
        transfer => src_B(6),
        H => result(6)
    );
    
    bit7: multiplexer3_1 PORT MAP(
        S(0) => S0,
        S(1) => S1,
        left => src_B(6),
        right => src_B(8),
        transfer => src_B(7),
        H => result(7)
    );
    
    bit8: multiplexer3_1 PORT MAP(
        S(0) => S0,
        S(1) => S1,
        left => src_B(7),
        right => src_B(9),
        transfer => src_B(8),
        H => result(8)
    );
    
    bit9: multiplexer3_1 PORT MAP(
        S(0) => S0,
        S(1) => S1,
        left => src_B(8),
        right => src_B(10),
        transfer => src_B(9),
        H => result(9)
    );
    
    bit10: multiplexer3_1 PORT MAP(
        S(0) => S0,
        S(1) => S1,
        left => src_B(9),
        right => src_B(11),
        transfer => src_B(10),
        H => result(10)
    );
    
    bit11: multiplexer3_1 PORT MAP(
        S(0) => S0,
        S(1) => S1,
        left => src_B(10),
        right => src_B(12),
        transfer => src_B(11),
        H => result(11)
    );
    
    bit12: multiplexer3_1 PORT MAP(
        S(0) => S0,
        S(1) => S1,
        left => src_B(11),
        right => src_B(13),
        transfer => src_B(12),
        H => result(12)
    );
    
    bit13: multiplexer3_1 PORT MAP(
        S(0) => S0,
        S(1) => S1,
        left => src_B(12),
        right => src_B(14),
        transfer => src_B(13),
        H => result(13)
    );
    
    bit14: multiplexer3_1 PORT MAP(
        S(0) => S0,
        S(1) => S1,
        left => src_B(13),
        right => src_B(15),
        transfer => src_B(14),
        H => result(14)
    );
    
    bit15: multiplexer3_1 PORT MAP(
        S(0) => S0,
        S(1) => S1,
        left => src_B(14),
        right => '0',
        transfer => src_B(15),
        H => result(15)
    );


end Behavioral;
