Normalised(
THEORY MagicNumberX IS
  MagicNumber(Implementation(utils_i))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Implementation(utils_i))==(Machine(utils));
  Level(Implementation(utils_i))==(1);
  Upper_Level(Implementation(utils_i))==(Machine(utils))
END
&
THEORY LoadedStructureX IS
  Implementation(utils_i)
END
&
THEORY ListSeesX IS
  List_Sees(Implementation(utils_i))==(?)
END
&
THEORY ListIncludesX IS
  List_Includes(Implementation(utils_i))==(?);
  Inherited_List_Includes(Implementation(utils_i))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Implementation(utils_i))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Implementation(utils_i))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Implementation(utils_i))==(?);
  Context_List_Variables(Implementation(utils_i))==(?);
  Abstract_List_Variables(Implementation(utils_i))==(?);
  Local_List_Variables(Implementation(utils_i))==(?);
  List_Variables(Implementation(utils_i))==(?);
  External_List_Variables(Implementation(utils_i))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Implementation(utils_i))==(?);
  Abstract_List_VisibleVariables(Implementation(utils_i))==(?);
  External_List_VisibleVariables(Implementation(utils_i))==(?);
  Expanded_List_VisibleVariables(Implementation(utils_i))==(?);
  List_VisibleVariables(Implementation(utils_i))==(?);
  Internal_List_VisibleVariables(Implementation(utils_i))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Implementation(utils_i))==(btrue);
  Expanded_List_Invariant(Implementation(utils_i))==(btrue);
  Abstract_List_Invariant(Implementation(utils_i))==(btrue);
  Context_List_Invariant(Implementation(utils_i))==(btrue);
  List_Invariant(Implementation(utils_i))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Implementation(utils_i))==(btrue);
  Abstract_List_Assertions(Implementation(utils_i))==(btrue);
  Context_List_Assertions(Implementation(utils_i))==(btrue);
  List_Assertions(Implementation(utils_i))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Implementation(utils_i))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Implementation(utils_i))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Implementation(utils_i))==(skip);
  Context_List_Initialisation(Implementation(utils_i))==(skip);
  List_Initialisation(Implementation(utils_i))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Implementation(utils_i))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Constraints(Implementation(utils_i))==(btrue);
  List_Context_Constraints(Implementation(utils_i))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Implementation(utils_i))==(l_is_prim,is_prim_op,is_prim_op2);
  List_Operations(Implementation(utils_i))==(l_is_prim,is_prim_op,is_prim_op2)
END
&
THEORY ListInputX IS
  List_Input(Implementation(utils_i),l_is_prim)==(p_num);
  List_Input(Implementation(utils_i),is_prim_op)==(p_num);
  List_Input(Implementation(utils_i),is_prim_op2)==(p_num)
END
&
THEORY ListOutputX IS
  List_Output(Implementation(utils_i),l_is_prim)==(ret);
  List_Output(Implementation(utils_i),is_prim_op)==(ret);
  List_Output(Implementation(utils_i),is_prim_op2)==(ret)
END
&
THEORY ListHeaderX IS
  List_Header(Implementation(utils_i),l_is_prim)==(ret <-- l_is_prim(p_num));
  List_Header(Implementation(utils_i),is_prim_op)==(ret <-- is_prim_op(p_num));
  List_Header(Implementation(utils_i),is_prim_op2)==(ret <-- is_prim_op2(p_num))
