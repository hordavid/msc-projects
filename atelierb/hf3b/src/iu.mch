/* iu
 * Author: 
 * Creation date: 2016.03.18.
 */
MACHINE
    iu
CONCRETE_VARIABLES
    viu1
VARIABLES
    
    tu
INVARIANT
    viu1:BOOL
    & tu:1..5-->INT
INITIALISATION
    viu1:=FALSE
    ||tu:=(1..5)*{0}
OPERATIONS
    initu=viu1:=FALSE;
    be=
    PRE
        viu1=FALSE
    THEN
        ANY gg WHERE
            gg:1..5-->INT
        THEN
            tu:=gg||viu1:=TRUE
        END
        
    END
END
