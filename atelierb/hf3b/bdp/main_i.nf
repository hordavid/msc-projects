Normalised(
THEORY MagicNumberX IS
  MagicNumber(Implementation(main_i))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Implementation(main_i))==(Machine(main));
  Level(Implementation(main_i))==(1);
  Upper_Level(Implementation(main_i))==(Machine(main))
END
&
THEORY LoadedStructureX IS
  Implementation(main_i)
END
&
THEORY ListSeesX IS
  List_Sees(Implementation(main_i))==(?)
END
&
THEORY ListIncludesX IS
  List_Includes(Implementation(main_i))==(BASIC_IO,ma);
  Inherited_List_Includes(Implementation(main_i))==(ma,BASIC_IO,ia,ib,iu)
END
&
THEORY ListPromotesX IS
  List_Promotes(Implementation(main_i))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Implementation(main_i))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Implementation(main_i))==(?);
  Context_List_Variables(Implementation(main_i))==(?);
  Abstract_List_Variables(Implementation(main_i))==(?);
  Local_List_Variables(Implementation(main_i))==(?);
  List_Variables(Implementation(main_i))==(tm,vm,ta,via1,tb,vib1,tu);
  External_List_Variables(Implementation(main_i))==(tm,vm,ta,via1,tb,vib1,tu)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Implementation(main_i))==(?);
  Abstract_List_VisibleVariables(Implementation(main_i))==(?);
  External_List_VisibleVariables(Implementation(main_i))==(viu1);
  Expanded_List_VisibleVariables(Implementation(main_i))==(viu1);
  List_VisibleVariables(Implementation(main_i))==(?);
  Internal_List_VisibleVariables(Implementation(main_i))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Implementation(main_i))==(btrue);
  Abstract_List_Invariant(Implementation(main_i))==(btrue);
  Expanded_List_Invariant(Implementation(main_i))==(vm: BOOL & tm: 1..5 --> BOOL & via1: BOOL & ta: 1..5 --> BOOL & vib1: BOOL & tb: 1..5 --> BOOL & viu1: BOOL & tu: 1..5 --> INT);
  Context_List_Invariant(Implementation(main_i))==(btrue);
  List_Invariant(Implementation(main_i))==(btrue)
END
&
THEORY ListAssertionsX IS
  Abstract_List_Assertions(Implementation(main_i))==(btrue);
  Expanded_List_Assertions(Implementation(main_i))==(btrue);
  Context_List_Assertions(Implementation(main_i))==(btrue);
  List_Assertions(Implementation(main_i))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Implementation(main_i))==(via1:=FALSE || @(ta$0).(ta$0: 1..5 --> BOOL ==> ta:=ta$0);(vib1:=FALSE || @(tb$0).(tb$0: 1..5 --> BOOL ==> tb:=tb$0));viu1,tu:=FALSE,(1..5)*{0};(vm:=FALSE || @(tm$0).(tm$0: 1..5 --> BOOL ==> tm:=tm$0)));
  Context_List_Initialisation(Implementation(main_i))==(skip);
  List_Initialisation(Implementation(main_i))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Implementation(main_i))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Implementation(main_i),Machine(BASIC_IO))==(?);
  List_Instanciated_Parameters(Implementation(main_i),Machine(ma))==(?)
END
&
THEORY ListConstraintsX IS
  List_Constraints(Implementation(main_i),Machine(ma))==(btrue);
  List_Constraints(Implementation(main_i))==(btrue);
  List_Context_Constraints(Implementation(main_i))==(btrue);
  List_Constraints(Implementation(main_i),Machine(BASIC_IO))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Implementation(main_i))==(op);
  List_Operations(Implementation(main_i))==(op)
END
&
THEORY ListInputX IS
  List_Input(Implementation(main_i),op)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Implementation(main_i),op)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Implementation(main_i),op)==(op)
