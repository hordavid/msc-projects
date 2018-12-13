Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(m1))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(m1))==(Machine(m1));
  Level(Machine(m1))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(m1)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(m1))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(m1))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(m1))==(?);
  List_Includes(Machine(m1))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(m1))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(m1))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(m1))==(?);
  Context_List_Variables(Machine(m1))==(?);
  Abstract_List_Variables(Machine(m1))==(?);
  Local_List_Variables(Machine(m1))==(?);
  List_Variables(Machine(m1))==(?);
  External_List_Variables(Machine(m1))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(m1))==(?);
  Abstract_List_VisibleVariables(Machine(m1))==(?);
  External_List_VisibleVariables(Machine(m1))==(?);
  Expanded_List_VisibleVariables(Machine(m1))==(?);
  List_VisibleVariables(Machine(m1))==(mavg,maxi,mini,isFull,measures);
  Internal_List_VisibleVariables(Machine(m1))==(mavg,maxi,mini,isFull,measures)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(m1))==(btrue);
  Gluing_List_Invariant(Machine(m1))==(btrue);
  Expanded_List_Invariant(Machine(m1))==(btrue);
  Abstract_List_Invariant(Machine(m1))==(btrue);
  Context_List_Invariant(Machine(m1))==(btrue);
  List_Invariant(Machine(m1))==(measures: 1..100 +-> INT & isFull: BOOL & (isFull = TRUE => card(measures) = 100) & (isFull = FALSE => card(measures)<100) & mini: 1..100 & maxi: 1..100 & mavg: INT & !jj.(jj: 1..card(measures) & jj/=mini & card(measures)>=2 => measures(mini)<=measures(jj)) & !jj.(jj: 1..card(measures) & jj/=maxi & card(measures)>=2 => measures(maxi)>=measures(jj)) & (measures/={} => mavg = SIGMA(ii).(ii: 1..card(measures) | measures(ii))/card(measures)))
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(m1))==(btrue);
  Abstract_List_Assertions(Machine(m1))==(btrue);
  Context_List_Assertions(Machine(m1))==(btrue);
  List_Assertions(Machine(m1))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(m1))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(m1))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(m1))==(measures,isFull,mini,maxi,mavg:={},FALSE,1,1,0);
  Context_List_Initialisation(Machine(m1))==(skip);
  List_Initialisation(Machine(m1))==(measures:={} || isFull:=FALSE || mini:=1 || maxi:=1 || mavg:=0)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(m1))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(m1))==(btrue);
  List_Constraints(Machine(m1))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(m1))==(store,average,minimum,maximum);
  List_Operations(Machine(m1))==(store,average,minimum,maximum)
