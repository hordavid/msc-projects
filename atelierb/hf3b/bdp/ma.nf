Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(ma))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(ma))==(Machine(ma));
  Level(Machine(ma))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(ma)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(ma))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(ma))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(ma))==(iu,ib,ia);
  List_Includes(Machine(ma))==(ia,ib,iu)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(ma))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(ma))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(ma))==(?);
  Context_List_Variables(Machine(ma))==(?);
  Abstract_List_Variables(Machine(ma))==(?);
  Local_List_Variables(Machine(ma))==(tm,vm);
  List_Variables(Machine(ma))==(tm,vm,ta,via1,tb,vib1,tu);
  External_List_Variables(Machine(ma))==(tm,vm,ta,via1,tb,vib1,tu)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(ma))==(?);
  Abstract_List_VisibleVariables(Machine(ma))==(?);
  External_List_VisibleVariables(Machine(ma))==(viu1);
  Expanded_List_VisibleVariables(Machine(ma))==(viu1);
  List_VisibleVariables(Machine(ma))==(?);
  Internal_List_VisibleVariables(Machine(ma))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(ma))==(btrue);
  Gluing_List_Invariant(Machine(ma))==(btrue);
  Abstract_List_Invariant(Machine(ma))==(btrue);
  Expanded_List_Invariant(Machine(ma))==(via1: BOOL & ta: 1..5 --> BOOL & vib1: BOOL & tb: 1..5 --> BOOL & viu1: BOOL & tu: 1..5 --> INT);
  Context_List_Invariant(Machine(ma))==(btrue);
  List_Invariant(Machine(ma))==(vm: BOOL & tm: 1..5 --> BOOL)
END
&
THEORY ListAssertionsX IS
  Abstract_List_Assertions(Machine(ma))==(btrue);
  Expanded_List_Assertions(Machine(ma))==(btrue);
  Context_List_Assertions(Machine(ma))==(btrue);
  List_Assertions(Machine(ma))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(ma))==(via1:=FALSE || @(ta$0).(ta$0: 1..5 --> BOOL ==> ta:=ta$0);(vib1:=FALSE || @(tb$0).(tb$0: 1..5 --> BOOL ==> tb:=tb$0));viu1,tu:=FALSE,(1..5)*{0};(vm:=FALSE || @(tm$0).(tm$0: 1..5 --> BOOL ==> tm:=tm$0)));
  Context_List_Initialisation(Machine(ma))==(skip);
  List_Initialisation(Machine(ma))==(vm:=FALSE || tm:: 1..5 --> BOOL)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(ma))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(ma),Machine(ia))==(?);
  List_Instanciated_Parameters(Machine(ma),Machine(ib))==(?);
  List_Instanciated_Parameters(Machine(ma),Machine(iu))==(?)
END
&
THEORY ListConstraintsX IS
  List_Constraints(Machine(ma),Machine(iu))==(btrue);
  List_Context_Constraints(Machine(ma))==(btrue);
  List_Constraints(Machine(ma))==(btrue);
  List_Constraints(Machine(ma),Machine(ib))==(btrue);
  List_Constraints(Machine(ma),Machine(ia))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(ma))==(init,mbe,mtra,mtrb,opm,ki);
  List_Operations(Machine(ma))==(init,mbe,mtra,mtrb,opm,ki)