END
&
THEORY ListPreconditionX IS
  Own_Precondition(Implementation(utils_i),l_is_prim)==(btrue);
  List_Precondition(Implementation(utils_i),l_is_prim)==(p_num: NAT & p_num>=2);
  Own_Precondition(Implementation(utils_i),is_prim_op)==(btrue);
  List_Precondition(Implementation(utils_i),is_prim_op)==(p_num: NAT & p_num>=2);
  Own_Precondition(Implementation(utils_i),is_prim_op2)==(btrue);
  List_Precondition(Implementation(utils_i),is_prim_op2)==(p_num: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Implementation(utils_i),is_prim_op2)==(p_num: NAT | 2<=p_num ==> (p_num: NAT & p_num>=2 | @v_ret.(v_ret: BOOL & v_ret = bool(2<=p_num & !zz.(zz: 2..p_num-1 => p_num mod zz/=0)) ==> ret:=v_ret)) [] not(2<=p_num) ==> ret:=FALSE);
  Expanded_List_Substitution(Implementation(utils_i),is_prim_op)==(p_num: NAT & p_num>=2 | @v_ret.(v_ret: BOOL & v_ret = bool(2<=p_num & !zz.(zz: 2..p_num-1 => p_num mod zz/=0)) ==> ret:=v_ret));
  Expanded_List_Substitution(Implementation(utils_i),l_is_prim)==(p_num: NAT & p_num>=2 | @(v_mm,v_ii,v_prim).(v_ii:=2;v_mm:=0;v_prim:=TRUE;WHILE v_prim = TRUE & v_ii<p_num DO (p_num mod v_ii: INT & p_num mod v_ii: NAT & p_num: NAT & v_ii: NAT1 | v_mm:=p_num mod v_ii);(v_mm = 0 ==> v_prim:=FALSE [] not(v_mm = 0) ==> skip);(v_ii+1: INT & v_ii: INT & 1: INT | v_ii:=v_ii+1) INVARIANT p_num: NAT & p_num>=2 & v_prim: BOOL & v_ii: 2..p_num & (v_prim = TRUE => !kk.(kk: 2..v_ii-1 => p_num mod kk/=0)) & (v_prim = FALSE => v_ii-1: 2..p_num-1 & p_num mod (v_ii-1) = 0) VARIANT p_num-v_ii END;ret:=v_prim));
  List_Substitution(Implementation(utils_i),l_is_prim)==(VAR v_mm,v_ii,v_prim IN v_ii:=2;v_mm:=0;v_prim:=TRUE;WHILE v_prim = TRUE & v_ii<p_num DO v_mm:=p_num mod v_ii;IF v_mm = 0 THEN v_prim:=FALSE END;v_ii:=v_ii+1 INVARIANT p_num: NAT & p_num>=2 & v_prim: BOOL & v_ii: 2..p_num & (v_prim = TRUE => !kk.(kk: 2..v_ii-1 => p_num mod kk/=0)) & (v_prim = FALSE => v_ii-1: 2..p_num-1 & p_num mod (v_ii-1) = 0) VARIANT p_num-v_ii END;ret:=v_prim END);
  List_Substitution(Implementation(utils_i),is_prim_op)==(ret <-- l_is_prim(p_num));
  List_Substitution(Implementation(utils_i),is_prim_op2)==(IF 2<=p_num THEN ret <-- l_is_prim(p_num) ELSE ret:=FALSE END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Implementation(utils_i))==(?);
  Inherited_List_Constants(Implementation(utils_i))==(?);
  List_Constants(Implementation(utils_i))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Implementation(utils_i))==(?);
  Context_List_Defered(Implementation(utils_i))==(?);
  Context_List_Sets(Implementation(utils_i))==(?);
  List_Own_Enumerated(Implementation(utils_i))==(?);
  List_Valuable_Sets(Implementation(utils_i))==(?);
  Inherited_List_Enumerated(Implementation(utils_i))==(?);
  Inherited_List_Defered(Implementation(utils_i))==(?);
  Inherited_List_Sets(Implementation(utils_i))==(?);
  List_Enumerated(Implementation(utils_i))==(?);
  List_Defered(Implementation(utils_i))==(?);
  List_Sets(Implementation(utils_i))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Implementation(utils_i))==(?);
  Expanded_List_HiddenConstants(Implementation(utils_i))==(?);
  List_HiddenConstants(Implementation(utils_i))==(?);
  External_List_HiddenConstants(Implementation(utils_i))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Implementation(utils_i))==(btrue);
  Context_List_Properties(Implementation(utils_i))==(btrue);
  Inherited_List_Properties(Implementation(utils_i))==(btrue);
  List_Properties(Implementation(utils_i))==(btrue)
