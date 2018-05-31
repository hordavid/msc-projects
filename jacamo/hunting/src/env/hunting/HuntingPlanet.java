package hunting;

import java.util.logging.Logger;

import cartago.Artifact;
import cartago.OPERATION;
import cartago.ObsProperty;
import jason.asSyntax.Atom;
import jason.asSyntax.Term;
import jason.environment.grid.Location;

public class HuntingPlanet extends Artifact {
	
	private static Logger logger = Logger.getLogger(HuntingPlanet.class.getName());
	
	private static Term sheep = new Atom("sheep");
	
	int agId = -1;
	static int sleep = 100;
	static HuntingWorldModel model = null;
	static HuntingWorldView view;
	
	int step;
	
	static boolean hasGUI   = true;
	
	@OPERATION
    public void init(int agId) {
        this.agId = agId;
        initWorld();
    }
	
	public synchronized void initWorld() {
        try {
        	if (model == null) {
	            model = HuntingWorldModel.world();
	            
	            if (hasGUI) {
	                view = new HuntingWorldView(model);
	                view.setEnv(this);
	            }
	        }
            defineObsProperty("gsize", 1, model.getWidth(), model.getHeight());
            defineObsProperty("pos", -1, -1);
            defineObsProperty("life", 4);
            
            switch(agId) {
	        	case 3: defineObsProperty("side", 0, 1); break;
	        	case 4: defineObsProperty("side", -1, 0); break;
	        	case 5: defineObsProperty("side", 0, -1); break;
	        	case 6: defineObsProperty("side", 1, 0); break;
	        }
            
            step = 0;
            
            updateAgPercept();
        } catch (Exception e) {
            logger.warning("Error creating world "+e);
            e.printStackTrace();
        }
    }
	
	private void updateAgPercept() {
        // its location
		
        Location l = model.getAgPos(agId);
        ObsProperty p = getObsProperty("pos");
        p.updateValue(0, l.x);
        p.updateValue(1, l.y);

        step++;
        
        // what's around
        updateAgPercept(l.x - 1, l.y - 1);
        updateAgPercept(l.x - 1, l.y);
        updateAgPercept(l.x - 1, l.y + 1);
        updateAgPercept(l.x, l.y - 1);
        updateAgPercept(l.x, l.y);
        updateAgPercept(l.x, l.y + 1);
        updateAgPercept(l.x + 1, l.y - 1);
        updateAgPercept(l.x + 1, l.y);
        updateAgPercept(l.x + 1, l.y + 1);
    }
	
	private void updateAgPercept(int x, int y) {
        if (model == null || !model.inGrid(x,y)) return;
        
        try {
        	removeObsPropertyByTemplate("cell", null, null, null);
        } catch (IllegalArgumentException e) {}
        
        if (model.hasObject(HuntingWorldModel.AGENT, x, y) && model.getAgAtPos(x, y) < 3) { // sheep        	
            
        	if (model.getSheepLife(model.getAgAtPos(x, y)) > 0) {
        		defineObsProperty("cell", x, y, sheep);
                logger.info("There is a sheep on position ("+ x + " ; " + y + ")");
        	}
        }
    }
	
	@OPERATION void up() throws Exception {     move(Move.UP);    }
    @OPERATION void down() throws Exception {   move(Move.DOWN);  }
    @OPERATION void right() throws Exception {  move(Move.RIGHT); }
    @OPERATION void left() throws Exception {   move(Move.LEFT);  }
    
    @OPERATION void eat() throws Exception {
        if (sleep > 0) await_time(sleep);
        if(model.eat(agId)) {
        	defineObsProperty("life", 0);
        	logger.info("Sheep is catched only " + step + " steps.");
        	step = 0;
        };
        updateAgPercept();
    }
 
    @OPERATION void skip() {
        if (sleep > 0) await_time(sleep);
        updateAgPercept();
    }
    
    public enum Move {
        UP, DOWN, RIGHT, LEFT
    };
    
    void move(Move m) throws Exception {
        if (sleep > 0) await_time(sleep);
    	model.move(m, agId);
        updateAgPercept();
    }
    
    public void endSimulation() {
        defineObsProperty("end_of_simulation", 1, 0);
        if (view != null) view.setVisible(false);
        HuntingWorldModel.destroy();
    }
}
