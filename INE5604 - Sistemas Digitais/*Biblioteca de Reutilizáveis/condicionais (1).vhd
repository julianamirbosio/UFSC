Combinacionais:

entity switch is
    generic(width: positive);
    port(
        input0, input1: in std_logic_vector(width-1 downto 0);
        sel: in std_logic_vector(1 downto 0);
        output0, output1: out std_logic_vector(width-1 downto 0)
    );
end entity;

entity shifterRotator is
    generic(
        width: positive;
        toLeft: boolean:= false;
        toRight: boolean:= false;
        isShifter: boolean := true;
        isLogical: boolean := true;
        bitsToShift: positive := 1;
        useInputFrom: boolean:= false);
    port(
        input: in std_logic_vector(width-1 downto 0);
        inputFromLeft, inputFromRigth: in std_logic_vector(bitsToShift-1 downto 0);
        output: out std_logic_vector(width-1 downto 0)
    );
end entity;

entity multiplier is
    generic(    width: positive);
    port(    input0, input1: in std_logic_vector(width-1 downto 0);
            output: out std_logic_vector(2*width-1 downto 0) );
end entity;

entity multiplexerNx1 is
    generic(    width: positive;
                N: positive ); -- N = numInputs
    port(    allInputs: in std_logic_vector(N*width-1 downto 0);
            sel: in std_logic_vector(integer(ceil(log2(real(N))))-1 downto 0);
            output: out std_logic_vector(width-1 downto 0) );
end entity;

entity multiplexer2x1 is
    generic(    width: positive );
    port(    input0, input1: in std_logic_vector(width-1 downto 0);
            sel: in std_logic;
            output: out std_logic_vector(width-1 downto 0) );
end entity;

entity grayEncoder is
    generic(    width: positive);
    port(    binInput: in std_logic_vector(width-1 downto 0);
            grayOutput: out std_logic_vector(width-1 downto 0) );
end entity;

entity grayDecoder is
    generic(    width: positive );
    port(    grayInput: in std_logic_vector(width-1 downto 0);
            binOutput: out std_logic_vector(width-1 downto 0) );
end entity;

entity fulladder1bit is
    port(
        cin, a, b: in std_logic;
        sum: out std_logic;
        cout: out std_logic
    );
end entity;

entity divider is
    generic(    width: positive := 8;
            generateRemainder: boolean := true;
            isSigned: boolean := false);
    port(    
        a, b: in std_logic_vector(width - 1 downto 0);
        result: out std_logic_vector(width - 1 downto 0);
        rout: out std_logic_vector(width - 1 downto 0) );
end entity;

entity compare is
    generic(    width: positive;
                isSigned: boolean := false;
                generateEqual: boolean := false ;
                generateLessThan: boolean := false;
                useFixedSecodOperand: boolean := false;
                fixedSecodOperand: integer := 0 );
    port(    input0, input1: in std_logic_vector(width-1 downto 0);
            lessThan, equal: out std_logic );
end entity;

entity binaryEncoder is
    generic(    inputWidth: positive;
                priorityMSB: boolean := false;
                generateValid: boolean := false );
    port(    input: in std_logic_vector(inputWidth-1 downto 0);
            valid: out std_logic;
            output: out std_logic_vector(integer(ceil(log2(real(inputWidth))))-1 downto 0) );
end entity;

entity binaryDecoder is
    generic(inputWidth: positive);
    port(    input: in std_logic_vector(inputWidth-1 downto 0);
            output: out std_logic_vector(2**inputWidth-1 downto 0));
end entity;

entity barrelShifter is
    generic(    width: positive;
                toLeft: boolean := false;
                toRigth: boolean := false);
    port(    input: in std_logic_vector(width-1 downto 0);
            direction: in std_logic; --0:toLeft , 1:toRigth
            shift: in std_logic_vector(integer(ceil(log2(real(width))))-1 downto 0);
            output: out std_logic_vector(width-1 downto 0) );
end entity;

entity addersubtractor is
    generic(    width: positive;
            isAdder: boolean := false;
            isSubtractor: boolean := false;
            generateCout: boolean := false;
            generateOvf: boolean := false;
            fixedSecodOperand: integer := 0);
    port(    
        a, b: in std_logic_vector(width-1 downto 0);
        op: in std_logic;
        result: out std_logic_vector(width-1 downto 0);
        ovf, cout: out std_logic );
end entity;

entity adderNinputs is
    generic(    width: positive;
            numInputs: positive;
            levels: positive := 1;
            isAdder: boolean := false;
            isSubtractor: boolean := false;
            generateCout: boolean := false;
            generateOvf: boolean := false );    
    port(    op: in std_logic;
        inputs: in std_logic_vector(numInputs*width-1 downto 0);
        outputs: out std_logic_vector((numInputs/(levels+1))*(width+levels)-1 downto 0));
end entity;
