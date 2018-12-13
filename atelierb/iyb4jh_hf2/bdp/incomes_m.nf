Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(incomes_m))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(incomes_m))==(Machine(incomes_m));
  Level(Machine(incomes_m))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(incomes_m)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(incomes_m))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(incomes_m))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(incomes_m))==(?);
  List_Includes(Machine(incomes_m))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(incomes_m))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(incomes_m))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(incomes_m))==(?);
  Context_List_Variables(Machine(incomes_m))==(?);
  Abstract_List_Variables(Machine(incomes_m))==(?);
  Local_List_Variables(Machine(incomes_m))==(?);
  List_Variables(Machine(incomes_m))==(?);
  External_List_Variables(Machine(incomes_m))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(incomes_m))==(?);
  Abstract_List_VisibleVariables(Machine(incomes_m))==(?);
  External_List_VisibleVariables(Machine(incomes_m))==(?);
  Expanded_List_VisibleVariables(Machine(incomes_m))==(?);
  List_VisibleVariables(Machine(incomes_m))==(sum_i,max_d,min_d,incomes);
  Internal_List_VisibleVariables(Machine(incomes_m))==(sum_i,max_d,min_d,incomes)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(incomes_m))==(btrue);
  Gluing_List_Invariant(Machine(incomes_m))==(btrue);
  Expanded_List_Invariant(Machine(incomes_m))==(btrue);
  Abstract_List_Invariant(Machine(incomes_m))==(btrue);
  Context_List_Invariant(Machine(incomes_m))==(btrue);
  List_Invariant(Machine(incomes_m))==(incomes: 1..7 --> 0..1000000 & min_d: 1..7 & max_d: 1..7 & sum_i: 0..1000000*7 & !jj.(jj: dom(incomes) => incomes(jj)>=incomes(max_d)) & !jj.(jj: dom(incomes) => incomes(jj)<=incomes(min_d)) & sum_i = SIGMA(ii).(ii: dom(incomes) | incomes(ii)))
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(incomes_m))==(btrue);
  Abstract_List_Assertions(Machine(incomes_m))==(btrue);
  Context_List_Assertions(Machine(incomes_m))==(btrue);
  List_Assertions(Machine(incomes_m))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(incomes_m))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(incomes_m))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(incomes_m))==(incomes,min_d,max_d,sum_i:=(1..7)*{0},1,1,0);
  Context_List_Initialisation(Machine(incomes_m))==(skip);
  List_Initialisation(Machine(incomes_m))==(incomes:=(1..7)*{0} || min_d:=1 || max_d:=1 || sum_i:=0)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(incomes_m))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(incomes_m))==(btrue);
  List_Constraints(Machine(incomes_m))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(incomes_m))==(get_income,set_income,sum_incomes,maximum,minimum);
  List_Operations(Machine(incomes_m))==(get_income,set_income,sum_incomes,maximum,minimum)
