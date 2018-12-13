/* ib
 * Author: 
 * Creation date: 2016.03.18.
 */
MACHINE
    ib
USES
    iu
/*CONCRETE_*/VARIABLES
    vib1, tb
INVARIANT
    vib1:BOOL
    & tb:1..5-->BOOL
INITIALISATION
    vib1:=FALSE
    || tb::1..5-->BOOL
OPERATIONS
    initb=vib1:=FALSE
    ;
    opb=
    PRE
        vib1=FALSE
        & viu1=TRUE
    THEN
        ANY ss WHERE
            ss:1..5-->BOOL
            & !jj.(jj:1..5=>ss(jj)=bool(tu(jj)<0))
        THEN
            tb:=ss||vib1:=TRUE
        END
        
    END

    
END
