----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2023 05:46:04 PM
-- Design Name: 
-- Module Name: MicroProcessor - Behavioral
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

entity MicroProcessor is
    Port ( Res, Clk : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR(3 downto 0);
           Zero, Overflow : out STD_LOGIC;
           S_7Seg : out STD_LOGIC_VECTOR (6 downto 0));
           
end MicroProcessor;

architecture Behavioral of MicroProcessor is

    component InstructionDecoder
    Port ( JumpCheck : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR (11 downto 0);
           Reg1, Reg2, Jump : out STD_LOGIC_VECTOR(2 downto 0);
           LoadSel, OpSel, Jflag : out STD_LOGIC;
           Val : out STD_LOGIC_VECTOR(3 downto 0));
    end component;
    
    component ProgramROM
    Port ( Sel : in STD_LOGIC_VECTOR (2 downto 0);
           I : out STD_LOGIC_VECTOR (11 downto 0));
    end component;
    
    component ProgramCounter
    Port ( D : in STD_LOGIC_VECTOR(2 downto 0);
           Res, Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0));
    end component;
    
    component Adder3Bit
    Port ( A : in STD_LOGIC_VECTOR(2 downto 0);
           S : out STD_LOGIC_VECTOR(2 downto 0));
    end component;
    
    component Mux_2way_3bit
    Port ( Sel,Clk : in STD_LOGIC;
           A,B : in STD_LOGIC_VECTOR (2 downto 0);
           Y : out STD_LOGIC_VECTOR(2 downto 0));
    end component;
    
    component Mux_2way_4bit
    Port ( Sel, Clk : in STD_LOGIC;
           A,B : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR(3 downto 0));
    end component;
    
    component Mux_8way_4bit
    Port ( Clk : in STD_LOGIC;
           Sel : in STD_LOGIC_VECTOR (2 downto 0);
           A,B,C,D,E,F,G,H : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR(3 downto 0));
    end component;
    
    component RegisterBank
    Port ( D : in STD_LOGIC_VECTOR(3 downto 0);
           RegSel : in STD_LOGIC_VECTOR(2 downto 0);
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           R0, R1, R2, R3, R4, R5, R6, R7 : out STD_LOGIC_VECTOR(3 downto 0));
    end component;
    
    component AdderSubtracter
    Port ( A,B : in STD_LOGIC_VECTOR(3 downto 0);
           C_in, Ctrl : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR(3 downto 0);
           C_out, Zero, Overflow : out STD_LOGIC);
    end component;
    
    component Display
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           S_7Seg : out STD_LOGIC_VECTOR (6 downto 0));
    end component;
    
    SIGNAL Jflag, JumpCheck, LoadSel, OpSel : std_logic;
    -- Jflag - this signal indicates whether a jump is called
    -- JumpCheck - this signal checks whether register is empty to jump
    -- LoadSel - this signal is sent to the 2 way 4 bit mux as the selecter
    -- OpSel - this signal is sent to the Adder Subtracter unit to select the operation
    
    SIGNAL C_out : std_logic;
    -- C_out - this is a internal signal generated by the Adder Subtracter unit indicating whether there is carry out
    
    SIGNAL T, R, R0, R1, R2, R3, R4, R5, R6, R7, M1, M2, D : std_logic_vector(3 downto 0);
    -- T - this is 4 bit bus connecting Instruction Decoder to 2 way 4 bit mux
    -- R - this is 4 bit bus connecting 2 way 4 bit mux to Register Bank
    -- R(0-7) - these are 4 bit busses connecting the individual registers to the 8 way 4 bit mux
    -- M1,M2 - these are 4 bit buses connecting the two 8 way 4 bit mux to the Adder Subtracter unit
    -- D - this is a 4 bit bus connecting the output of Adder Subtracter unit to 2 way 4 bit mux
    
    SIGNAL Sel,P, A, J, RS1, RS2 : std_logic_vector(2 downto 0);
    -- Sel - this is a 3 bit bus connecting Program Counter to Program ROM and 3 Bit Adder
    -- P - this is a 3 bit bus connecting 2 way 3 bit mux to the Program Counter
    -- A - this is a 3 bit bus connecting 3 bit Adder to 2 way 3 bit mux
    -- J - this is a 3 bit bus connecting Instruction Decoder to 2 way 3 bit mux
    -- RS1, RS2 - these are signals sent by Instruction Decoder to the two 8 way 4 bit mux as selecters
    
    SIGNAL I : std_logic_vector(11 downto 0);
    -- I - this is a 12 bit bus connecting Program ROM to Instruction Decoder
    
begin
    IntructionDecoder_0 : InstructionDecoder
        PORT MAP(
        JumpCheck => JumpCheck,
        A => I,
        Reg1 => RS1,
        Reg2 => RS2,
        Jump => J,
        LoadSel => LoadSel,
        OpSel => OpSel,
        Jflag => Jflag,
        Val => T);
    
    ProgramROM_0 : ProgramROM
        PORT MAP(
        Sel => Sel,
        I => I);
        
    ProgramCounter_0 : ProgramCounter
        PORT MAP(
        D => P,
        Res => Res,
        Clk => Clk,
        Q => Sel);
        
    Adder3Bit_0 : Adder3Bit
        PORT MAP(
        A => Sel,
        S => A);
        
    Mux_2way_3bit_0 : Mux_2way_3bit
        PORT MAP(
        Sel => Jflag,
        Clk => Clk,
        A => A,
        B => J,
        Y => P);
        
    Mux_2way_4bit_0 : Mux_2way_4bit
        PORT MAP(
        Sel => LoadSel,
        Clk => Clk,
        A => D,
        B => T,
        Y => R);
            
    RegisterBank_0 : RegisterBank
        PORT MAP(
        D => R,
        RegSel => RS1,
        Res => Res,
        Clk => Clk,
        R0 => R0,
        R1 => R1,
        R2 => R2,
        R3 => R3,
        R4 => R4,
        R5 => R5,
        R6 => R6,
        R7 => R7 );
        
    Mux_8way_4bit_0 : Mux_8way_4bit
        PORT MAP(
        Sel => RS1,
        Clk => Clk,
        A => R0,
        B => R1,
        C => R2,
        D => R3,
        E => R4,
        F => R5,
        G => R6,
        H => R7,
        Y => M1);
                
    Mux_8way_4bit_1 : Mux_8way_4bit
        PORT MAP(
        Sel => RS2,
        Clk => Clk,
        A => R0,
        B => R1,
        C => R2,
        D => R3,
        E => R4,
        F => R5,
        G => R6,
        H => R7,
        Y => M2);
                            
    AdderSubtracter_0 : AdderSubtracter
        PORT MAP(
        A => M2,
        B => M1,
        C_in => '0',
        Ctrl => OpSel,
        S => D,
        C_out => C_out, 
        Zero => Zero,  
        Overflow => Overflow);
        
    Display_0 : Display
        PORT MAP(
        A => R7,
        S_7Seg => S_7Seg);

    process(Clk,Sel)
        begin
            if (rising_edge(Clk)) then
            case M1 is
                when "0000" =>  JumpCheck <= '1';
                when others =>  Jumpcheck <= '0';
            end case;
            end if;
    end process;
    
    S <= R7;
end Behavioral;
