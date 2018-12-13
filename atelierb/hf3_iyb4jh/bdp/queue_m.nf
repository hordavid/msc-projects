Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(queue_m))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(queue_m))==(Machine(queue_m));
  Level(Machine(queue_m))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(queue_m)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(queue_m))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(queue_m))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(queue_m))==(?);
  List_Includes(Machine(queue_m))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(queue_m))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(queue_m))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(queue_m))==(?);
  Context_List_Variables(Machine(queue_m))==(?);
  Abstract_List_Variables(Machine(queue_m))==(?);
  Local_List_Variables(Machine(queue_m))==(is_full,is_empty,xx);
  List_Variables(Machine(queue_m))==(is_full,is_empty,xx);
  External_List_Variables(Machine(queue_m))==(is_full,is_empty,xx)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(queue_m))==(?);
  Abstract_List_VisibleVariables(Machine(queue_m))==(?);
  External_List_VisibleVariables(Machine(queue_m))==(?);
  Expanded_List_VisibleVariables(Machine(queue_m))==(?);
  List_VisibleVariables(Machine(queue_m))==(?);
  Internal_List_VisibleVariables(Machine(queue_m))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(queue_m))==(btrue);
  Gluing_List_Invariant(Machine(queue_m))==(btrue);
  Expanded_List_Invariant(Machine(queue_m))==(btrue);
  Abstract_List_Invariant(Machine(queue_m))==(btrue);
  Context_List_Invariant(Machine(queue_m))==(btrue);
  List_Invariant(Machine(queue_m))==(xx: 0..100 +-> 0..100 & is_empty: BOOL & is_full: BOOL & xx: FIN(xx) & is_empty = TRUE <=> (card(xx) = 0) & is_empty = FALSE <=> card(xx)>0 & is_full = TRUE <=> (card(xx) = 100) & is_full = FALSE <=> card(xx)<100 & !(ii,jj).(card(xx)>1 & ii: dom(xx) & jj: dom(xx) & ii>jj => xx(ii)>xx(jj)))
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(queue_m))==(btrue);
  Abstract_List_Assertions(Machine(queue_m))==(btrue);
  Context_List_Assertions(Machine(queue_m))==(btrue);
  List_Assertions(Machine(queue_m))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(queue_m))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(queue_m))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(queue_m))==(xx,is_empty,is_full:={},TRUE,TRUE);
  Context_List_Initialisation(Machine(queue_m))==(skip);
  List_Initialisation(Machine(queue_m))==(xx:={} || is_empty:=TRUE || is_full:=TRUE)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(queue_m))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(queue_m))==(btrue);
  List_Constraints(Machine(queue_m))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(queue_m))==(add,empty,get_min,is_empty_op,is_full_op);
  List_Operations(Machine(queue_m))==(add,empty,get_min,is_empty_op,is_full_op)
