package hunting;

import java.awt.Color;
import java.awt.Graphics;

import jason.environment.grid.GridWorldView;

@SuppressWarnings("serial")
public class HuntingWorldView extends GridWorldView {
	
	HuntingPlanet env = null;
	
	public HuntingWorldView(HuntingWorldModel model) {
        super(model, "Hunting", 800);
        setVisible(true);
        repaint();
    }
	
	public void setEnv(HuntingPlanet env) {
        this.env = env;
    }
	
	@Override
    public void drawAgent(Graphics g, int x, int y, Color c, int id) {        
        Color idColor = Color.white;
        String agLabel = "W";
        if (id >= 3) { // wolf
            super.drawAgent(g, x, y, Color.darkGray, -1);
            agLabel += String.valueOf(id);
        } else { // sheep
            super.drawAgent(g, x, y, Color.white, -1);
            idColor = Color.red;
            agLabel = "S";
        }
        g.setColor(idColor);
        drawString(g, x, y, defaultFont, agLabel);
    }
}
