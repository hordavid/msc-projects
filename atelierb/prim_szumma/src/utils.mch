/* utils
 * Author: Magnucz Ferenc
 * Neptun kód: NT76QQ
 * Creation date: 2016.05.04.
 *
 * Informal specification:
 * -----------------------
 * Segéd eljárások gyűjtőhelye.
 * is_prim : megállapítja, hogy a paraméterként megadott szám prím szám e vagy sem.
 */
 
MACHINE
    utils
    
DEFINITIONS
    "common.def"

OPERATIONS
    ret <-- is_prim_op(p_num) =
    PRE
        p_num : NAT
        & p_num >= 2
    THEN
        ANY
            v_ret
        WHERE
            v_ret : BOOL
            & v_ret = bool(IS_PRIM(p_num))
        THEN
            ret      := v_ret
        END
    END
    ;
    
    ret <-- is_prim_op2(p_num) =
    PRE
        p_num : NAT
    THEN
        ANY
            v_ret
        WHERE
            v_ret : BOOL
            & v_ret = bool(IS_PRIM(p_num))            
        THEN
            ret := v_ret
        END
    END
END
