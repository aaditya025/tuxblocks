package tuxkids.tuxblocks.core.solve.blocks;

import playn.core.Color;
import tuxkids.tuxblocks.core.Constant;
import tuxkids.tuxblocks.core.utils.persist.Persistable;
import tuxkids.tuxblocks.core.utils.persist.Persistable.Constructor;

public class OverBlock extends VerticalModifierBlock {

	public OverBlock(int value) {
		super(value);
	}
	
	public OverBlock(TimesBlock inverse) {
		super(inverse);
	}

	@Override
	protected String operator() {
		return Constant.DIVIDE_SYMBOL;
	}

	@Override
	public ModifierBlock copyChild() {
		return new OverBlock(value);
	}

	@Override
	protected ModifierBlock inverseChild() {
		return new TimesBlock(this);
	}

	@Override
	protected int color() {
//		return getColor(210);
		return Color.rgb(0x03, 0xC6, 0x03);
	}
	
	public static Constructor constructor() {
		return new Constructor() {
			@Override
			public Persistable construct() {
				return new OverBlock(0);
			}
		};
	}

}