END
&
THEORY ListInputX IS
  List_Input(Machine(incomes_m),get_income)==(day);
  List_Input(Machine(incomes_m),set_income)==(day,income);
  List_Input(Machine(incomes_m),sum_incomes)==(?);
  List_Input(Machine(incomes_m),maximum)==(?);
  List_Input(Machine(incomes_m),minimum)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(incomes_m),get_income)==(income);
  List_Output(Machine(incomes_m),set_income)==(?);
  List_Output(Machine(incomes_m),sum_incomes)==(sum);
  List_Output(Machine(incomes_m),maximum)==(max_income_day);
  List_Output(Machine(incomes_m),minimum)==(min_income_day)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(incomes_m),get_income)==(income <-- get_income(day));
  List_Header(Machine(incomes_m),set_income)==(set_income(day,income));
  List_Header(Machine(incomes_m),sum_incomes)==(sum <-- sum_incomes);
  List_Header(Machine(incomes_m),maximum)==(max_income_day <-- maximum);
  List_Header(Machine(incomes_m),minimum)==(min_income_day <-- minimum)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(incomes_m),get_income)==(day: dom(incomes) & income: 0..1000000 & incomes(day): 0..1000000);
  List_Precondition(Machine(incomes_m),set_income)==(day: dom(incomes) & income: 0..1000000 & incomes(day): 0..1000000);
  List_Precondition(Machine(incomes_m),sum_incomes)==(btrue);
  List_Precondition(Machine(incomes_m),maximum)==(btrue);
  List_Precondition(Machine(incomes_m),minimum)==(btrue)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(incomes_m),minimum)==(btrue | min_income_day:=min_d);
  Expanded_List_Substitution(Machine(incomes_m),maximum)==(btrue | max_income_day:=max_d);
  Expanded_List_Substitution(Machine(incomes_m),sum_incomes)==(btrue | sum:=sum_i);
  Expanded_List_Substitution(Machine(incomes_m),set_income)==(day: dom(incomes) & income: 0..1000000 & incomes(day): 0..1000000 | @(t_incomes,t_min,t_max,t_sum).(t_incomes: 1..7 --> 0..1000000 & t_min: 1..7 & t_max: 1..7 & t_sum: 0..7000000 & !jj.(jj: dom(t_incomes) => t_incomes(jj)>=t_incomes(t_max)) & !jj.(jj: dom(t_incomes) => t_incomes(jj)<=t_incomes(t_min)) & t_sum = SIGMA(ii).(ii: dom(t_incomes) | t_incomes(ii)) & t_incomes = incomes<+{day|->income} ==> incomes,sum_i,min_d,max_d:=t_incomes,t_sum,t_min,t_max));
  Expanded_List_Substitution(Machine(incomes_m),get_income)==(day: dom(incomes) & income: 0..1000000 & incomes(day): 0..1000000 | income:=incomes(day));
  List_Substitution(Machine(incomes_m),get_income)==(income:=incomes(day));
  List_Substitution(Machine(incomes_m),set_income)==(ANY t_incomes,t_min,t_max,t_sum WHERE t_incomes: 1..7 --> 0..1000000 & t_min: 1..7 & t_max: 1..7 & t_sum: 0..1000000*7 & !jj.(jj: dom(t_incomes) => t_incomes(jj)>=t_incomes(t_max)) & !jj.(jj: dom(t_incomes) => t_incomes(jj)<=t_incomes(t_min)) & t_sum = SIGMA(ii).(ii: dom(t_incomes) | t_incomes(ii)) & t_incomes = incomes<+{day|->income} THEN incomes:=t_incomes || sum_i:=t_sum || min_d:=t_min || max_d:=t_max END);
  List_Substitution(Machine(incomes_m),sum_incomes)==(sum:=sum_i);
  List_Substitution(Machine(incomes_m),maximum)==(max_income_day:=max_d);
  List_Substitution(Machine(incomes_m),minimum)==(min_income_day:=min_d)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(incomes_m))==(?);
  Inherited_List_Constants(Machine(incomes_m))==(?);
  List_Constants(Machine(incomes_m))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(incomes_m))==(?);
  Context_List_Defered(Machine(incomes_m))==(?);
  Context_List_Sets(Machine(incomes_m))==(?);
  List_Valuable_Sets(Machine(incomes_m))==(?);
  Inherited_List_Enumerated(Machine(incomes_m))==(?);
  Inherited_List_Defered(Machine(incomes_m))==(?);
  Inherited_List_Sets(Machine(incomes_m))==(?);
  List_Enumerated(Machine(incomes_m))==(?);
  List_Defered(Machine(incomes_m))==(?);
  List_Sets(Machine(incomes_m))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(incomes_m))==(?);
  Expanded_List_HiddenConstants(Machine(incomes_m))==(?);
  List_HiddenConstants(Machine(incomes_m))==(?);
  External_List_HiddenConstants(Machine(incomes_m))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(incomes_m))==(btrue);
  Context_List_Properties(Machine(incomes_m))==(btrue);
  Inherited_List_Properties(Machine(incomes_m))==(btrue);
  List_Properties(Machine(incomes_m))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(incomes_m),get_income)==(?);
  List_ANY_Var(Machine(incomes_m),set_income)==((Var(t_incomes) == SetOf(btype(INTEGER,1,7)*btype(INTEGER,0,1000000))),(Var(t_min) == btype(INTEGER,?,?)),(Var(t_max) == btype(INTEGER,?,?)),(Var(t_sum) == btype(INTEGER,?,?)));
  List_ANY_Var(Machine(incomes_m),sum_incomes)==(?);
  List_ANY_Var(Machine(incomes_m),maximum)==(?);
  List_ANY_Var(Machine(incomes_m),minimum)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(incomes_m)) == (? | ? | ? | ? | get_income,set_income,sum_incomes,maximum,minimum | ? | ? | ? | incomes_m);
  List_Of_HiddenCst_Ids(Machine(incomes_m)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(incomes_m)) == (?);
  List_Of_VisibleVar_Ids(Machine(incomes_m)) == (sum_i,max_d,min_d,incomes | ?);
  List_Of_Ids_SeenBNU(Machine(incomes_m)) == (?: ?)
END
&
THEORY VisibleVariablesEnvX IS
  VisibleVariables(Machine(incomes_m)) == (Type(sum_i) == Mvv(btype(INTEGER,?,?));Type(max_d) == Mvv(btype(INTEGER,?,?));Type(min_d) == Mvv(btype(INTEGER,?,?));Type(incomes) == Mvv(SetOf(btype(INTEGER,1,7)*btype(INTEGER,0,1000000))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(incomes_m)) == (Type(minimum) == Cst(btype(INTEGER,?,?),No_type);Type(maximum) == Cst(btype(INTEGER,?,?),No_type);Type(sum_incomes) == Cst(btype(INTEGER,?,?),No_type);Type(set_income) == Cst(No_type,btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(get_income) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)));
  Observers(Machine(incomes_m)) == (Type(minimum) == Cst(btype(INTEGER,?,?),No_type);Type(maximum) == Cst(btype(INTEGER,?,?),No_type);Type(sum_incomes) == Cst(btype(INTEGER,?,?),No_type);Type(get_income) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)))
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
