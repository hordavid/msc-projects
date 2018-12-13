/* ia
 * Author: 
 * Creation date: 2016.03.18.
 */
MACHINE
    ia
USES
    iu
/*CONCRETE_*/ ABSTRACT_VARIABLES
via1 ,
ta
INVARIANT
    via1 : BOOL
    & ta : 1 .. 5 --> BOOL
INITIALISATION
    via1 := FALSE
    || ta :: 1 .. 5 --> BOOL
OPERATIONS
    inita = via1 := FALSE
    ;
    opa =
    PRE
        via1 = FALSE
        & viu1 = TRUE
    THEN
        ANY ss WHERE
            ss : 1 .. 5 --> BOOL
            & ! jj . ( jj : 1 .. 5 => ss ( jj ) = bool ( tu ( jj ) > 0 ) )
        THEN
            ta := ss || via1 := TRUE
        END

    END

END
