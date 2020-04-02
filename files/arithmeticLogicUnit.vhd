----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/02/2020 07:09:58 PM
-- Design Name: 
-- Module Name: arithmeticLogicUnit - Behavioral
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

entity arithmeticLogicUnit is
Port (
        A : in std_logic_vector(15 downto 0);
        B : in std_logic_vector(15 downto 0);
        S : in std_logic_vector(2 downto 0);
        Cin : in std_logic;
        G : out std_logic_vector(15 downto 0);
        Cout : out std_logic);
end arithmeticLogicUnit;

architecture Behavioral of arithmeticLogicUnit is

COMPONENT arithmeticUnit 
   Port (
        src_B : in std_logic_vector(15 downto 0);
        S0 : in std_logic;
        S1 : in std_logic;
        result : out std_logic_vector(15 downto 0));
end COMPONENT arithmeticUnit;

COMPONENT logicUnit 
   Port (
        src_A : in std_logic_vector(15 downto 0);
        src_B : in std_logic_vector(15 downto 0);
        S0 : in std_logic;
        S1 : in std_logic;
        result : out std_logic_vector(15 downto 0));
end COMPONENT logicUnit;

COMPONENT adder_16 
    port(B, A : in std_logic_vector(15 downto 0);
        C0 : in std_logic;
        S : out std_logic_vector(15 downto 0);
        C15: out std_logic);
end COMPONENT adder_16;

COMPONENT multiplexer2_1 is
    Port ( S : in std_logic;
           arith : in  std_logic_vector (15 downto 0);
           log : in  std_logic_vector (15 downto 0);
           z : out  std_logic_vector (15 downto 0));
end COMPONENT multiplexer2_1;

signal arithmeticB, logicR, arithmeticR : std_logic_vector(15 downto 0);

begin

logic: logicUnit PORT MAP(
    src_A => A,
    src_B => B,
    S0 => S(0),
    S1 => S(1),
    result => logicR
);


arithmetic: arithmeticUnit PORT MAP(
    src_B => B,
    S0 => S(0),
    S1 => S(1),
    result => arithmeticB
);

adder: adder_16 PORT MAP(
    A => A,
    B => arithmeticB,
    C0 => Cin,
    S => arithmeticR,
    C15 => Cout
);

multiplex2: multiplexer2_1 PORT MAP(
        S => S(2),
        arith => arithmeticR,
        log => logicR,
        z => G
    );


end Behavioral;
