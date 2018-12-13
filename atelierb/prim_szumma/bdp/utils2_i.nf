Normalised(
THEORY MagicNumberX IS
  MagicNumber(Implementation(utils2_i))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Implementation(utils2_i))==(Machine(utils2));
  Level(Implementation(utils2_i))==(1);
  Upper_Level(Implementation(utils2_i))==(Machine(utils2))
END
&
THEORY LoadedStructureX IS
  Implementation(utils2_i)
END
&
THEORY ListSeesX IS
  List_Sees(Implementation(utils2_i))==(?)
END
&
THEORY ListIncludesX IS
  List_Includes(Implementation(utils2_i))==(utils);
  Inherited_List_Includes(Implementation(utils2_i))==(utils)
END
&
THEORY ListPromotesX IS
  List_Promotes(Implementation(utils2_i))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Implementation(utils2_i))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Implementation(utils2_i))==(?);
  Context_List_Variables(Implementation(utils2_i))==(?);
  Abstract_List_Variables(Implementation(utils2_i))==(?);
  Local_List_Variables(Implementation(utils2_i))==(?);
  List_Variables(Implementation(utils2_i))==(?);
  External_List_Variables(Implementation(utils2_i))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Implementation(utils2_i))==(?);
  Abstract_List_VisibleVariables(Implementation(utils2_i))==(?);
  External_List_VisibleVariables(Implementation(utils2_i))==(?);
  Expanded_List_VisibleVariables(Implementation(utils2_i))==(?);
  List_VisibleVariables(Implementation(utils2_i))==(?);
  Internal_List_VisibleVariables(Implementation(utils2_i))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Implementation(utils2_i))==(btrue);
  Abstract_List_Invariant(Implementation(utils2_i))==(btrue);
  Expanded_List_Invariant(Implementation(utils2_i))==(btrue);
  Context_List_Invariant(Implementation(utils2_i))==(btrue);
  List_Invariant(Implementation(utils2_i))==(btrue)
END
&
THEORY ListAssertionsX IS
  Abstract_List_Assertions(Implementation(utils2_i))==(btrue);
  Expanded_List_Assertions(Implementation(utils2_i))==(btrue);
  Context_List_Assertions(Implementation(utils2_i))==(btrue);
  List_Assertions(Implementation(utils2_i))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Implementation(utils2_i))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Implementation(utils2_i))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Implementation(utils2_i))==(skip);
  Context_List_Initialisation(Implementation(utils2_i))==(skip);
  List_Initialisation(Implementation(utils2_i))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Implementation(utils2_i))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Implementation(utils2_i),Machine(utils))==(?)
END
&
THEORY ListConstraintsX IS
  List_Constraints(Implementation(utils2_i),Machine(utils))==(btrue);
  List_Constraints(Implementation(utils2_i))==(btrue);
  List_Context_Constraints(Implementation(utils2_i))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Implementation(utils2_i))==(prim_osszeg,prim_darab);
  List_Operations(Implementation(utils2_i))==(prim_osszeg,prim_darab)
END
&
THEORY ListInputX IS
  List_Input(Implementation(utils2_i),prim_osszeg)==(tomb);
  List_Input(Implementation(utils2_i),prim_darab)==(tomb)
END
&
THEORY ListOutputX IS
  List_Output(Implementation(utils2_i),prim_osszeg)==(ret);
  List_Output(Implementation(utils2_i),prim_darab)==(ret)
END
&
THEORY ListHeaderX IS
  List_Header(Implementation(utils2_i),prim_osszeg)==(ret <-- prim_osszeg(tomb));
  List_Header(Implementation(utils2_i),prim_darab)==(ret <-- prim_darab(tomb))