END
&
THEORY ListValuesX IS
  Values_Subs(Implementation(utils_i))==(aa: aa);
  List_Values(Implementation(utils_i))==(?)
END
&
THEORY ListSeenInfoX END
&
THEORY ListIncludedOperationsX END
&
THEORY InheritedEnvX IS
  Operations(Implementation(utils_i))==(Type(is_prim_op2) == Cst(btype(BOOL,?,?),btype(INTEGER,?,?));Type(is_prim_op) == Cst(btype(BOOL,?,?),btype(INTEGER,?,?)))
END
&
THEORY ListVisibleStaticX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Implementation(utils_i)) == (? | ? | ? | ? | l_is_prim,is_prim_op,is_prim_op2,refinement_of_l_is_prim | ? | ? | ? | utils_i);
  List_Of_HiddenCst_Ids(Implementation(utils_i)) == (? | ?);
  List_Of_VisibleCst_Ids(Implementation(utils_i)) == (?);
  List_Of_VisibleVar_Ids(Implementation(utils_i)) == (? | ?);
  List_Of_Ids_SeenBNU(Implementation(utils_i)) == (?: ?)
END
&
THEORY VariablesLocEnvX IS
  Variables_Loc(Implementation(utils_i),l_is_prim, 1) == (Type(v_mm) == Lvl(btype(INTEGER,?,?));Type(v_ii) == Lvl(btype(INTEGER,?,?));Type(v_prim) == Lvl(btype(BOOL,?,?)))
END
&
THEORY TCIntRdX IS
  predB0 == OK;
  extended_sees == KO;
  B0check_tab == KO;
  local_op == OK;
  abstract_constants_visible_in_values == KO;
  project_type == SOFTWARE_TYPE;
  event_b_deadlockfreeness == KO;
  variant_clause_mandatory == KO;
  event_b_coverage == KO;
  event_b_exclusivity == KO;
  genFeasibilityPO == KO
END
&
THEORY ListLocalOperationsX IS
  List_Local_Operations(Implementation(utils_i))==(l_is_prim)
END
&
THEORY ListLocalInputX IS
  List_Local_Input(Implementation(utils_i),l_is_prim)==(p_num)
END
&
THEORY ListLocalOutputX IS
  List_Local_Output(Implementation(utils_i),l_is_prim)==(ret)
END
&
THEORY ListLocalHeaderX IS
  List_Local_Header(Implementation(utils_i),l_is_prim)==(ret <-- l_is_prim(p_num))
END
&
THEORY ListLocalPreconditionX IS
  List_Local_Precondition(Implementation(utils_i),l_is_prim)==(p_num: NAT & p_num>=2)
END
&
THEORY ListLocalSubstitutionX IS
  Expanded_List_Local_Substitution(Implementation(utils_i),l_is_prim)==(p_num: NAT & p_num>=2 | @v_ret.(v_ret: BOOL & v_ret = bool(2<=p_num & !zz.(zz: 2..p_num-1 => p_num mod zz/=0)) ==> ret:=v_ret));
  List_Local_Substitution(Implementation(utils_i),l_is_prim)==(ANY v_ret WHERE v_ret: BOOL & v_ret = bool(2<=p_num & !zz.(zz: 2..p_num-1 => p_num mod zz/=0)) THEN ret:=v_ret END)
END
&
THEORY TypingPredicateX IS
  TypingPredicate(Implementation(utils_i))==(btrue)
END
&
THEORY ImportedVariablesListX END
&
THEORY ListLocalOpInvariantX IS
  LocalOp_Expanded_Invariant(Implementation(utils_i),l_is_prim)==(btrue)
END
)
