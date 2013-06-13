package tuxkids.tuxblocks.core;

import playn.core.Graphics;
import playn.core.GroupLayer;
import playn.core.Keyboard;
import playn.core.Layer;
import playn.core.PlayN;
import playn.core.Pointer;
import playn.core.Pointer.Event;
import pythagoras.f.IVector;
import pythagoras.f.Vector;
import pythagoras.i.IPoint;
import pythagoras.i.Point;
import tuxkids.tuxblocks.core.utils.Debug;

public class PlayNObject {
	protected static Graphics graphics() {
		return PlayN.graphics();
	}
	
	protected static Pointer pointer() {
		return PlayN.pointer();
	}
	
	protected static Keyboard keyboard() {
		return PlayN.keyboard();
	}
	
	protected static long currentTime() {
		return (long)PlayN.currentTime();
	}
	
	protected static int gWidth() {
		return graphics().width();
	}
	
	protected static int gHidth() {
		return graphics().height();
	}
	
	protected static GroupLayer gRootLayer() {
		return graphics().rootLayer();
	}
	
	protected static void debug(String msg) {
		Debug.write(msg);
	}
	
	protected static void debug(String msg, Object... args) {
		Debug.write(msg, args);
	}
	
	protected static void debug(int msg) {
		Debug.write(msg);
	}
	
	protected static void debug(float msg) {
		Debug.write(msg);
	}
	
	protected static void debug(double msg) {
		Debug.write(msg);
	}
	
	public static float lerp(float x0, float x1, float perc) {
		return x0 * (1 - perc) + x1 * perc;
	}
	
	public static void lerp(Vector v0, float x1, float y1, float perc) {
		v0.x = lerp(v0.x, x1, perc);
		v0.y = lerp(v0.y, y1, perc);
	}
	
	public static float distance(float x1, float y1, float x2, float y2) {
		float dx = x2 - x1;
		float dy = y2 - y1;
		return (float)Math.sqrt(dx * dx + dy * dy);
	}
	
	public static float distance(Object o1, Object o2) {
		return distance(getX(o1), getY(o1), getX(o2), getY(o2));
	}
	
	public static float distance(Object o1, float x2, float y2) {
		return distance(getX(o1), getY(o1), x2, y2);	
	}

	private static float getX(Object o) {
		if (o instanceof IPoint) {
			return ((IPoint) o).x();
		} else if (o instanceof IVector) {
			return ((IVector) o).x();
		} else if (o instanceof Event) {
			return ((Event) o).x();
		} else if (o instanceof Layer) {
			return ((Layer) o).tx();
		}
		return 0;
	}
	
	private static float getY(Object o) {
		if (o instanceof IPoint) {
			return ((IPoint) o).y();
		} else if (o instanceof IVector) {
			return ((IVector) o).y();
		} else if (o instanceof Event) {
			return ((Event) o).y();
		} else if (o instanceof Layer) {
			return ((Layer) o).ty();
		}
		return 0;
	}
}