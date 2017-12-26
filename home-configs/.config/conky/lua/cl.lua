 --[[drawing a clock in conkyrc
 by mrpeachy - 12 March 2010
 Edited by Sector11 for personal use - 12 Mar 2012
 
 changelog:
 v1.2	- (04.2012) converted to one4all module by dk75
 ]]
 
 local modname = ...
 local M = {}
 _G[modname] = M
 package.loaded[modname] = M
 
 
 
 --[[
 ###############################################################################
 ###                              SETTINGS                                   ###
 ###############################################################################
 --]]
 local settings_table = {
 	{	--12 OR 24
 		clock_type=12,
 
 		--CLOCK SETTINGS
 		clock_radius=90,
 		clock_centerx=300,
 		clock_centery=300,
 
 		-- SET MARKS
 		--how many marks around edge
 		number_marks=24, --24
 		--set mark length
 		m_length=10,
 		--set mark line width
 		m_width=3,
 		--set mark line cap type
 		m_cap=CAIRO_LINE_CAP_ROUND,
 		--set mark color and alpha
 		--full opaque black
 		m_color='0x000000',
 		m_alpha=1,
 
 		--SET BORDER OPTIONS
 		clock_border_width=0, --2
 		--set color and alpha for clock border
 		--full opaque black
 		c_color='0x000000',
 		c_alpha=1,
 		--gap from clock border to hour marks
 		b_to_m=5,
 
 		--SECONDS HAND SETUP
 		--set length of seconds hand
 		sh_length=90,
 		--set hand width
 		sh_width=1,
 		--set hand line cap
 		sh_cap=CAIRO_LINE_CAP_ROUND,
 		--set seconds hand color
 		--fully opaque red
 		sh_color='0xff0000',
 		sh_alpha=1,
 
 		--MINUTE HAND SETUP
 		--set length of minutes hand
 		mh_length=80,
 		--set hand width
 		mh_width=2,
 		--set hand line cap
 		mh_cap=CAIRO_LINE_CAP_ROUND,
 		--set minute hand color
 		--fully opaque black
 		mh_color='0x000000',
 		mh_alpha=1,
 
 		--HOUR HAND SETUP
 		--set length of hour hand
 		hh_length=70,
 		--set hand width
 		hh_width=4,
 		--set hand line cap
 		hh_cap=CAIRO_LINE_CAP_ROUND,
 		--set hour hand color
 		--fully opaque black
 		hh_color='0x000000',
 		hh_alpha=1,
 	},
 }
 --[[
 ###############################################################################
 ###                           END OF SETTINGS                               ###
 ###############################################################################
 --]]
 
 
 
 
 function M.clock(t)
 
 --DRAWING CODE
 --draw border
 cairo_set_source_rgba (cr,one4all_cairo.rgb2rgba(t.c_color, t.c_alpha))
 cairo_set_line_width (cr,t.clock_border_width)
 cairo_arc (cr,t.clock_centerx,t.clock_centery,t.clock_radius,0,2*math.pi)
 cairo_stroke (cr)
 
 --DRAW MARKS
 --stuff that can be moved outside of the loop, needs only be set once
 --calculate end and start radius for marks
 local m_end_rad=t.clock_radius-t.b_to_m
 local m_start_rad=m_end_rad-t.m_length
 --set line cap type
 cairo_set_line_cap  (cr, t.m_cap)
 --set line width
 cairo_set_line_width (cr,t.m_width)
 --set color and alpha for marks
 cairo_set_source_rgba (cr,one4all_cairo.rgb2rgba(t.m_color, t.m_alpha))
 --start for loop
 local i, radius, point, x, y = nil
 for i=1,t.number_marks do
 --drawing code using the value of i to calculate degrees
 --calculate start point for 12 oclock mark
 radius=m_start_rad
 point=(math.pi/180)*((i-1)*(360/t.number_marks))
 x=0+radius*(math.sin(point))
 y=0-radius*(math.cos(point))
 --set start point for line
 cairo_move_to (cr,t.clock_centerx+x,t.clock_centery+y)
 --calculate end point for 12 oclock mark
 radius=m_end_rad
 point=(math.pi/180)*((i-1)*(360/t.number_marks))
 x=0+radius*(math.sin(point))
 y=0-radius*(math.cos(point))
 --set path for line
 cairo_line_to (cr,t.clock_centerx+x,t.clock_centery+y)
 --draw the line
 cairo_stroke (cr)
 end--of for loop
 
 --TIME CALCULATIONS ###########################
 local hours, h_to_s = nil
 if t.clock_type==12 then
 hours=tonumber(os.date("%I")) --12 hour clock
 --convert hours to seconds
 h_to_s=hours*60*60
 elseif t.clock_type==24 then
 hours=tonumber(os.date("%H")) --24 hour clock
 --convert hours to seconds
 h_to_s=hours*60*60
 end
 
 local minutes=tonumber(os.date("%M"))
 --convert minutes to seconds
 local m_to_s=minutes*60
 --get current seconds
 local seconds=tonumber(os.date("%S"))
 
 --DRAW HOUR HAND ############################
 --convert hours, minutes & seconds to seconds
 local hsecs=h_to_s+m_to_s+seconds
 --calculate number of degrees for each hand per second
 local hsec_degs=hsecs*(360/(60*60*t.clock_type)) -- USING AN EQUATION INSTEAD OF TYPING THE CALCULATION IN BECAUSE THE RESULT OF 360/43200 HAS DECIMAL PLACES
 --set radius we will use to calculate hand points
 radius=t.hh_length
 --set our starting line coordinates, the center of the circle
 cairo_move_to (cr,t.clock_centerx,t.clock_centery)
 --calculate coordinates for end of minutes hand
 point=(math.pi/180)*hsec_degs
 x=0+radius*(math.sin(point))
 y=0-radius*(math.cos(point))
 --describe the line we will draw
 cairo_line_to (cr,t.clock_centerx+x,t.clock_centery+y)
 --set up line attributes and draw line
 cairo_set_line_width (cr,t.hh_width)
 cairo_set_source_rgba (cr,one4all_cairo.rgb2rgba(t.hh_color, t.hh_alpha))
 cairo_set_line_cap  (cr, t.hh_cap)
 cairo_stroke (cr)
 
 --DRAW MINUTES HAND ############################
 --convert minutes & seconds to seconds
 local msecs=m_to_s+seconds
 --calculate degrees for the hand each second
 local msec_degs=msecs*0.1
 --set radius we will use to calculate hand points
 radius=t.mh_length
 --set our starting line coordinates, the center of the circle
 cairo_move_to (cr,t.clock_centerx,t.clock_centery)
 --calculate coordinates for end of minutes hand
 point=(math.pi/180)*msec_degs
 x=0+radius*(math.sin(point))
 y=0-radius*(math.cos(point))
 --describe the line we will draw
 cairo_line_to (cr,t.clock_centerx+x,t.clock_centery+y)
 --set up line attributes and draw line
 cairo_set_line_width (cr,t.mh_width)
 cairo_set_source_rgba (cr,one4all_cairo.rgb2rgba(t.mh_color, t.mh_alpha))
 cairo_set_line_cap  (cr, t.mh_cap)
 cairo_stroke (cr)
 
 --DRAW SECOND HAND #############################
 --calculate degrees for each second the hand moves
 local sec_degs=seconds*6
 --set radius we will use to calculate hand points
 radius=t.sh_length
 --set our starting line coordinates, the center of the circle
 cairo_move_to (cr,t.clock_centerx,t.clock_centery)
 --calculate coordinates for end of second hand
 point=(math.pi/180)*sec_degs
 x=0+radius*(math.sin(point))
 y=0-radius*(math.cos(point))
 --describe the line we will draw
 cairo_line_to (cr,t.clock_centerx+x,t.clock_centery+y)
 --set up line attributes and draw line
 cairo_set_line_width (cr,t.sh_width)
 cairo_set_source_rgba (cr,one4all_cairo.rgb2rgba(t.sh_color, t.sh_alpha))
 cairo_set_line_cap  (cr, t.sh_cap)
 cairo_stroke (cr)
 
 end-- end main function
 
 
 
 --[[
 ###############################################################################
 ###                            MODULE MAIN LOOP                             ###
 ###############################################################################
 --]]
 function M.main()
         for i in pairs(settings_table) do
             M.clock(settings_table[i])
         end
 end
