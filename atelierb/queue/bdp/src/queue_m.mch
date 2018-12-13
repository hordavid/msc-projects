/* queue_m
 * Author: david
 * Creation date: 2018. 12. 09.
 *
 *Specifikáljuk a következő feladatot! Legyen xx rendezett sor (parciális fv.), a műveletei: üres, legkissebb ki, elem be, üres-e, teli-e.
 */
MACHINE
    queue_m

ABSTRACT_VARIABLES
    xx
    , is_empty

INVARIANT
    xx : 0 .. 100 +-> 0 .. 100
    & is_empty : BOOL
    & xx : FIN ( xx )
    & is_empty = TRUE <=> ( card ( xx ) = 0 )
    & is_empty = FALSE <=> ( card ( xx ) > 0 )
    & ! ( ii , jj ) . ( card ( xx ) > 1 & ii : dom ( xx ) & jj : dom ( xx ) & ii > jj => xx ( ii ) > xx ( jj ) )

INITIALISATION
    xx := {}
    || is_empty := TRUE

OPERATIONS
    add ( item ) =
        PRE
            item : 0 .. 100
            /* & card(xx) :0..99 */
            & dom ( xx ) = 0 .. card ( xx )
        THEN
            ANY
                t_xx
                , t_is_empty
            WHERE
                t_xx : 0 .. 100 +-> 0 .. 100
                & t_is_empty : BOOL
                & t_xx : FIN ( t_xx )
                /* & card(xx) : 0..99 */
                & ran ( t_xx ) = ran ( xx ) \/ { item }
                & card ( t_xx ) : 1 .. card ( xx ) + 1
                & card ( t_xx ) > 0 <=> ! ( ii , jj ) . ( ii : dom ( t_xx ) & jj : dom ( t_xx ) & ii > jj => t_xx ( ii ) > t_xx ( jj ) )
                & t_is_empty = TRUE <=> ( card ( t_xx ) = 0 )
                & t_is_empty = FALSE <=> ( card ( t_xx ) > 0 )

                THEN
                    xx := t_xx
                    || is_empty := t_is_empty
                END
        END ;

    empty =
        PRE
            card ( xx ) : 1 .. 100
        THEN
            xx := {}
            || is_empty := TRUE
        END ;

    ret <-- get_min =
        PRE
            card ( xx ) > 0
            & dom ( xx ) = 0 .. card ( xx )
        THEN
            IF card ( xx ) = 1 THEN
                ret := xx ( 0 )
                || is_empty := TRUE
                || xx := {}
            ELSE
                ANY
                    t_xx
                    , t_is_empty
                    , t_min
                WHERE
                    t_xx : 0 .. 100 +-> 0 .. 100
                    & t_min : 0 .. 100
                    & t_is_empty :  BOOL
                    & dom ( t_xx ) = 0 .. 100
                    & dom ( xx ) = 0 .. 100
                    & t_xx : FIN ( t_xx )
                    & t_min = xx ( card ( xx ) )
                    & ! ( jj , kk ) . ( jj : dom ( t_xx ) & kk : dom ( t_xx ) & jj > kk => t_xx ( jj ) > t_xx ( kk ) )
                    & t_is_empty = TRUE <=> ( card ( t_xx ) = 0 )
                    & t_is_empty = FALSE <=> ( card ( t_xx ) > 0 )
                THEN
                    xx := t_xx
                    || ret := t_min
                    || is_empty := t_is_empty
                END
            END
        END ;

    ret <-- is_empty_op =
        BEGIN
           ret := is_empty
        END ;

    ret <-- is_full_op =
        BEGIN
           IF is_empty = TRUE
           THEN ret := FALSE
           ELSE ret := TRUE
           END
        END

END
