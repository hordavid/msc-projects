package hunting;

import java.util.HashMap;
import java.util.Random;
import java.util.logging.Logger;

import hunting.HuntingPlanet.Move;
import jason.environment.grid.GridWorldModel;
import jason.environment.grid.Location;

public class HuntingWorldModel extends GridWorldModel {
	
	// singleton pattern
    protected static HuntingWorldModel model = null;
    private String id = "HuntingWorldModel";
    private HashMap<Integer, Integer> sheepLifeMap;
    
    private Logger logger   = Logger.getLogger("jasonTeamSimLocal.mas2j." + HuntingWorldModel.class.getName());
    
	private HuntingWorldModel(int w, int h, int nbAgs) {
        super(w, h, nbAgs);
        logger.warning(id);
        sheepLifeMap = new HashMap<Integer, Integer>();
    }
	
	public static HuntingWorldModel get() {
        return model;
    }
	
	public void setId(String id) {
        this.id = id;
    }
	
	synchronized public static HuntingWorldModel create(int w, int h, int nbAgs) {
        if (model == null) {
            model = new HuntingWorldModel(w, h, nbAgs);
        }
        return model;
    }
	
	static HuntingWorldModel world() throws Exception {
        HuntingWorldModel model = HuntingWorldModel.create(21, 21, 7);
        Random rand = new Random(); 
        
        model.setId("Hunting");
        
        model.setAgPos(0, getSheepRandXPos(rand), getSheepRandYPos(rand)); // sheep
        model.putSheepLife(0);
        
        model.setAgPos(1, getSheepRandXPos(rand), getSheepRandYPos(rand)); // sheep
        model.putSheepLife(1);
        
        model.setAgPos(2, getSheepRandXPos(rand), getSheepRandYPos(rand)); // sheep
        model.putSheepLife(2);
        
        model.setAgPos(3, 19, 0); // wolf
        model.setAgPos(4, 20, 0); // wolf
        model.setAgPos(5, 3, 20); // wolf
        model.setAgPos(6, 20, 20); // wolf
        return model;
    }
	
	boolean move(Move dir, int ag) throws Exception {
        Location l = getAgPos(ag);
        switch (dir) {
        case UP:
            if (isFree(l.x, l.y - 1)) {
                setAgPos(ag, l.x, l.y - 1);
            }
            break;
        case DOWN:
            if (isFree(l.x, l.y + 1)) {
                setAgPos(ag, l.x, l.y + 1);
            }
            break;
        case RIGHT:
            if (isFree(l.x + 1, l.y)) {
                setAgPos(ag, l.x + 1, l.y);
            }
            break;
        case LEFT:
            if (isFree(l.x - 1, l.y)) {
                setAgPos(ag, l.x - 1, l.y);
            }
            break;
        }
        return true;
    }
	
	boolean eat(int ag) {
        Location l = getAgPos(ag);

        int x = 0;
        int y = 0;
        
        switch(ag) {
	    	case 3: x = l.x; y = l.y - 1; break;
	    	case 4: x = l.x+1; y = l.y; break;
	    	case 5: x = l.x; y = l.y+1; break;
	    	case 6: x = l.x-1; y = l.y; break;
	    }

        if (hasObject(HuntingWorldModel.AGENT, x, y) && getAgAtPos(x, y) < 3) {
        	
        	int sheepId = getAgAtPos(x,y);
        	
        	sheepLifeMap.replace(sheepId, sheepLifeMap.get(sheepId) - 1);
        	logger.warning("Bite sheep on position (" + x + " , " + y + ")");
        	
        	if(sheepLifeMap.get(sheepId) == 0) {
        		//agLife.remove(sheepId);
        		model.remove(HuntingWorldModel.AGENT, x, y);
        		remove(HuntingWorldModel.AGENT, x, y);
        		return true;
        	}
        } else {
            logger.warning("Wolf " + ag + " is trying to eat sheep, but there is no sheep (" + l.x + " ; " + l.y + ")!");
        }
        	
        return false;
    }
	
	public static void destroy() {
        model = null;
    }
	
	private static int getSheepRandYPos(Random random) {
		return random.nextInt(model.getHeight() - 2) + 1;
	}

	private static int getSheepRandXPos(Random random) {
		return random.nextInt(model.getWidth() - 2) + 1;
	}
	
	public void putSheepLife(int id) {
		if(!sheepLifeMap.containsKey(id)) {
        	sheepLifeMap.put(id, 4);
    	}
	}
	
	public int getSheepLife(int ag) {
		return sheepLifeMap.get(ag);
	}
}