END
&
THEORY ListPreconditionX IS
  Own_Precondition(Implementation(main_i),op)==(btrue);
  List_Precondition(Implementation(main_i),op)==(btrue)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Implementation(main_i),op)==(btrue | (btrue | viu1:=FALSE || vib1:=FALSE || via1:=FALSE || vm:=FALSE);(btrue | skip);(vm = FALSE & viu1 = FALSE | @gg.(gg: 1..5 --> INT ==> tu,viu1:=gg,TRUE));(btrue | skip);(vm = FALSE & viu1 = TRUE & via1 = FALSE | @ss.(ss: 1..5 --> BOOL & !jj.(jj: 1..5 => ss(jj) = bool(tu(jj)>0)) ==> ta,via1:=ss,TRUE));(btrue | skip);(vm = FALSE & viu1 = TRUE & vib1 = FALSE | @ss.(ss: 1..5 --> BOOL & !jj.(jj: 1..5 => ss(jj) = bool(tu(jj)<0)) ==> tb,vib1:=ss,TRUE));(btrue | skip);(vm = FALSE & viu1 = TRUE & via1 = TRUE & vib1 = TRUE | @aa.(aa: 1..5 --> BOOL & !jj.(jj: 1..5 => aa(jj) = bool(ta(jj)/=TRUE & tb(jj)/=TRUE)) ==> tm:=aa) || vm:=TRUE);(btrue | skip));
  List_Substitution(Implementation(main_i),op)==(init;ki;mbe;ki;mtra;ki;mtrb;ki;opm;ki)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Implementation(main_i))==(?);
  Inherited_List_Constants(Implementation(main_i))==(?);
  List_Constants(Implementation(main_i))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Implementation(main_i))==(?);
  Context_List_Defered(Implementation(main_i))==(?);
  Context_List_Sets(Implementation(main_i))==(?);
  List_Own_Enumerated(Implementation(main_i))==(?);
  List_Valuable_Sets(Implementation(main_i))==(?);
  Inherited_List_Enumerated(Implementation(main_i))==(?);
  Inherited_List_Defered(Implementation(main_i))==(?);
  Inherited_List_Sets(Implementation(main_i))==(?);
  List_Enumerated(Implementation(main_i))==(?);
  List_Defered(Implementation(main_i))==(?);
  List_Sets(Implementation(main_i))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Implementation(main_i))==(?);
  Expanded_List_HiddenConstants(Implementation(main_i))==(?);
  List_HiddenConstants(Implementation(main_i))==(?);
  External_List_HiddenConstants(Implementation(main_i))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Implementation(main_i))==(btrue);
  Context_List_Properties(Implementation(main_i))==(btrue);
  Inherited_List_Properties(Implementation(main_i))==(btrue);
  List_Properties(Implementation(main_i))==(btrue)
END
&
THEORY ListValuesX IS
  Values_Subs(Implementation(main_i))==(aa: aa);
  List_Values(Implementation(main_i))==(?)
END
&
THEORY ListSeenInfoX END
&
THEORY ListIncludedOperationsX IS
  List_Included_Operations(Implementation(main_i),Machine(ma))==(init,mbe,mtra,mtrb,opm,ki);
  List_Included_Operations(Implementation(main_i),Machine(BASIC_IO))==(INTERVAL_READ,INT_WRITE,BOOL_READ,BOOL_WRITE,CHAR_READ,CHAR_WRITE,STRING_WRITE)
END
&
THEORY InheritedEnvX IS
  Operations(Implementation(main_i))==(Type(op) == Cst(No_type,No_type))
END
&
THEORY ListVisibleStaticX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Implementation(main_i)) == (? | ? | ? | tm,vm,tu,tb,vib1,ta,via1 | op | ? | imported(Machine(BASIC_IO)),imported(Machine(ma)) | ? | main_i);
  List_Of_HiddenCst_Ids(Implementation(main_i)) == (? | ?);
  List_Of_VisibleCst_Ids(Implementation(main_i)) == (?);
  List_Of_VisibleVar_Ids(Implementation(main_i)) == (? | viu1);
  List_Of_Ids_SeenBNU(Implementation(main_i)) == (?: ?);
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
  List_Of_Ids_SeenBNU(Machine(ia)) == (?: ?);
  List_Of_Ids(Machine(BASIC_IO)) == (? | ? | ? | ? | INTERVAL_READ,INT_WRITE,BOOL_READ,BOOL_WRITE,CHAR_READ,CHAR_WRITE,STRING_WRITE | ? | ? | ? | BASIC_IO);
  List_Of_HiddenCst_Ids(Machine(BASIC_IO)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(BASIC_IO)) == (?);
  List_Of_VisibleVar_Ids(Machine(BASIC_IO)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(BASIC_IO)) == (?: ?)
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
&
THEORY ListLocalOperationsX IS
  List_Local_Operations(Implementation(main_i))==(?)
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
  TypingPredicate(Implementation(main_i))==(btrue)
END
&
THEORY ImportedVariablesListX IS
  ImportedVariablesList(Implementation(main_i),Machine(BASIC_IO))==(?);
  ImportedVisVariablesList(Implementation(main_i),Machine(BASIC_IO))==(?);
  ImportedVariablesList(Implementation(main_i),Machine(ma))==(tm,vm,ta,via1,tb,vib1,tu);
  ImportedVisVariablesList(Implementation(main_i),Machine(ma))==(viu1)
END
&
THEORY ListLocalOpInvariantX END
)