END
&
THEORY ListInputX IS
  List_Input(Machine(ma),init)==(?);
  List_Input(Machine(ma),mbe)==(?);
  List_Input(Machine(ma),mtra)==(?);
  List_Input(Machine(ma),mtrb)==(?);
  List_Input(Machine(ma),opm)==(?);
  List_Input(Machine(ma),ki)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(ma),init)==(?);
  List_Output(Machine(ma),mbe)==(?);
  List_Output(Machine(ma),mtra)==(?);
  List_Output(Machine(ma),mtrb)==(?);
  List_Output(Machine(ma),opm)==(?);
  List_Output(Machine(ma),ki)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(ma),init)==(init);
  List_Header(Machine(ma),mbe)==(mbe);
  List_Header(Machine(ma),mtra)==(mtra);
  List_Header(Machine(ma),mtrb)==(mtrb);
  List_Header(Machine(ma),opm)==(opm);
  List_Header(Machine(ma),ki)==(ki)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(ma),init)==(btrue);
  List_Precondition(Machine(ma),mbe)==(vm = FALSE & viu1 = FALSE);
  List_Precondition(Machine(ma),mtra)==(vm = FALSE & viu1 = TRUE & via1 = FALSE);
  List_Precondition(Machine(ma),mtrb)==(vm = FALSE & viu1 = TRUE & vib1 = FALSE);
  List_Precondition(Machine(ma),opm)==(vm = FALSE & viu1 = TRUE & via1 = TRUE & vib1 = TRUE);
  List_Precondition(Machine(ma),ki)==(btrue)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(ma),ki)==(btrue | skip);
  Expanded_List_Substitution(Machine(ma),opm)==(vm = FALSE & viu1 = TRUE & via1 = TRUE & vib1 = TRUE | @aa.(aa: 1..5 --> BOOL & !jj.(jj: 1..5 => aa(jj) = bool(ta(jj)/=TRUE & tb(jj)/=TRUE)) ==> tm:=aa) || vm:=TRUE);
  Expanded_List_Substitution(Machine(ma),mtrb)==(vm = FALSE & viu1 = TRUE & vib1 = FALSE & vib1 = FALSE & viu1 = TRUE | @ss.(ss: 1..5 --> BOOL & !jj.(jj: 1..5 => ss(jj) = bool(tu(jj)<0)) ==> tb,vib1:=ss,TRUE));
  Expanded_List_Substitution(Machine(ma),mtra)==(vm = FALSE & viu1 = TRUE & via1 = FALSE & via1 = FALSE & viu1 = TRUE | @ss.(ss: 1..5 --> BOOL & !jj.(jj: 1..5 => ss(jj) = bool(tu(jj)>0)) ==> ta,via1:=ss,TRUE));
  Expanded_List_Substitution(Machine(ma),mbe)==(vm = FALSE & viu1 = FALSE & viu1 = FALSE | @gg.(gg: 1..5 --> INT ==> tu,viu1:=gg,TRUE));
  Expanded_List_Substitution(Machine(ma),init)==(btrue | viu1:=FALSE || vib1:=FALSE || via1:=FALSE || vm:=FALSE);
  List_Substitution(Machine(ma),init)==(initu || initb || inita || vm:=FALSE);
  List_Substitution(Machine(ma),mbe)==(be);
  List_Substitution(Machine(ma),mtra)==(opa);
  List_Substitution(Machine(ma),mtrb)==(opb);
  List_Substitution(Machine(ma),opm)==(ANY aa WHERE aa: 1..5 --> BOOL & !jj.(jj: 1..5 => aa(jj) = bool(ta(jj)/=TRUE & tb(jj)/=TRUE)) THEN tm:=aa END || vm:=TRUE);
  List_Substitution(Machine(ma),ki)==(skip)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(ma))==(?);
  Inherited_List_Constants(Machine(ma))==(?);
  List_Constants(Machine(ma))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(ma))==(?);
  Context_List_Defered(Machine(ma))==(?);
  Context_List_Sets(Machine(ma))==(?);
  List_Valuable_Sets(Machine(ma))==(?);
  Inherited_List_Enumerated(Machine(ma))==(?);
  Inherited_List_Defered(Machine(ma))==(?);
  Inherited_List_Sets(Machine(ma))==(?);
  List_Enumerated(Machine(ma))==(?);
  List_Defered(Machine(ma))==(?);
  List_Sets(Machine(ma))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(ma))==(?);
  Expanded_List_HiddenConstants(Machine(ma))==(?);
  List_HiddenConstants(Machine(ma))==(?);
  External_List_HiddenConstants(Machine(ma))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(ma))==(btrue);
  Context_List_Properties(Machine(ma))==(btrue);
  Inherited_List_Properties(Machine(ma))==(btrue);
  List_Properties(Machine(ma))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(ma),init)==(?);
  List_ANY_Var(Machine(ma),mbe)==(?);
  List_ANY_Var(Machine(ma),mtra)==(?);
  List_ANY_Var(Machine(ma),mtrb)==(?);
  List_ANY_Var(Machine(ma),opm)==(Var(aa) == SetOf(btype(INTEGER,1,5)*btype(BOOL,0,1)));
  List_ANY_Var(Machine(ma),ki)==(?);
  List_ANY_Var(Machine(ma),?)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(ma)) == (? | ? | tm,vm | tu,tb,vib1,ta,via1 | init,mbe,mtra,mtrb,opm,ki | ? | included(Machine(ia)),included(Machine(ib)),included(Machine(iu)) | ? | ma);
  List_Of_HiddenCst_Ids(Machine(ma)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(ma)) == (?);
  List_Of_VisibleVar_Ids(Machine(ma)) == (? | viu1);
  List_Of_Ids_SeenBNU(Machine(ma)) == (?: ?);
  List_Of_Ids(Machine(iu)) == (? | ? | tu | ? | initu,be | ? | ? | ? | iu);
  List_Of_HiddenCst_Ids(Machine(iu)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(iu)) == (?);
  List_Of_VisibleVar_Ids(Machine(iu)) == (viu1 | ?);
  List_Of_Ids_SeenBNU(Machine(iu)) == (?: ?);
  List_Of_Ids(Machine(ib)) == (? | ? | tb,vib1 | ? | initb,opb | ? | used(Machine(iu)) | ? | ib);
  List_Of_HiddenCst_Ids(Machine(ib)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(ib)) == (?);
  List_Of_VisibleVar_Ids(Machine(ib)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(ib)) == (?: ?);
  List_Of_Ids(Machine(ia)) == (? | ? | ta,via1 | ? | inita,opa | ? | used(Machine(iu)) | ? | ia);
  List_Of_HiddenCst_Ids(Machine(ia)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(ia)) == (?);
  List_Of_VisibleVar_Ids(Machine(ia)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(ia)) == (?: ?)
END
&
THEORY VariablesEnvX IS
  Variables(Machine(ma)) == (Type(via1) == Mvl(btype(BOOL,?,?));Type(ta) == Mvl(SetOf(btype(INTEGER,1,5)*btype(BOOL,0,1)));Type(vib1) == Mvl(btype(BOOL,?,?));Type(tb) == Mvl(SetOf(btype(INTEGER,1,5)*btype(BOOL,0,1)));Type(tu) == Mvl(SetOf(btype(INTEGER,1,5)*btype(INTEGER,MININT,MAXINT)));Type(tm) == Mvl(SetOf(btype(INTEGER,1,5)*btype(BOOL,0,1)));Type(vm) == Mvl(btype(BOOL,?,?)))
END
&
THEORY VisibleVariablesEnvX IS
  VisibleVariables(Machine(ma)) == (Type(viu1) == Mvv(btype(BOOL,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(ma)) == (Type(ki) == Cst(No_type,No_type);Type(opm) == Cst(No_type,No_type);Type(mtrb) == Cst(No_type,No_type);Type(mtra) == Cst(No_type,No_type);Type(mbe) == Cst(No_type,No_type);Type(init) == Cst(No_type,No_type));
  Observers(Machine(ma)) == (Type(ki) == Cst(No_type,No_type))
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
