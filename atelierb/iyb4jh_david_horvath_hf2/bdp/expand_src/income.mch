/* Név: Horváth Dávid 
 * Neptun-kód: IYB4JH
 *
 * Egy olyan szoftvernek a specifikációját kell elkészíteni, amely képes egy vállalkozás vezetőjének a munkáját
 * támogatni az alábbi funkciókkal:
 *   - a szoftver tartsa nyilván a napi bevételi adatokat egy hétre vonatkozóan (7 nap),
 *   - rendelkezzen az adatok megadásához szükséges műveletekkel,
 *   - számolja ki, hogy az adott héten mekkora volt az összbevétel,
 *   - adja meg, hogy mely napon volt a legtöbb bevétel,
 *   - adja meg, hogy mely napon volt a legkevesebb bevétel.
 */
MACHINE
    income

ABSTRACT_VARIABLES
    incomes

INVARIANT
    incomes : ( 1 .. 7 ) --> NAT

INITIALISATION
    incomes := ( 1 .. 7 ) * { 0 }

OPERATIONS
    income <-- get_income ( day ) =
        PRE
            day : 1 .. 7 &
            income : NAT
        THEN
            income := incomes ( day )
        END ;

    set_income ( day , value ) =
        PRE
            day : 1 .. 7 &
            value : NAT
        THEN
            incomes ( day ) := value
        END ;

    sum <-- sum_incomes =
        PRE
            sum : NAT &
            ( SIGMA ( day ) . ( day : 1 .. 7 | incomes ( day ) ) : NAT )
        THEN
            sum := SIGMA ( day ) . ( day : 1 .. 7 | incomes ( day ) )
        END ;

    max_income <-- get_max =
        PRE
            max_income : NAT &
            ( SIGMA ( day ) . ( day : 1 .. 7 | incomes ( day ) ) : NAT )
        THEN
            max_income := max ( ran ( incomes ) )
        END ;

    min_income <-- get_min =
        PRE
            min_income : NAT &
            ( SIGMA ( day ) . ( day : 1 .. 7 | incomes ( day ) ) : NAT )
        THEN
            min_income := min ( ran ( incomes ) )
        END

END