END
&
THEORY ListPreconditionX IS
  Own_Precondition(Implementation(utils2_i),prim_osszeg)==(btrue);
  List_Precondition(Implementation(utils2_i),prim_osszeg)==(tomb: 1..10 --> 1..100 & dom(tomb) = 1..10);
  Own_Precondition(Implementation(utils2_i),prim_darab)==(btrue);
  List_Precondition(Implementation(utils2_i),prim_darab)==(tomb: 1..10 --> 1..100 & dom(tomb) = 1..10)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Implementation(utils2_i),prim_darab)==(tomb: 1..10 --> 1..100 & dom(tomb) = 1..10 | @(ii,darab,akt,prim).(ii:=1;darab:=0;akt:=0;prim:=FALSE;WHILE ii/=11 DO (tomb(ii): INT & ii: dom(tomb) | akt:=tomb(ii));(akt: NAT | @v_ret.(v_ret: BOOL & v_ret = bool(2<=akt & !zz.(zz: 2..akt-1 => akt mod zz/=0)) ==> prim:=v_ret));(TRUE = prim ==> (darab+1: INT & darab: INT & 1: INT | darab:=darab+1) [] not(TRUE = prim) ==> skip);(ii+1: INT & ii: INT & 1: INT | ii:=ii+1) INVARIANT ii: NAT & tomb: 1..10 --> 1..100 & ii: 1..11 & darab: 0..10 & darab<ii & darab = SIGMA(jj).(jj: 1..ii-1 | {TRUE|->1,FALSE|->0}(bool(2<=tomb(jj) & !zz.(zz: 2..tomb(jj)-1 => tomb(jj) mod zz/=0)))) VARIANT 11-ii END;(darab: INT | ret:=darab)));
  Expanded_List_Substitution(Implementation(utils2_i),prim_osszeg)==(tomb: 1..10 --> 1..100 & dom(tomb) = 1..10 | @(ii,ossz,akt,prim).(ii:=1;ossz:=0;akt:=1;prim:=FALSE;WHILE ii<=10 DO (tomb(ii): INT & ii: dom(tomb) | akt:=tomb(ii));(akt: NAT | @v_ret.(v_ret: BOOL & v_ret = bool(2<=akt & !zz.(zz: 2..akt-1 => akt mod zz/=0)) ==> prim:=v_ret));(TRUE = prim ==> (ossz+akt: INT & ossz: INT & akt: INT | ossz:=ossz+akt) [] not(TRUE = prim) ==> skip);(ii+1: INT & ii: INT & 1: INT | ii:=ii+1) INVARIANT tomb: 1..10 --> 1..100 & ii: 1..11 & akt: 1..100 & 0<=ossz & ossz<=(ii-1)*100 & ossz = SIGMA(jj).(jj: 1..ii-1 | {TRUE|->tomb(jj),FALSE|->0}(bool(2<=tomb(jj) & !zz.(zz: 2..tomb(jj)-1 => tomb(jj) mod zz/=0)))) VARIANT 11-ii END;(ossz: INT | ret:=ossz)));
  List_Substitution(Implementation(utils2_i),prim_osszeg)==(VAR ii,ossz,akt,prim IN ii:=1;ossz:=0;akt:=1;prim:=FALSE;WHILE ii<=10 DO akt:=tomb(ii);prim <-- is_prim_op2(akt);IF TRUE = prim THEN ossz:=ossz+akt END;ii:=ii+1 INVARIANT tomb: 1..10 --> 1..100 & ii: 1..11 & akt: 1..100 & 0<=ossz & ossz<=(ii-1)*100 & ossz = SIGMA(jj).(jj: 1..ii-1 | {TRUE|->tomb(jj),FALSE|->0}(bool(2<=tomb(jj) & !zz.(zz: 2..tomb(jj)-1 => tomb(jj) mod zz/=0)))) VARIANT 11-ii END;ret:=ossz END);
  List_Substitution(Implementation(utils2_i),prim_darab)==(VAR ii,darab,akt,prim IN ii:=1;darab:=0;akt:=0;prim:=FALSE;WHILE ii/=11 DO akt:=tomb(ii);prim <-- is_prim_op2(akt);IF TRUE = prim THEN darab:=darab+1 END;ii:=ii+1 INVARIANT ii: NAT & tomb: 1..10 --> 1..100 & ii: 1..11 & darab: 0..10 & darab<ii & darab = SIGMA(jj).(jj: 1..ii-1 | {TRUE|->1,FALSE|->0}(bool(2<=tomb(jj) & !zz.(zz: 2..tomb(jj)-1 => tomb(jj) mod zz/=0)))) VARIANT 11-ii END;ret:=darab END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Implementation(utils2_i))==(?);
  Inherited_List_Constants(Implementation(utils2_i))==(?);
  List_Constants(Implementation(utils2_i))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Implementation(utils2_i))==(?);
  Context_List_Defered(Implementation(utils2_i))==(?);
  Context_List_Sets(Implementation(utils2_i))==(?);
  List_Own_Enumerated(Implementation(utils2_i))==(?);
  List_Valuable_Sets(Implementation(utils2_i))==(?);
  Inherited_List_Enumerated(Implementation(utils2_i))==(?);
  Inherited_List_Defered(Implementation(utils2_i))==(?);
  Inherited_List_Sets(Implementation(utils2_i))==(?);
  List_Enumerated(Implementation(utils2_i))==(?);
  List_Defered(Implementation(utils2_i))==(?);
  List_Sets(Implementation(utils2_i))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Implementation(utils2_i))==(?);
  Expanded_List_HiddenConstants(Implementation(utils2_i))==(?);
  List_HiddenConstants(Implementation(utils2_i))==(?);
  External_List_HiddenConstants(Implementation(utils2_i))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Implementation(utils2_i))==(btrue);
  Context_List_Properties(Implementation(utils2_i))==(btrue);
  Inherited_List_Properties(Implementation(utils2_i))==(btrue);
  List_Properties(Implementation(utils2_i))==(btrue)
