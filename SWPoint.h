/*
 *  SWPoint.h
 *  Super Tanks
 *
 *  Created by Samuel Williams on 2/06/06.
 *  Copyright 2006 Samuel Williams. All rights reserved.
 *
 */

#ifndef __SWPOINT__
#define __SWPOINT__

class SWPoint {
public:
	SWPoint () : x(0), y(0) {
		
	}
	
	SWPoint (int _x, int _y) : x(_x), y(_y) {
		
	}
	
	SWPoint (const NSPoint& p) : x(p.x), y(p.y) {
		
	}
	
	void adjacentPoint (SWPoint pts[4]) { //pts must have four elements
		pts[3] = SWPoint (x - 1, y);
		pts[0] = SWPoint (x, y + 1);
		pts[1] = SWPoint (x + 1, y);
		pts[2] = SWPoint (x, y - 1);
	}
	
	int x, y;
};

class SWSize {
public:
	SWSize () : width(0), height(0) {
		
	}
	
	SWSize (int _width, int _height) : width(_width), height(_height) {
		
	}
	
	SWSize (const NSSize& s) : width(s.width), height(s.height) {
		
	}
	
	int width, height;
};

#endif
