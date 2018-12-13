Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(iu))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(iu))==(Machine(iu));
  Level(Machine(iu))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(iu)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(iu))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(iu))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(iu))==(?);
  List_Includes(Machine(iu))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(iu))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(iu))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(iu))==(?);
  Context_List_Variables(Machine(iu))==(?);
  Abstract_List_Variables(Machine(iu))==(?);
  Local_List_Variables(Machine(iu))==(tu);
  List_Variables(Machine(iu))==(tu);
  External_List_Variables(Machine(iu))==(tu)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(iu))==(?);
  Abstract_List_VisibleVariables(Machine(iu))==(?);
  External_List_VisibleVariables(Machine(iu))==(?);
  Expanded_List_VisibleVariables(Machine(iu))==(?);
  List_VisibleVariables(Machine(iu))==(viu1);
  Internal_List_VisibleVariables(Machine(iu))==(viu1)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(iu))==(btrue);
  Gluing_List_Invariant(Machine(iu))==(btrue);
  Expanded_List_Invariant(Machine(iu))==(btrue);
  Abstract_List_Invariant(Machine(iu))==(btrue);
  Context_List_Invariant(Machine(iu))==(btrue);
  List_Invariant(Machine(iu))==(viu1: BOOL & tu: 1..5 --> INT)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(iu))==(btrue);
  Abstract_List_Assertions(Machine(iu))==(btrue);
  Context_List_Assertions(Machine(iu))==(btrue);
  List_Assertions(Machine(iu))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(iu))==(viu1,tu:=FALSE,(1..5)*{0});
  Context_List_Initialisation(Machine(iu))==(skip);
  List_Initialisation(Machine(iu))==(viu1:=FALSE || tu:=(1..5)*{0})
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(iu))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(iu))==(btrue);
  List_Constraints(Machine(iu))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(iu))==(initu,be);
  List_Operations(Machine(iu))==(initu,be)
END
&
THEORY ListInputX IS
  List_Input(Machine(iu),initu)==(?);
  List_Input(Machine(iu),be)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(iu),initu)==(?);
  List_Output(Machine(iu),be)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(iu),initu)==(initu);
  List_Header(Machine(iu),be)==(be)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(iu),initu)==(btrue);
  List_Precondition(Machine(iu),be)==(viu1 = FALSE)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(iu),be)==(viu1 = FALSE | @gg.(gg: 1..5 --> INT ==> tu,viu1:=gg,TRUE));
  Expanded_List_Substitution(Machine(iu),initu)==(btrue | viu1:=FALSE);
  List_Substitution(Machine(iu),initu)==(viu1:=FALSE);
  List_Substitution(Machine(iu),be)==(ANY gg WHERE gg: 1..5 --> INT THEN tu:=gg || viu1:=TRUE END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(iu))==(?);
  Inherited_List_Constants(Machine(iu))==(?);
  List_Constants(Machine(iu))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(iu))==(?);
  Context_List_Defered(Machine(iu))==(?);
  Context_List_Sets(Machine(iu))==(?);
  List_Valuable_Sets(Machine(iu))==(?);
  Inherited_List_Enumerated(Machine(iu))==(?);
  Inherited_List_Defered(Machine(iu))==(?);
  Inherited_List_Sets(Machine(iu))==(?);
  List_Enumerated(Machine(iu))==(?);
  List_Defered(Machine(iu))==(?);
  List_Sets(Machine(iu))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(iu))==(?);
  Expanded_List_HiddenConstants(Machine(iu))==(?);
  List_HiddenConstants(Machine(iu))==(?);
  External_List_HiddenConstants(Machine(iu))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(iu))==(btrue);
  Context_List_Properties(Machine(iu))==(btrue);
  Inherited_List_Properties(Machine(iu))==(btrue);
  List_Properties(Machine(iu))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(iu),initu)==(?);
  List_ANY_Var(Machine(iu),be)==(Var(gg) == SetOf(btype(INTEGER,1,5)*btype(INTEGER,MININT,MAXINT)));
  List_ANY_Var(Machine(iu),?)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(iu)) == (? | ? | tu | ? | initu,be | ? | ? | ? | iu);
  List_Of_HiddenCst_Ids(Machine(iu)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(iu)) == (?);
  List_Of_VisibleVar_Ids(Machine(iu)) == (viu1 | ?);
  List_Of_Ids_SeenBNU(Machine(iu)) == (?: ?)
END
&
THEORY VariablesEnvX IS
  Variables(Machine(iu)) == (Type(tu) == Mvl(SetOf(btype(INTEGER,1,5)*btype(INTEGER,MININT,MAXINT))))
END
&
THEORY VisibleVariablesEnvX IS
  VisibleVariables(Machine(iu)) == (Type(viu1) == Mvv(btype(BOOL,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(iu)) == (Type(be) == Cst(No_type,No_type);Type(initu) == Cst(No_type,No_type))
END
&
THEORY TCIntRdX IS
  predB0 == OK;
  extended_sees == KO;
  B0check_tab == KO;
  local_op == OK;
  abstract_constants_visible_in_values == KO;
  event_b_project == KO;
  event_b_deadlockfreeness == KO;
  variant_clause_mandatory == KO
END
)