END
&
THEORY ListValuesX IS
  Values_Subs(Implementation(utils2_i))==(aa: aa);
  List_Values(Implementation(utils2_i))==(?)
END
&
THEORY ListSeenInfoX END
&
THEORY ListIncludedOperationsX IS
  List_Included_Operations(Implementation(utils2_i),Machine(utils))==(is_prim_op,is_prim_op2)
END
&
THEORY InheritedEnvX IS
  Operations(Implementation(utils2_i))==(Type(prim_darab) == Cst(btype(INTEGER,?,?),SetOf(btype(INTEGER,1,10)*btype(INTEGER,1,100)));Type(prim_osszeg) == Cst(btype(INTEGER,?,?),SetOf(btype(INTEGER,1,10)*btype(INTEGER,1,100))))
END
&
THEORY ListVisibleStaticX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Implementation(utils2_i)) == (? | ? | ? | ? | prim_osszeg,prim_darab | ? | imported(Machine(utils)) | ? | utils2_i);
  List_Of_HiddenCst_Ids(Implementation(utils2_i)) == (? | ?);
  List_Of_VisibleCst_Ids(Implementation(utils2_i)) == (?);
  List_Of_VisibleVar_Ids(Implementation(utils2_i)) == (? | ?);
  List_Of_Ids_SeenBNU(Implementation(utils2_i)) == (?: ?);
  List_Of_Ids(Machine(utils)) == (? | ? | ? | ? | is_prim_op,is_prim_op2 | ? | ? | ? | utils);
  List_Of_HiddenCst_Ids(Machine(utils)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(utils)) == (?);
  List_Of_VisibleVar_Ids(Machine(utils)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(utils)) == (?: ?)
END
&
THEORY VariablesLocEnvX IS
  Variables_Loc(Implementation(utils2_i),prim_osszeg, 1) == (Type(ii) == Lvl(btype(INTEGER,?,?));Type(ossz) == Lvl(btype(INTEGER,?,?));Type(akt) == Lvl(btype(INTEGER,?,?));Type(prim) == Lvl(btype(BOOL,?,?)));
  Variables_Loc(Implementation(utils2_i),prim_darab, 1) == (Type(ii) == Lvl(btype(INTEGER,?,?));Type(darab) == Lvl(btype(INTEGER,?,?));Type(akt) == Lvl(btype(INTEGER,?,?));Type(prim) == Lvl(btype(BOOL,?,?)))
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
  List_Local_Operations(Implementation(utils2_i))==(?)
END
&
THEORY ListLocalInputX END
&
THEORY ListLocalOutputX END
&
THEORY ListLocalHeaderX END
&
THEORY ListLocalPreconditionX END
&
THEORY ListLocalSubstitutionX END
&
THEORY TypingPredicateX IS
  TypingPredicate(Implementation(utils2_i))==(btrue)
END
&
THEORY ImportedVariablesListX IS
  ImportedVariablesList(Implementation(utils2_i),Machine(utils))==(?);
  ImportedVisVariablesList(Implementation(utils2_i),Machine(utils))==(?)
END
&
THEORY ListLocalOpInvariantX END
)