END
&
THEORY ListInputX IS
  List_Input(Machine(m1),store)==(item);
  List_Input(Machine(m1),average)==(?);
  List_Input(Machine(m1),minimum)==(?);
  List_Input(Machine(m1),maximum)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(m1),store)==(?);
  List_Output(Machine(m1),average)==(ret);
  List_Output(Machine(m1),minimum)==(ret);
  List_Output(Machine(m1),maximum)==(ret)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(m1),store)==(store(item));
  List_Header(Machine(m1),average)==(ret <-- average);
  List_Header(Machine(m1),minimum)==(ret <-- minimum);
  List_Header(Machine(m1),maximum)==(ret <-- maximum)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(m1),store)==(item: INT);
  List_Precondition(Machine(m1),average)==(measures: 1..100 +-> INT);
  List_Precondition(Machine(m1),minimum)==(measures: 1..100 +-> INT);
  List_Precondition(Machine(m1),maximum)==(measures: 1..100 +-> INT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(m1),maximum)==(measures: 1..100 +-> INT | @ii.(ii: 1..100 & !jj.(jj: 1..card(measures) & jj/=ii & card(measures)>=2 => measures(ii)>=measures(jj)) ==> ret:=measures(ii)));
  Expanded_List_Substitution(Machine(m1),minimum)==(measures: 1..100 +-> INT | @ii.(ii: 1..100 & !jj.(jj: 1..card(measures) & jj/=ii & card(measures)>=2 => measures(ii)<=measures(jj)) ==> ret:=measures(ii)));
  Expanded_List_Substitution(Machine(m1),average)==(measures: 1..100 +-> INT | @sum.(sum: INT & sum = SIGMA(ii).(ii: 1..card(measures) & measures/={} | measures(ii)) & SIGMA(ii).(ii: 1..card(measures) & measures/={} | measures(ii)): INT ==> ret:=sum/card(measures)));
  Expanded_List_Substitution(Machine(m1),store)==(item: INT | @(t_measures,t_isFull,t_mini,t_maxi,t_mavg).(t_measures: 1..100 +-> INT & t_mini: 1..100 & t_maxi: 1..100 & t_mavg: INT & t_isFull: BOOL & (t_isFull = TRUE => card(t_measures) = 100) & (t_isFull = FALSE => card(t_measures)<100) & !jj.(jj: 2..card(measures) & t_isFull = TRUE => t_measures = measures<+{jj-1|->measures(jj)}) & t_measures = measures<+{card(measures)|->item} & !jj.(jj: 1..card(t_measures) & jj/=t_mini & card(t_measures)>=2 => t_measures(t_mini)<=t_measures(jj)) & !jj.(jj: 1..card(t_measures) & jj/=t_maxi & card(t_measures)>=2 => t_measures(t_maxi)>=t_measures(jj)) & (t_measures/={} => t_mavg = SIGMA(ii).(ii: 1..card(t_measures) | t_measures(ii))/card(t_measures)) ==> measures,isFull,mini,maxi,mavg:=t_measures,t_isFull,t_mini,t_maxi,t_mavg));
  List_Substitution(Machine(m1),store)==(ANY t_measures,t_isFull,t_mini,t_maxi,t_mavg WHERE t_measures: 1..100 +-> INT & t_mini: 1..100 & t_maxi: 1..100 & t_mavg: INT & t_isFull: BOOL & (t_isFull = TRUE => card(t_measures) = 100) & (t_isFull = FALSE => card(t_measures)<100) & !jj.(jj: 2..card(measures) & t_isFull = TRUE => t_measures = measures<+{jj-1|->measures(jj)}) & t_measures = measures<+{card(measures)|->item} & !jj.(jj: 1..card(t_measures) & jj/=t_mini & card(t_measures)>=2 => t_measures(t_mini)<=t_measures(jj)) & !jj.(jj: 1..card(t_measures) & jj/=t_maxi & card(t_measures)>=2 => t_measures(t_maxi)>=t_measures(jj)) & (t_measures/={} => t_mavg = SIGMA(ii).(ii: 1..card(t_measures) | t_measures(ii))/card(t_measures)) THEN measures:=t_measures || isFull:=t_isFull || mini:=t_mini || maxi:=t_maxi || mavg:=t_mavg END);
  List_Substitution(Machine(m1),average)==(ANY sum WHERE sum: INT & sum = SIGMA(ii).(ii: 1..card(measures) & measures/={} | measures(ii)) & SIGMA(ii).(ii: 1..card(measures) & measures/={} | measures(ii)): INT THEN ret:=sum/card(measures) END);
  List_Substitution(Machine(m1),minimum)==(ANY ii WHERE ii: 1..100 & !jj.(jj: 1..card(measures) & jj/=ii & card(measures)>=2 => measures(ii)<=measures(jj)) THEN ret:=measures(ii) END);
  List_Substitution(Machine(m1),maximum)==(ANY ii WHERE ii: 1..100 & !jj.(jj: 1..card(measures) & jj/=ii & card(measures)>=2 => measures(ii)>=measures(jj)) THEN ret:=measures(ii) END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(m1))==(?);
  Inherited_List_Constants(Machine(m1))==(?);
  List_Constants(Machine(m1))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(m1))==(?);
  Context_List_Defered(Machine(m1))==(?);
  Context_List_Sets(Machine(m1))==(?);
  List_Valuable_Sets(Machine(m1))==(?);
  Inherited_List_Enumerated(Machine(m1))==(?);
  Inherited_List_Defered(Machine(m1))==(?);
  Inherited_List_Sets(Machine(m1))==(?);
  List_Enumerated(Machine(m1))==(?);
  List_Defered(Machine(m1))==(?);
  List_Sets(Machine(m1))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(m1))==(?);
  Expanded_List_HiddenConstants(Machine(m1))==(?);
  List_HiddenConstants(Machine(m1))==(?);
  External_List_HiddenConstants(Machine(m1))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(m1))==(btrue);
  Context_List_Properties(Machine(m1))==(btrue);
  Inherited_List_Properties(Machine(m1))==(btrue);
  List_Properties(Machine(m1))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(m1),store)==((Var(t_measures) == SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?))),(Var(t_isFull) == btype(BOOL,?,?)),(Var(t_mini) == btype(INTEGER,?,?)),(Var(t_maxi) == btype(INTEGER,?,?)),(Var(t_mavg) == btype(INTEGER,?,?)));
  List_ANY_Var(Machine(m1),average)==(Var(sum) == btype(INTEGER,?,?));
  List_ANY_Var(Machine(m1),minimum)==(Var(ii) == btype(INTEGER,?,?));
  List_ANY_Var(Machine(m1),maximum)==(Var(ii) == btype(INTEGER,?,?))
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(m1)) == (? | ? | ? | ? | store,average,minimum,maximum | ? | ? | ? | m1);
  List_Of_HiddenCst_Ids(Machine(m1)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(m1)) == (?);
  List_Of_VisibleVar_Ids(Machine(m1)) == (mavg,maxi,mini,isFull,measures | ?);
  List_Of_Ids_SeenBNU(Machine(m1)) == (?: ?)
END
&
THEORY VisibleVariablesEnvX IS
  VisibleVariables(Machine(m1)) == (Type(mavg) == Mvv(btype(INTEGER,?,?));Type(maxi) == Mvv(btype(INTEGER,?,?));Type(mini) == Mvv(btype(INTEGER,?,?));Type(isFull) == Mvv(btype(BOOL,?,?));Type(measures) == Mvv(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(m1)) == (Type(maximum) == Cst(btype(INTEGER,?,?),No_type);Type(minimum) == Cst(btype(INTEGER,?,?),No_type);Type(average) == Cst(btype(INTEGER,?,?),No_type);Type(store) == Cst(No_type,btype(INTEGER,?,?)));
  Observers(Machine(m1)) == (Type(maximum) == Cst(btype(INTEGER,?,?),No_type);Type(minimum) == Cst(btype(INTEGER,?,?),No_type);Type(average) == Cst(btype(INTEGER,?,?),No_type))
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
