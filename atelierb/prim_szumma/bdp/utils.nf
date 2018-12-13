Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(utils))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(utils))==(Machine(utils));
  Level(Machine(utils))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(utils)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(utils))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(utils))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(utils))==(?);
  List_Includes(Machine(utils))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(utils))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(utils))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(utils))==(?);
  Context_List_Variables(Machine(utils))==(?);
  Abstract_List_Variables(Machine(utils))==(?);
  Local_List_Variables(Machine(utils))==(?);
  List_Variables(Machine(utils))==(?);
  External_List_Variables(Machine(utils))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(utils))==(?);
  Abstract_List_VisibleVariables(Machine(utils))==(?);
  External_List_VisibleVariables(Machine(utils))==(?);
  Expanded_List_VisibleVariables(Machine(utils))==(?);
  List_VisibleVariables(Machine(utils))==(?);
  Internal_List_VisibleVariables(Machine(utils))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(utils))==(btrue);
  Gluing_List_Invariant(Machine(utils))==(btrue);
  Expanded_List_Invariant(Machine(utils))==(btrue);
  Abstract_List_Invariant(Machine(utils))==(btrue);
  Context_List_Invariant(Machine(utils))==(btrue);
  List_Invariant(Machine(utils))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(utils))==(btrue);
  Abstract_List_Assertions(Machine(utils))==(btrue);
  Context_List_Assertions(Machine(utils))==(btrue);
  List_Assertions(Machine(utils))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(utils))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(utils))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(utils))==(skip);
  Context_List_Initialisation(Machine(utils))==(skip);
  List_Initialisation(Machine(utils))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(utils))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(utils))==(btrue);
  List_Constraints(Machine(utils))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(utils))==(is_prim_op,is_prim_op2);
  List_Operations(Machine(utils))==(is_prim_op,is_prim_op2)
END
&
THEORY ListInputX IS
  List_Input(Machine(utils),is_prim_op)==(p_num);
  List_Input(Machine(utils),is_prim_op2)==(p_num)
END
&
THEORY ListOutputX IS
  List_Output(Machine(utils),is_prim_op)==(ret);
  List_Output(Machine(utils),is_prim_op2)==(ret)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(utils),is_prim_op)==(ret <-- is_prim_op(p_num));
  List_Header(Machine(utils),is_prim_op2)==(ret <-- is_prim_op2(p_num))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(utils),is_prim_op)==(p_num: NAT & p_num>=2);
  List_Precondition(Machine(utils),is_prim_op2)==(p_num: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(utils),is_prim_op2)==(p_num: NAT | @v_ret.(v_ret: BOOL & v_ret = bool(2<=p_num & !zz.(zz: 2..p_num-1 => p_num mod zz/=0)) ==> ret:=v_ret));
  Expanded_List_Substitution(Machine(utils),is_prim_op)==(p_num: NAT & p_num>=2 | @v_ret.(v_ret: BOOL & v_ret = bool(2<=p_num & !zz.(zz: 2..p_num-1 => p_num mod zz/=0)) ==> ret:=v_ret));
  List_Substitution(Machine(utils),is_prim_op)==(ANY v_ret WHERE v_ret: BOOL & v_ret = bool(2<=p_num & !zz.(zz: 2..p_num-1 => p_num mod zz/=0)) THEN ret:=v_ret END);
  List_Substitution(Machine(utils),is_prim_op2)==(ANY v_ret WHERE v_ret: BOOL & v_ret = bool(2<=p_num & !zz.(zz: 2..p_num-1 => p_num mod zz/=0)) THEN ret:=v_ret END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(utils))==(?);
  Inherited_List_Constants(Machine(utils))==(?);
  List_Constants(Machine(utils))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(utils))==(?);
  Context_List_Defered(Machine(utils))==(?);
  Context_List_Sets(Machine(utils))==(?);
  List_Valuable_Sets(Machine(utils))==(?);
  Inherited_List_Enumerated(Machine(utils))==(?);
  Inherited_List_Defered(Machine(utils))==(?);
  Inherited_List_Sets(Machine(utils))==(?);
  List_Enumerated(Machine(utils))==(?);
  List_Defered(Machine(utils))==(?);
  List_Sets(Machine(utils))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(utils))==(?);
  Expanded_List_HiddenConstants(Machine(utils))==(?);
  List_HiddenConstants(Machine(utils))==(?);
  External_List_HiddenConstants(Machine(utils))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(utils))==(btrue);
  Context_List_Properties(Machine(utils))==(btrue);
  Inherited_List_Properties(Machine(utils))==(btrue);
  List_Properties(Machine(utils))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(utils),is_prim_op)==(Var(v_ret) == btype(BOOL,?,?));
  List_ANY_Var(Machine(utils),is_prim_op2)==(Var(v_ret) == btype(BOOL,?,?))
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(utils)) == (? | ? | ? | ? | is_prim_op,is_prim_op2 | ? | ? | ? | utils);
  List_Of_HiddenCst_Ids(Machine(utils)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(utils)) == (?);
  List_Of_VisibleVar_Ids(Machine(utils)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(utils)) == (?: ?)
END
&
THEORY OperationsEnvX IS
  Operations(Machine(utils)) == (Type(is_prim_op2) == Cst(btype(BOOL,?,?),btype(INTEGER,?,?));Type(is_prim_op) == Cst(btype(BOOL,?,?),btype(INTEGER,?,?)));
  Observers(Machine(utils)) == (Type(is_prim_op2) == Cst(btype(BOOL,?,?),btype(INTEGER,?,?));Type(is_prim_op) == Cst(btype(BOOL,?,?),btype(INTEGER,?,?)))
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
)