END
&
THEORY ListInputX IS
  List_Input(Machine(queue_m),add)==(item);
  List_Input(Machine(queue_m),empty)==(?);
  List_Input(Machine(queue_m),get_min)==(?);
  List_Input(Machine(queue_m),is_empty_op)==(?);
  List_Input(Machine(queue_m),is_full_op)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(queue_m),add)==(?);
  List_Output(Machine(queue_m),empty)==(?);
  List_Output(Machine(queue_m),get_min)==(ret);
  List_Output(Machine(queue_m),is_empty_op)==(ret);
  List_Output(Machine(queue_m),is_full_op)==(ret)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(queue_m),add)==(add(item));
  List_Header(Machine(queue_m),empty)==(empty);
  List_Header(Machine(queue_m),get_min)==(ret <-- get_min);
  List_Header(Machine(queue_m),is_empty_op)==(ret <-- is_empty_op);
  List_Header(Machine(queue_m),is_full_op)==(ret <-- is_full_op)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(queue_m),add)==(item: 0..100 & dom(xx) = 0..card(xx));
  List_Precondition(Machine(queue_m),empty)==(card(xx): 1..100);
  List_Precondition(Machine(queue_m),get_min)==(card(xx)>0 & dom(xx) = 0..card(xx));
  List_Precondition(Machine(queue_m),is_empty_op)==(btrue);
  List_Precondition(Machine(queue_m),is_full_op)==(btrue)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(queue_m),is_full_op)==(btrue | ret:=is_full);
  Expanded_List_Substitution(Machine(queue_m),is_empty_op)==(btrue | ret:=is_empty);
  Expanded_List_Substitution(Machine(queue_m),get_min)==(card(xx)>0 & dom(xx) = 0..card(xx) | card(xx) = 1 ==> ret,is_empty,xx:=xx(0),TRUE,{} [] not(card(xx) = 1) ==> @(t_xx,t_is_empty,t_is_full,t_min).(t_xx: 0..100 +-> 0..100 & t_min: 0..100 & t_is_empty: BOOL & t_is_full: BOOL & dom(t_xx) = 0..100 & dom(xx) = 0..100 & t_xx: FIN(t_xx) & t_min = xx(card(xx)) & !(jj,kk).(jj: dom(t_xx) & kk: dom(t_xx) & jj>kk => t_xx(jj)>t_xx(kk)) & t_is_empty = TRUE <=> (card(t_xx) = 0) & t_is_empty = FALSE <=> card(t_xx)>0 & t_is_full = TRUE <=> (card(t_xx) = 100) & t_is_full = FALSE <=> card(t_xx)<100 ==> xx,ret,is_empty,is_full:=t_xx,t_min,t_is_empty,t_is_full));
  Expanded_List_Substitution(Machine(queue_m),empty)==(card(xx): 1..100 | xx,is_empty,is_full:={},TRUE,FALSE);
  Expanded_List_Substitution(Machine(queue_m),add)==(item: 0..100 & dom(xx) = 0..card(xx) | @(t_xx,t_is_empty,t_is_full).(t_xx: 0..100 +-> 0..100 & t_is_empty: BOOL & t_is_full: BOOL & t_xx: FIN(t_xx) & ran(t_xx) = ran(xx)\/{item} & card(t_xx): 1..card(xx)+1 & card(t_xx)>0 <=> !(ii,jj).(ii: dom(t_xx) & jj: dom(t_xx) & ii>jj => t_xx(ii)>t_xx(jj)) & t_is_empty = TRUE <=> (card(t_xx) = 0) & t_is_empty = FALSE <=> card(t_xx)>0 & t_is_full = TRUE <=> (card(t_xx) = 100) & t_is_full = FALSE <=> card(t_xx)<100 ==> xx,is_empty,is_full:=t_xx,t_is_empty,t_is_full));
  List_Substitution(Machine(queue_m),add)==(ANY t_xx,t_is_empty,t_is_full WHERE t_xx: 0..100 +-> 0..100 & t_is_empty: BOOL & t_is_full: BOOL & t_xx: FIN(t_xx) & ran(t_xx) = ran(xx)\/{item} & card(t_xx): 1..card(xx)+1 & card(t_xx)>0 <=> !(ii,jj).(ii: dom(t_xx) & jj: dom(t_xx) & ii>jj => t_xx(ii)>t_xx(jj)) & t_is_empty = TRUE <=> (card(t_xx) = 0) & t_is_empty = FALSE <=> card(t_xx)>0 & t_is_full = TRUE <=> (card(t_xx) = 100) & t_is_full = FALSE <=> card(t_xx)<100 THEN xx:=t_xx || is_empty:=t_is_empty || is_full:=t_is_full END);
  List_Substitution(Machine(queue_m),empty)==(xx:={} || is_empty:=TRUE || is_full:=FALSE);
  List_Substitution(Machine(queue_m),get_min)==(IF card(xx) = 1 THEN ret:=xx(0) || is_empty:=TRUE || xx:={} ELSE ANY t_xx,t_is_empty,t_is_full,t_min WHERE t_xx: 0..100 +-> 0..100 & t_min: 0..100 & t_is_empty: BOOL & t_is_full: BOOL & dom(t_xx) = 0..100 & dom(xx) = 0..100 & t_xx: FIN(t_xx) & t_min = xx(card(xx)) & !(jj,kk).(jj: dom(t_xx) & kk: dom(t_xx) & jj>kk => t_xx(jj)>t_xx(kk)) & t_is_empty = TRUE <=> (card(t_xx) = 0) & t_is_empty = FALSE <=> card(t_xx)>0 & t_is_full = TRUE <=> (card(t_xx) = 100) & t_is_full = FALSE <=> card(t_xx)<100 THEN xx:=t_xx || ret:=t_min || is_empty:=t_is_empty || is_full:=t_is_full END END);
  List_Substitution(Machine(queue_m),is_empty_op)==(ret:=is_empty);
  List_Substitution(Machine(queue_m),is_full_op)==(ret:=is_full)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(queue_m))==(?);
  Inherited_List_Constants(Machine(queue_m))==(?);
  List_Constants(Machine(queue_m))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(queue_m))==(?);
  Context_List_Defered(Machine(queue_m))==(?);
  Context_List_Sets(Machine(queue_m))==(?);
  List_Valuable_Sets(Machine(queue_m))==(?);
  Inherited_List_Enumerated(Machine(queue_m))==(?);
  Inherited_List_Defered(Machine(queue_m))==(?);
  Inherited_List_Sets(Machine(queue_m))==(?);
  List_Enumerated(Machine(queue_m))==(?);
  List_Defered(Machine(queue_m))==(?);
  List_Sets(Machine(queue_m))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(queue_m))==(?);
  Expanded_List_HiddenConstants(Machine(queue_m))==(?);
  List_HiddenConstants(Machine(queue_m))==(?);
  External_List_HiddenConstants(Machine(queue_m))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(queue_m))==(btrue);
  Context_List_Properties(Machine(queue_m))==(btrue);
  Inherited_List_Properties(Machine(queue_m))==(btrue);
  List_Properties(Machine(queue_m))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(queue_m),add)==((Var(t_xx) == SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?))),(Var(t_is_empty) == btype(BOOL,?,?)),(Var(t_is_full) == btype(BOOL,?,?)));
  List_ANY_Var(Machine(queue_m),empty)==(?);
  List_ANY_Var(Machine(queue_m),get_min)==((Var(t_xx) == SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?))),(Var(t_is_empty) == btype(BOOL,?,?)),(Var(t_is_full) == btype(BOOL,?,?)),(Var(t_min) == btype(INTEGER,?,?)));
  List_ANY_Var(Machine(queue_m),is_empty_op)==(?);
  List_ANY_Var(Machine(queue_m),is_full_op)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(queue_m)) == (? | ? | is_full,is_empty,xx | ? | add,empty,get_min,is_empty_op,is_full_op | ? | ? | ? | queue_m);
  List_Of_HiddenCst_Ids(Machine(queue_m)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(queue_m)) == (?);
  List_Of_VisibleVar_Ids(Machine(queue_m)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(queue_m)) == (?: ?)
END
&
THEORY VariablesEnvX IS
  Variables(Machine(queue_m)) == (Type(is_full) == Mvl(btype(BOOL,?,?));Type(is_empty) == Mvl(btype(BOOL,?,?));Type(xx) == Mvl(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(queue_m)) == (Type(is_full_op) == Cst(btype(BOOL,?,?),No_type);Type(is_empty_op) == Cst(btype(BOOL,?,?),No_type);Type(get_min) == Cst(btype(INTEGER,?,?),No_type);Type(empty) == Cst(No_type,No_type);Type(add) == Cst(No_type,btype(INTEGER,?,?)));
  Observers(Machine(queue_m)) == (Type(is_full_op) == Cst(btype(BOOL,?,?),No_type);Type(is_empty_op) == Cst(btype(BOOL,?,?),No_type))
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
