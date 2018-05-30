// Agent sheep in project hunting

{ include("$jacamoJar/templates/common-cartago.asl") }

last_dir(null).
free.

+free : gsize(_,W,H) & jia.random(RX,W-1) & jia.random(RY,H-1) 
   <-  .print("I am going to go near (",RX," ; ", RY,")");
       !go_near(RX,RY).
+free
   <- .wait(100); -+free.
   
+near(X,Y) : free <- -+free.

+!go_near(X,Y) : free
  <- -near(_,_); 
     -last_dir(_); 
     !near(X,Y).

+!near(X,Y) : (pos(AgX,AgY) & jia.neighbour(AgX,AgY,X,Y)) 
   <- .print("I am at ", "(",AgX,",", AgY,")", " which is near (",X," ; ", Y,")");
      +near(X,Y).
   
+!near(X,Y) : pos(AgX,AgY) & last_dir(skip) 
   <- .print("I am at ", "(",AgX,",", AgY,")", " and I can't get to (",X," ; ", Y,")");
      +near(X,Y).

+!near(X,Y) : not near(X,Y)
   <- !next_step(X,Y);
      !near(X,Y).
+!near(X,Y) : true 
   <- !near(X,Y).
   
+!next_step(X,Y) : pos(AgX,AgY) 
   <- jia.get_direction(AgX, AgY, X, Y, D);
      -+last_dir(D);
      D.
+!next_step(X,Y) : not pos(_,_) 
   <- !next_step(X,Y).
-!next_step(X,Y) : true 
   <- -+last_dir(null);
      !next_step(X,Y).

+!pos(X,Y) : pos(X,Y) 
   <- .print("I've reached (",X," ; ", Y,")").
+!pos(X,Y) : not pos(X,Y)
   <- !next_step(X,Y);
      !pos(X,Y).
      
+cell(X,Y,sheep)
	<- 
	.print("Go to (",X," ; ", Y,")", sheep);
	+sheep(X,Y).

@psheep[atomic]
+sheep(X,Y) 
  :  free
  <- +hunt(X,Y) 
  .broadcast(tell, hunt(X,Y)).

@phunt[atomic] 
+hunt(X,Y)
	: side(I,J) & free
	<- 
	-hunt(X,Y);
	-free;
	.print("Wolf perceived and call the mates to hunting the sheep down: (",X+I," ; ", Y+J,")");
	!init_handle(sheep(X+I,Y+J)).
     
@pih1[atomic]
+!init_handle(Sheep) 
  :  .desire(near(_,_)) 
  <- .print("Dropping near(_,_) desires and intentions to handle ", Sheep);
     .drop_desire(near(_,_));
     !init_handle(Sheep).
     
@pih2[atomic]
+!init_handle(Sheep)
  :  pos(X,Y)
  <- .print("Going for catch the ", Sheep);
     !!handle(Sheep).

+!handle(sheep(X,Y)) 
  :  not free 
  <- .print("Handling ",sheep(X,Y)," now.");
     !pos(X,Y);
     !eat.

+!eat : not eating
	<- +eating;
	   eat;
	   -sheep(_,_);
	   .print("Finish handling ",sheep(X,Y));
       !hunt_next.

+!hunt_next 
  :  not sheep(_,_) & life(0)
  <- .print("Hunt next", X);
     .broadcast(tell, remove_eating);
     +remove_eating.
  
-!hunt_next <- .wait(10); -sheep(_,_); !hunt_next.

+remove_eating : eating
	<- -eating;
	   -+free.

/* end of a simulation */
+end_of_simulation(S,_) : true 
  <- .drop_all_desires; 
     .abolish(sheep(_,_));
     -+free;
     .print("-- END ",S," --").
