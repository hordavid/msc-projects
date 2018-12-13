Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(income))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(income))==(Machine(income));
  Level(Machine(income))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(income)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(income))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(income))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(income))==(?);
  List_Includes(Machine(income))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(income))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(income))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(income))==(?);
  Context_List_Variables(Machine(income))==(?);
  Abstract_List_Variables(Machine(income))==(?);
  Local_List_Variables(Machine(income))==(incomes);
  List_Variables(Machine(income))==(incomes);
  External_List_Variables(Machine(income))==(incomes)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(income))==(?);
  Abstract_List_VisibleVariables(Machine(income))==(?);
  External_List_VisibleVariables(Machine(income))==(?);
  Expanded_List_VisibleVariables(Machine(income))==(?);
  List_VisibleVariables(Machine(income))==(?);
  Internal_List_VisibleVariables(Machine(income))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(income))==(btrue);
  Gluing_List_Invariant(Machine(income))==(btrue);
  Expanded_List_Invariant(Machine(income))==(btrue);
  Abstract_List_Invariant(Machine(income))==(btrue);
  Context_List_Invariant(Machine(income))==(btrue);
  List_Invariant(Machine(income))==(incomes: 1..7 --> NAT)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(income))==(btrue);
  Abstract_List_Assertions(Machine(income))==(btrue);
  Context_List_Assertions(Machine(income))==(btrue);
  List_Assertions(Machine(income))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(income))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(income))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(income))==(incomes:=(1..7)*{0});
  Context_List_Initialisation(Machine(income))==(skip);
  List_Initialisation(Machine(income))==(incomes:=(1..7)*{0})
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(income))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(income))==(btrue);
  List_Constraints(Machine(income))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(income))==(get_income,set_income,sum_incomes,get_max,get_min);
  List_Operations(Machine(income))==(get_income,set_income,sum_incomes,get_max,get_min)
END
&
THEORY ListInputX IS
  List_Input(Machine(income),get_income)==(day);
  List_Input(Machine(income),set_income)==(day,value);
  List_Input(Machine(income),sum_incomes)==(?);
  List_Input(Machine(income),get_max)==(?);
  List_Input(Machine(income),get_min)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(income),get_income)==(income);
  List_Output(Machine(income),set_income)==(?);
  List_Output(Machine(income),sum_incomes)==(sum);
  List_Output(Machine(income),get_max)==(max_income);
  List_Output(Machine(income),get_min)==(min_income)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(income),get_income)==(income <-- get_income(day));
  List_Header(Machine(income),set_income)==(set_income(day,value));
  List_Header(Machine(income),sum_incomes)==(sum <-- sum_incomes);
  List_Header(Machine(income),get_max)==(max_income <-- get_max);
  List_Header(Machine(income),get_min)==(min_income <-- get_min)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(income),get_income)==(day: 1..7 & income: NAT);
  List_Precondition(Machine(income),set_income)==(day: 1..7 & value: NAT);
  List_Precondition(Machine(income),sum_incomes)==(sum: NAT & SIGMA(day).(day: 1..7 | incomes(day)): NAT);
  List_Precondition(Machine(income),get_max)==(max_income: NAT & SIGMA(day).(day: 1..7 | incomes(day)): NAT);
  List_Precondition(Machine(income),get_min)==(min_income: NAT & SIGMA(day).(day: 1..7 | incomes(day)): NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(income),get_min)==(min_income: NAT & SIGMA(day).(day: 1..7 | incomes(day)): NAT | min_income:=min(ran(incomes)));
  Expanded_List_Substitution(Machine(income),get_max)==(max_income: NAT & SIGMA(day).(day: 1..7 | incomes(day)): NAT | max_income:=max(ran(incomes)));
  Expanded_List_Substitution(Machine(income),sum_incomes)==(sum: NAT & SIGMA(day).(day: 1..7 | incomes(day)): NAT | sum:=SIGMA(day).(day: 1..7 | incomes(day)));
  Expanded_List_Substitution(Machine(income),set_income)==(day: 1..7 & value: NAT | incomes:=incomes<+{day|->value});
  Expanded_List_Substitution(Machine(income),get_income)==(day: 1..7 & income: NAT | income:=incomes(day));
  List_Substitution(Machine(income),get_income)==(income:=incomes(day));
  List_Substitution(Machine(income),set_income)==(incomes(day):=value);
  List_Substitution(Machine(income),sum_incomes)==(sum:=SIGMA(day).(day: 1..7 | incomes(day)));
  List_Substitution(Machine(income),get_max)==(max_income:=max(ran(incomes)));
  List_Substitution(Machine(income),get_min)==(min_income:=min(ran(incomes)))
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(income))==(?);
  Inherited_List_Constants(Machine(income))==(?);
  List_Constants(Machine(income))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(income))==(?);
  Context_List_Defered(Machine(income))==(?);
  Context_List_Sets(Machine(income))==(?);
  List_Valuable_Sets(Machine(income))==(?);
  Inherited_List_Enumerated(Machine(income))==(?);
  Inherited_List_Defered(Machine(income))==(?);
  Inherited_List_Sets(Machine(income))==(?);
  List_Enumerated(Machine(income))==(?);
  List_Defered(Machine(income))==(?);
  List_Sets(Machine(income))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(income))==(?);
  Expanded_List_HiddenConstants(Machine(income))==(?);
  List_HiddenConstants(Machine(income))==(?);
  External_List_HiddenConstants(Machine(income))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(income))==(btrue);
  Context_List_Properties(Machine(income))==(btrue);
  Inherited_List_Properties(Machine(income))==(btrue);
  List_Properties(Machine(income))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(income),get_income)==(?);
  List_ANY_Var(Machine(income),set_income)==(?);
  List_ANY_Var(Machine(income),sum_incomes)==(?);
  List_ANY_Var(Machine(income),get_max)==(?);
  List_ANY_Var(Machine(income),get_min)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(income)) == (? | ? | incomes | ? | get_income,set_income,sum_incomes,get_max,get_min | ? | ? | ? | income);
  List_Of_HiddenCst_Ids(Machine(income)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(income)) == (?);
  List_Of_VisibleVar_Ids(Machine(income)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(income)) == (?: ?)
END
&
THEORY VariablesEnvX IS
  Variables(Machine(income)) == (Type(incomes) == Mvl(SetOf(btype(INTEGER,1,7)*btype(INTEGER,0,MAXINT))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(income)) == (Type(get_min) == Cst(btype(INTEGER,?,?),No_type);Type(get_max) == Cst(btype(INTEGER,?,?),No_type);Type(sum_incomes) == Cst(btype(INTEGER,?,?),No_type);Type(set_income) == Cst(No_type,btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(get_income) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)));
  Observers(Machine(income)) == (Type(get_min) == Cst(btype(INTEGER,?,?),No_type);Type(get_max) == Cst(btype(INTEGER,?,?),No_type);Type(sum_incomes) == Cst(btype(INTEGER,?,?),No_type);Type(get_income) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)))
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
