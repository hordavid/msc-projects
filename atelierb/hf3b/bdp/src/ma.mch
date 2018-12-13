/* ma
 * Author: 
 * Creation date: 2016.03.18.
 */
MACHINE
    ma
INCLUDES
    ia ,
    ib ,
    iu
//PROMOTES
  //  be
ABSTRACT_VARIABLES
    vm , tm
//SETS
//    STAT={S1,S2,S3,S4}
INVARIANT
    vm : BOOL
    & tm : 1 .. 5 --> BOOL
INITIALISATION
    vm := FALSE
    || tm :: 1 .. 5 --> BOOL
OPERATIONS
    init =
    BEGIN
        initu
        || initb
        || inita
        || vm := FALSE
    END
    ;
    mbe =
    PRE
        vm = FALSE &
        viu1 = FALSE
    THEN
        be

    END
    ;
    mtra =
    PRE
        vm = FALSE &
        viu1 = TRUE & via1 = FALSE
    THEN
        opa
    END
    ;
     mtrb =
    PRE
        vm = FALSE &
        viu1 = TRUE & vib1 = FALSE
    THEN
        opb
    END
    ;
   opm =
    PRE
        vm = FALSE &
        viu1 = TRUE & via1 = TRUE & vib1 = TRUE
    THEN
        ANY aa WHERE
            aa : 1 .. 5 --> BOOL
            & ! jj . ( jj : 1 .. 5 => aa ( jj ) = bool ( ta ( jj ) /= TRUE & tb ( jj ) /= TRUE ) )
        THEN
            tm := aa
        END ||
        vm := TRUE
    END
    ;

    ki = skip

END
