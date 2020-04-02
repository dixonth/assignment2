----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/11/2020 06:10:30 PM
-- Design Name: 
-- Module Name: registerFile - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity registerFile is
Port (  srcA : in std_logic_vector(2 downto 0);
        srcB : in std_logic_vector(2 downto 0);
        des_A0 : in std_logic;
        des_A1 : in std_logic;
        des_A2 : in std_logic;
        Clk : in std_logic;
        write : in std_logic;
--        data_src : in std_logic;
--        data : in std_logic_vector(15 downto 0);
        FUout : in std_logic_vector(15 downto 0);
        reg0 : out std_logic_vector(15 downto 0);
        reg1 : out std_logic_vector(15 downto 0);
        reg2 : out std_logic_vector(15 downto 0);
        reg3 : out std_logic_vector(15 downto 0);
        reg4 : out std_logic_vector(15 downto 0);
        reg5 : out std_logic_vector(15 downto 0);
        reg6 : out std_logic_vector(15 downto 0);
        reg7 : out std_logic_vector(15 downto 0);
        Adata : out std_logic_vector(15 downto 0);
        Bdata : out std_logic_vector(15 downto 0));
end registerFile;

architecture Behavioral of registerFile is
-- components
-- 16 bit Register for register file
COMPONENT reg16
    PORT(
            D : in std_logic_vector(15 downto 0);
            load : in std_logic; 
            Clk : in std_logic;
            Q : out std_logic_vector(15 downto 0)
    );
END COMPONENT;

-- 3 to 8 Decoder
COMPONENT decoder3_8
    PORT(
            A0 : in std_logic;
            A1 : in std_logic;
            A2 : in std_logic;
            write : in std_logic;
            Q0 : out std_logic;
            Q1 : out std_logic;
            Q2 : out std_logic;
            Q3 : out std_logic;
            Q4 : out std_logic;
            Q5 : out std_logic;
            Q6 : out std_logic;
            Q7 : out std_logic
    );
END COMPONENT;
-- 8 to 1 line multiplexer
COMPONENT multiplexer
    PORT(
           src : in  STD_LOGIC_VECTOR (2 downto 0);
           in0 : in  STD_LOGIC_VECTOR (15 downto 0);
           in1 : in  STD_LOGIC_VECTOR (15 downto 0);
           in2 : in  STD_LOGIC_VECTOR (15 downto 0);
           in3 : in  STD_LOGIC_VECTOR (15 downto 0);
           in4 : in  STD_LOGIC_VECTOR (15 downto 0);
           in5 : in  STD_LOGIC_VECTOR (15 downto 0);
           in6 : in  STD_LOGIC_VECTOR (15 downto 0);
           in7 : in  STD_LOGIC_VECTOR (15 downto 0);
           z : out  STD_LOGIC_VECTOR (15 downto 0)
    );
END COMPONENT;

---- 2 to 1 line multiplexer
--COMPONENT multi2_16
--    PORT(
--            data_src : in  STD_LOGIC;
--            src_reg : in  STD_LOGIC_VECTOR (15 downto 0);
--            data : in  STD_LOGIC_VECTOR (15 downto 0);  
--            z : out  STD_LOGIC_VECTOR (15 downto 0)
--    );
--END COMPONENT;

-- signals
signal load_reg0, load_reg1, load_reg2, load_reg3, load_reg4, load_reg5, load_reg6, load_reg7 : std_logic;
signal reg0_q, reg1_q, reg2_q, reg3_q, reg4_q, reg5_q, reg6_q, reg7_q : std_logic_vector(15 downto 0);

begin
-- port maps ;-)
-- register 0
reg00: reg16 PORT MAP(
    D => FUout,
    load => load_reg0,
    Clk => Clk,
    Q => reg0_q
);

-- register 1
reg01: reg16 PORT MAP(
    D => FUout,
    load => load_reg1,
    Clk => Clk,
    Q => reg1_q
);

--register 2
reg02: reg16 PORT MAP(
    D => FUout,
    load => load_reg2,
    Clk => Clk,
    Q => reg2_q
);

-- register 3
reg03: reg16 PORT MAP(
    D => FUout,
    load => load_reg3,
    Clk => Clk,
    Q => reg3_q
);

--register 4
reg04: reg16 PORT MAP(
    D => FUout,
    load => load_reg4,
    Clk => Clk,
    Q => reg4_q
);
-- register 5
reg05: reg16 PORT MAP(
    D => FUout,
    load => load_reg5,
    Clk => Clk,
    Q => reg5_q
);

--register 6
reg06: reg16 PORT MAP(
    D => FUout,
    load => load_reg6,
    Clk => Clk,
    Q => reg6_q
);

-- register 7
reg07: reg16 PORT MAP(
    D => FUout,
    load => load_reg7,
    Clk => Clk,
    Q => reg7_q
);

-- Destination register decoder
des_decoder3_8 : decoder3_8 PORT MAP(
    A0 => des_A0,
    A1 => des_A1,
    A2 => des_A2,
    write => write,
    Q0 => load_reg0,
    Q1 => load_reg1,
    Q2 => load_reg2,
    Q3 => load_reg3,
    Q4 => load_reg4,
    Q5 => load_reg5,
    Q6 => load_reg6,
    Q7 => load_reg7
);

---- 2 to 1 Data source multiplexer
--data_src_multi2_16: multi2_16 PORT MAP(
--    data_src => data_src,
--    src_reg => FUout,
--    data => data,
--    z => data_src_mux_out
--);
-- 4 to 1 source register multiplexer
Inst_muultiplexerA: multiplexer PORT MAP(
    src => srcA,
    in0 =>  reg0_q,
    in1 =>  reg1_q,
    in2 =>  reg2_q,
    in3 =>  reg3_q,
    in4 =>  reg4_q,
    in5 =>  reg5_q,
    in6 =>  reg6_q,
    in7 =>  reg7_q,
    z => Adata
);

Inst_muultiplexerB: multiplexer PORT MAP(
    src => srcB,
    in0 =>  reg0_q,
    in1 =>  reg1_q,
    in2 =>  reg2_q,
    in3 =>  reg3_q,
    in4 =>  reg4_q,
    in5 =>  reg5_q,
    in6 =>  reg6_q,
    in7 =>  reg7_q,
    z => Bdata
);

reg0 <= reg0_q;
reg1 <= reg1_q;
reg2 <= reg2_q;
reg3 <= reg3_q;
reg4 <= reg4_q;
reg5 <= reg5_q;
reg6 <= reg6_q;
reg7 <= reg7_q;


end Behavioral;
