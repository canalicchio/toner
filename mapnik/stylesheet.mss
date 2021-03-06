/* Define feature colors */
@color_physical: #000;
@color_physical_bright: #fff;
@color_water: #000;
@color_administrative_dark: #000;
@color_administrative_bright: #fff;
@color_administrative_medium_low: #000;
@color_administrative_medium_high: #000;
@color_administrative_medium_high2: #000;
@color_city: #000;
@color_transport: #000;
@color_transport_casing: #fff;
@color_transport_inline: #fff;
@color_transport_tunnel: #ccc;
@color_transport_minor: #ccc;
@color_transport_rail: #444;
@color_transport_path: #ededed;
@color_poi: #000;
@color_building_outline: #000;
@color_building_outline_special: #00aeef;
@color_airport_runways: #eee;
@color_airport_runways_detail: #f2f2f2;


/* Define text colors */
@label_color_physical: #000;
@label_color_physical_halo: #fff;
@label_color_administrative: #000;
@label_color_administrative_halo: #fff;
@label_color_city: #000;
@label_color_city_halo: #fff;
@label_color_transport: #000;
@label_color_transport_halo: #fff;
@label_color_poi: #000;
@label_color_poi_trains: #4581C3;
@label_color_poi_halo: #fff;

/* Define fonts */
@text_font_physical: 'Arial Unicode MS Regular';
@text_font_physical_bold: 'Arial Unicode MS Bold';
@text_font_water: 'Arial Unicode MS Italic';
@text_font_water_bold: 'Arial Unicode MS Bold Italic';
@text_font_administrative: 'Arial Unicode MS Regular';
@text_font_administrative_bold: 'Arial Unicode MS Bold';
@text_font_city: 'Arial Unicode MS Regular';
@text_font_city_bold: 'Arial Unicode MS Bold';
@text_font_transport: 'Arial Unicode MS Regular';
@text_font_transport_bold: 'Arial Unicode MS Bold';
@text_font_poi_bold: 'Arial Unicode MS Bold Italic';
@text_font_poi_trains_bold: 'Arial Unicode MS Bold';

/* Define text sizes */
@text_font_size_xxsm: 10;
@text_font_size_xsm: 12;
@text_font_size_sm: 13;
@text_font_size_medium: 14;
@text_font_size_medium_plus: 16;
@text_font_size_large: 18;
@text_font_size_xlarge: 20;

/* Define text halo sizes */
@text_font_halo_radius_sm: 1;
@text_font_halo_radius_large: 2;

/* Symbols */
@symbol_subway_sm: 'icons/subway_sm.png';
@symbol_subway: 'icons/subway.png';
@symbol_airplane: 'icons/airplane-19-reverse.png';

/* Pattersn */
@pattern_building_special: 'icons/stripe_color.png';
@pattern_building_sm: 'icons/stripe_sm.png';
@pattern_building_med: 'icons/stripe_med.png';
@pattern_building: 'icons/stripe.png';
@pattern_parks_transparent: 'icons/halftone2-transparent.png';
@pattern_parks: 'icons/halftone2.png';

/*   
    This stylesheet is for the detailed city zooms using OSM data exclusively.
    Well, a couple Natural Earth themes.
    Covers zooms 8 to 19+.
    Note: Bleed over of shoreline and land styles between this and the main stylesheet.mss
    
    Used in map style MMLs:
    
    • Normal map style
        - just this MSS
    • No labels map style
        - just this MSS
    • Hybrid map style
        - also overriden by: 
          toner-hybrid-with-labels.mss
*/


/*
ocean and lakes and river polygons
*/
#water-bodies-low[zoom=8][area>50000000],
#water-bodies-low[zoom=9][area>10000000],
#water-bodies-low[zoom=10][area>2500000],
#water-bodies-med[zoom=11][area> 800000],
#water-bodies-med[zoom=12][area> 500000],
#water-bodies-med[zoom=13][area>  25000],
#water-bodies-high[zoom=14][area> 10000],
#water-bodies-high[zoom>=15]
{ 
	polygon-fill: @color_water;
}

/*land, map background*/
#land[zoom>=8] 
{ 
	polygon-fill: @color_physical_bright;
}

#land[zoom=8] 
{ 
	line-width: 0.5; 
	line-color: @color_physical_bright;
}

/*
touch of Natural Earth again
*/
#admin1-lines-10m[zoom=9],
#admin1-lines-osm[zoom>9]
{
    line-width: 2.0;
    line-color: @color_administrative_medium_high2;
    line-dasharray: 1,5;
	line-cap: round;
}

#buildings-med[zoom=13][area>=40000]
{ 
	/*polygon-fill: #e0e0e0;*/
	polygon-pattern-file: url('icons/stripe_sm.png');
	line-width: 0.5; 
	line-color: @color_building_outline;
}

#buildings-high[zoom=14][area>=20000]
{ 
	/*polygon-fill: #e0e0e0;*/
	polygon-pattern-file: url('icons/stripe_med.png');
	line-width: 0.5; 
	line-color: @color_building_outline;
}

#buildings-high[zoom=15][area>=16000],
#buildings-high[zoom=16][area>=8000],
#buildings-high[zoom=17][area>=4000],
#buildings-high[zoom>=18]
{ 
	/*polygon-fill: #e0e0e0;*/
	polygon-pattern-file: url('icons/stripe.png');
	line-width: 0.5; 
	line-color: @color_building_outline;
}

#buildings-high[zoom=16] 
{ 
	line-width: 0.5;
}

/* Stamen HQ fancy candycane striping */
#buildings-high[osm_id=45074542][zoom>=18]
{ 
	polygon-pattern-file: url('icons/stripe_color.png');
	line-width: 1.5; 
	line-color: @color_building_outline_special;
}


/*
parks
*/

#green-areas-low[zoom=10][area>5000000],
#green-areas-med[zoom=11][area>1000000],
#green-areas-med[zoom=12][area> 500000],
#green-areas-med[zoom=12][area> 200000],
#green-areas-med[zoom=13][area>  75000],
#green-areas-high[zoom=14][area> 10000],
#green-areas-high[zoom>14]
{
    polygon-pattern-file: url('icons/halftone2.png');
    
    &[type=nature_reserve]
    {
        polygon-pattern-file: url('icons/halftone2-transparent.png');
    }
}


/*
#parking-areas[zoom>=12] { polygon-pattern-file: url('halftone2-transparent.png'); }
#building-areas[zoom>=12] { polygon-pattern-file: url('halftone2-transparent.png'); }
*/

#aeroways
{
    line-color: @color_airport_runways;
    line-cap: square;
    line-join: miter;
}

#aeroways[zoom>=15]
{
    line-color: @color_airport_runways_detail;    /*#f2f2f2    this lighter color is in the palette ACT file now */
}

#aeroways[aeroway=runway][zoom=12] { line-width: 2; }
#aeroways[aeroway=runway][zoom=13] { line-width: 4; }
#aeroways[aeroway=runway][zoom=14] { line-width: 8; }
#aeroways[aeroway=runway][zoom=15] { line-width: 16; }
#aeroways[aeroway=runway][zoom=16] { line-width: 32; }
#aeroways[aeroway=runway][zoom=17] { line-width: 64; }
#aeroways[aeroway=runway][zoom>=18] { line-width: 128; }

#aeroways[aeroway=taxiway][zoom=13] { line-width: 1; }
#aeroways[aeroway=taxiway][zoom=14] { line-width: 2; }
#aeroways[aeroway=taxiway][zoom=15] { line-width: 4; }
#aeroways[aeroway=taxiway][zoom=16] { line-width: 8; }
#aeroways[aeroway=taxiway][zoom=17] { line-width: 16; }
#aeroways[aeroway=taxiway][zoom>=18] { line-width: 32; }




/*
begin High Road styles
https://github.com/migurski/HighRoad
*/

/*//////// Base line styles */

.roads {
	line-join: round;
	line-cap: round;
}

.roads[render=outline],
.roads[render=casing]
{
    line-cap: butt;
}

.roads[zoom>=14][is_tunnel=yes][render=outline],
.roads[zoom>=14][is_tunnel=yes][render=casing]
{
    line-opacity: 0.5;
}

.roads[zoom>=15][is_tunnel=yes][render=inline]
{
    line-opacity: 0.0;
}


/*//////// Colors */

.roads[kind=highway][render=inline]
{
	line-color: @color_transport;
}

.roads[kind=highway][render=outline],
.roads[kind=highway][render=casing]
{
	line-color: @color_transport_casing;
}

.roads[zoom<=13][kind=highway][is_link=yes][render=inline]
{
	line-color: @color_transport;
}

.roads[zoom<=13][kind=highway][is_link=yes][render=outline],
.roads[zoom<=13][kind=highway][is_link=yes][render=casing]
{
	line-color: @color_transport_casing;
}

.roads[kind=major_road][render=inline]
{
	line-color: @color_transport;
}

.roads[kind=major_road][zoom<=12][render=inline]
{
	line-color: #000 !important;
}

.roads[kind=major_road][render=outline],
.roads[kind=major_road][render=casing]
{
	line-color: @color_transport_casing;
}

.roads[zoom<=13][kind=major_road][is_link=yes][render=inline]
{
	line-color: @color_transport;
}

.roads[zoom<=13][kind=major_road][is_link=yes][render=outline],
.roads[zoom<=13][kind=major_road][is_link=yes][render=casing]
{
	line-color: @color_transport_casing;
}

.roads[kind=minor_road][render=inline]
{
	line-color: @color_transport_casing;
}

.roads[kind=minor_road][zoom<=14][render=inline]
{
	line-color: #999 !important;
}

.roads[kind=minor_road][zoom=15][render=inline]
{
	line-color: @color_transport;
}

.roads[kind=minor_road][zoom>=16][render=inline]
{
	line-color: @color_transport_minor;
}

.roads[kind=minor_road][render=outline],
.roads[kind=minor_road][render=casing]
{
	line-color: @color_transport;
}

.roads[kind=rail][render=inline],
.roads[kind=rail][render=casing],
.roads[kind=rail][render=outline]
{
	line-color: @color_transport_rail;
}

.roads[kind=path][zoom>=15][render=inline]
{
	line-color: @color_transport_casing;
	/*line-dasharray: 2,5;*/
}
.roads[kind=path][zoom>=15][render=casing]
{
	line-color: @color_transport_path;
}


/*//////// Zoom Level 9 */

/*
.ne_10m_roads_north_america_inline[zoom=9][ScaleRank<=10]
{
	line-width: .2;
	line-color: @color_transport;
}

.ne_10m_roads_north_america_casing[zoom=9][ScaleRank<=8]
{ 	
	line-width: 4.25;
	line-color: @color_transport_casing;
}
.ne_10m_roads_north_america_inline[zoom=9][ScaleRank<=8]
{
	line-width: 1.5;
	line-color: @color_transport;
}
*/

#z10-roads[zoom=9][kind=highway][render=inline]
{ 	
	line-width: 1.5;
	line-color: @color_transport;
}

#z10-roads[zoom=9][kind=highway][render=outline]
{ 	
	line-width: 4.25;
	line-color: @color_transport_casing;
}

#z10-roads[zoom=9][kind=major_road][render=inline]
{ 	
	line-width: 0.15; 
}

/*
#z10-roads[zoom=9][kind=minor_road][render=inline]
{ 	
	line-width: 1; 
}
*/


/*//////// Zoom Level 10 */

#z10-roads[zoom=10][kind=highway][render=inline]
{ 	
	line-width: 2;
}

#z10-roads[zoom=10][kind=highway][render=outline]
{ 	
	line-width: 6;
}

#z10-roads[zoom=10][kind=major_road][render=inline]
{ 	
	line-width: 0.5; 
}

#z10-roads[zoom=10][kind=minor_road][render=inline]
{ 	
	line-width: 0.2; 
}

/*//////// Zoom Level 11 */

#z11-roads[zoom=11][kind=highway][render=inline]
{ 	
	line-width: 2.5;
}

#z11-roads[zoom=11][kind=highway][render=outline]
{ 	
	line-width: 6;
}

#z11-roads[zoom=11][kind=major_road][render=inline]
{ 	
	line-width: 0.7; 
}

#z11-roads[zoom=11][kind=major_road][render=outline]
{ 	
	line-width: 1.25; 
}

#z11-roads[zoom=11][kind=minor_road][render=inline]
{ 	
	line-width: 0.2; 
}

/*//////// Zoom Level 12 */

#z12-roads[zoom=12][kind=highway][is_link=no][render=inline]
{ 	
	line-width: 3;
}

#z12-roads[zoom=12][kind=highway][is_link=no][render=outline]
{ 	
	line-width: 8;
}

#z12-roads[zoom=12][kind=major_road][render=inline]
{ 	
	line-width: 1;
}

#z12-roads[zoom=12][kind=major_road][render=outline]
{ 	
	line-width: 5;
}

#z12-roads[zoom=12][kind=minor_road][render=inline]
{ 	
	line-width: 0.2;
}

#z12-roads[zoom=12][is_link=yes][render=inline]
{ 	
	line-width: 0.5;
}

/*//////// Zoom Level 13 */

#z13-roads[zoom=13][kind=highway][is_link=no][render=inline]
{ 
	line-width: 3;
}

#z13-roads[zoom=13][kind=highway][is_link=no][render=outline]
{ 
	line-width: 8;
	line-color: @color_transport_casing;
}

#z13-roads[zoom=13][kind=highway][is_link=yes][render=inline]
{ 
	line-width: 1;
}

#z13-roads[zoom=13][kind=highway][is_link=yes][is_bridge=yes][render=outline]
{ 
	line-width: 3;
}

#z13-roads[zoom=13][kind=highway][is_link=yes][render=inline]
{ 
	line-width: 1;	
}

#z13-roads[zoom=13][kind=highway][is_link=yes][render=outline]
{ 
	line-width: 3;
}

#z13-roads[zoom=13][kind=major_road][render=inline]
{ 	
	line-width: 1.5;
}

#z13-roads[zoom=13][kind=major_road][is_link=no][render=outline]
{ 
	line-width: 5;
}

#z13-roads[zoom=13][kind=minor_road][render=inline]
{
 	line-width: 0.4;
}


/*//////// Zoom Level 14 */

#z14-roads[zoom=14][kind=highway][render=inline]
{
	line-width: 4;
}

#z14-roads[zoom=14][kind=highway][render=outline],
#z14-roads[zoom=14][kind=highway][is_bridge=yes][render=casing]
{
	line-width: 8;
}

#z14-roads[zoom=14][kind=highway][is_link=yes][render=inline]
{
	line-width: 2.5;	
}

#z14-roads[zoom=14][kind=highway][is_link=yes][render=outline],
#z14-roads[zoom=14][kind=highway][is_link=yes][is_bridge=yes][render=casing]
{
	line-width: 6;
}

#z14-roads[zoom=14][kind=major_road][render=inline]
{
	line-width: 1.9;
}

#z14-roads[zoom=14][kind=major_road][render=outline],
#z14-roads[zoom=14][kind=major_road][is_bridge=yes][render=casing]
{
	line-width: 6;
}

#z14-roads[zoom=14][kind=major_road][is_link=yes][render=inline]
{
	line-width: 1.9;
}

#z14-roads[zoom=14][kind=major_road][is_link=yes][render=outline],
#z14-roads[zoom=14][kind=major_road][is_link=yes][is_bridge=yes][render=casing]
{
	line-width: 6;
}

#z14-roads[zoom=14][kind=minor_road][render=inline]
{
	line-width: 0.8;
}

/*
#z14-roads[zoom=14][kind=minor_road][render=outline],
#z14-roads[zoom=14][kind=minor_road][is_bridge=yes][render=casing]
{
	line-width: 3.5;
}
*/

#z14-roads[zoom=14][kind=rail][render=inline]
{
	line-width: 1;
}

#z14-roads[zoom=14][kind=rail][render=casing]
{
	line-width: 3;
	line-dasharray: 1,3;
	line-cap: butt;
}


/*//////// Zoom Level 15 */

#z15plus-roads[zoom=15][kind=highway][render=inline]
{
	line-width: 6;
}

#z15plus-roads[zoom=15][kind=highway][render=casing]
{
	line-width: 11;
}

#z15plus-roads[zoom=15][kind=highway][is_link=yes][render=inline]
{
	line-width: 2.25;	
}

#z15plus-roads[zoom=15][kind=highway][is_link=yes][render=casing]
{
	line-width: 6.5;
}

#z15plus-roads[zoom=15][kind=major_road][render=inline]
{
	line-width: 5;
}

#z15plus-roads[zoom=15][kind=major_road][render=casing]
{
	line-width: 8;
}

#z15plus-roads[zoom=15][kind=major_road][is_link=yes][render=inline]
{
	line-width: 2.25;
}

#z15plus-roads[zoom=15][kind=major_road][is_link=yes][render=casing]
{
	line-width: 5.5;
}

#z15plus-roads[zoom=15][is_tunnel=yes][render=casing]
{
    line-width: 5;
    line-opacity: 0.7;
    line-color: @color_transport_tunnel;
}

#z15plus-roads[zoom=15][is_tunnel=yes][render=inline]
{
	line-width: 3;
    line-opacity: 0.5;
    line-color: @color_transport;
}

#z15plus-roads[zoom=15][is_tunnel=yes][is_link=yes][render=casing]
{
    line-width: 5;
    line-opacity: 0.7;
    line-color: @color_transport_tunnel;
}

#z15plus-roads[zoom=15][kind=minor_road][render=inline]
{
	line-width: 1.5;
	line-color: @color_transport;
}

/*
#z15plus-roads[zoom=15][kind=minor_road][render=casing]
{
	line-width: 6;
	line-color: @color_transport_casing;
}
*/

#z15plus-roads[zoom=15][highway=service][render=inline]
{
	line-width: 1.5;
	line-color: @color_transport;
}

/*
#z15plus-roads[zoom=15][highway=service][render=casing]
{
	line-width: 3.5;
}
*/

#z15plus-roads[zoom=15][kind=rail][render=inline]
{
	line-width: 1;
}

#z15plus-roads[zoom=15][kind=rail][render=casing]
{
	line-width: 3;
	line-dasharray: 1,3;
	line-cap: butt;
}

#z15plus-roads[zoom=15][kind=path][render=inline]
{
	line-width: 1.5; 
	/*line-dasharray: 2,3;*/
	line-cap: butt;
}
.roads[zoom=15][kind=path][render=casing]
{
	line-width: 4;
}


/*//////// Zoom Level 16 */

#z15plus-roads[zoom=16][kind=highway][render=inline]
{
	line-width: 9;
}

#z15plus-roads[zoom=16][kind=highway][render=casing]
{
	line-width: 14;
}

#z15plus-roads[zoom=16][is_link=yes][render=inline]
{
	line-width: 2.5;
}

#z15plus-roads[zoom=16][is_link=yes][render=casing]
{
	line-width: 7;
}

#z15plus-roads[zoom=16][kind=major_road][render=inline]
{
	line-width: 7;
	line-color: @color_transport;
}


#z15plus-roads[zoom=16][kind=major_road][is_link=no][render=casing]
{
	line-width: 11;
	line-color: @color_transport_casing;
}

#z15plus-roads[zoom=16][kind=major_road][is_link=yes][render=inline]
{
	line-width: 2.5;
	line-color: @color_transport;
}

#z15plus-roads[zoom=16][kind=major_road][is_link=yes][render=casing]
{
	line-width: 7;
	line-color: @color_transport_casing;
}

#z15plus-roads[zoom=16][is_tunnel=yes][render=casing]
{
	line-width: 7;
    line-opacity: 0.4;
    line-color: @color_transport_tunnel;
}
#z15plus-roads[zoom=16][is_tunnel=yes][render=inline]
{
	line-width: 3;
    line-opacity: 0.7;
    line-color: @color_transport_tunnel;
}

#z15plus-roads[zoom=16][is_tunnel=yes][is_link=yes][render=casing]
{
	line-width: 7;
    line-opacity: 0.4;
    line-color: @color_transport_casing;
}

#z15plus-roads[zoom=16][kind=minor_road][render=inline]
{
	line-width: 4;
	line-color: @color_transport;
}


#z15plus-roads[zoom=16][kind=minor_road][render=casing]
{
	line-width: 7;
	line-color: @color_transport_casing;
}


#z15plus-roads[zoom=16][highway=service][render=inline]
{
	line-width: 2;
	line-color: @color_transport;
}

#z15plus-roads[zoom=16][highway=service][render=casing]
{
	line-width: 4;
	line-color: @color_transport_casing;
}

#z15plus-roads[zoom=16][kind=rail][render=inline]
{
	line-width: 1;
}

#z15plus-roads[zoom=16][kind=rail][render=casing]
{
	line-width: 5;
	line-dasharray: 1,4;
	line-cap: butt;
}

#z15plus-roads[zoom=16][kind=path][render=inline]
{
	line-width: 2;
	/*line-dasharray: 2,3;*/
	line-cap: butt;
}
.roads[zoom=16][kind=path][render=casing]
{
	line-width: 5;
}


/*//////// Zoom Level 17 */

#z15plus-roads[zoom=17][kind=highway][render=inline]
{
	line-width: 15;
}

#z15plus-roads[zoom=17][kind=highway][render=casing]
{
	line-width: 24;
}

#z15plus-roads[zoom=17][kind=highway][is_link=yes][render=inline]
{
	line-width: 5;
}

#z15plus-roads[zoom=17][kind=highway][is_link=yes][render=casing]
{
	line-width: 9;
}

#z15plus-roads[zoom=17][kind=major_road][render=inline]
{
	line-width: 12;
	line-color: @color_transport;
}

#z15plus-roads[zoom=17][kind=major_road][render=casing]
{
	line-width: 18;
	line-color: @color_transport_casing;
}

#z15plus-roads[zoom=17][kind=major_road][is_link=yes][render=inline]
{
	line-width: 4;
	line-color: @color_transport;
}

#z15plus-roads[zoom=17][kind=major_road][is_link=yes][render=casing]
{
	line-width: 8;
	line-color: @color_transport_casing;
}


#z15plus-roads[zoom=17][is_tunnel=yes][render=casing]
{
	line-width: 18;
    line-opacity: 0.4;
    line-color: @color_transport_tunnel;
}
#z15plus-roads[zoom=17][is_tunnel=yes][render=inline]
{
	line-width: 12;
    line-opacity: 0.7;
    line-color: @color_transport_tunnel;
}

#z15plus-roads[zoom=17][is_tunnel=yes][is_link=yes][render=casing]
{
	line-width: 9;
    line-opacity: 0.4;
    line-color: @color_transport_casing;
}

/*
#z15plus-roads[zoom=17][is_tunnel=yes][render=casing]
{
	line-width: 12;
    line-opacity: 0.7;
    line-color: @color_transport_tunnel;
}

#z15plus-roads[zoom=17][is_tunnel=yes][is_link=yes][render=casing]
{
	line-width: 4;
    line-opacity: 0.7;
    line-color: @color_transport_tunnel;
}
*/

#z15plus-roads[zoom=17][kind=minor_road][render=inline]
{
	line-width: 7;
	line-color: @color_transport;
}

#z15plus-roads[zoom=17][kind=minor_road][render=casing]
{
	line-width: 9;
	line-color: @color_transport_casing;
}

#z15plus-roads[zoom=17][highway=service][render=inline]
{
	line-width: 4;
	line-color: @color_transport;
}

#z15plus-roads[zoom=17][highway=service][render=casing]
{
	line-width: 6;
	line-color: @color_transport_casing;
}

#z15plus-roads[zoom=17][kind=rail][render=inline]
{
	line-width: 1;
}

#z15plus-roads[zoom=17][kind=rail][render=casing]
{
	line-width: 5;
	line-dasharray: 1,4;
	line-cap: butt;
}

#z15plus-roads[zoom=17][kind=path][render=inline]
{
	line-width: 3; 
	/*line-dasharray: 4,6;*/
	line-cap: butt;
}
.roads[zoom=17][kind=path][render=casing]
{
	line-width: 5;
}

	
	
/*//////// Zoom Level 18+ */

#z15plus-roads[zoom>=18][kind=highway][render=inline]
{
	line-width: 28;
	line-color: @color_transport_inline;
}

#z15plus-roads[zoom>=18][kind=highway][render=casing]
{
	line-width: 42;
	line-color: @color_transport;
}

#z15plus-roads[zoom>=18][kind=highway][is_link=yes][render=inline]
{
	line-width: 10;
	line-color: @color_transport_inline;
}

#z15plus-roads[zoom>=18][kind=highway][is_link=yes][render=casing]
{
	line-width: 14;
	line-color: @color_transport;
}

#z15plus-roads[zoom>=18][kind=major_road][render=inline]
{
	line-width: 18;
	line-color: @color_transport_inline;
}

#z15plus-roads[zoom>=18][kind=major_road][render=casing]
{
	line-width: 22;
	line-color: @color_transport;
}

#z15plus-roads[zoom>=18][kind=major_road][is_link=yes][render=inline]
{
	line-width: 9;
	line-color: @color_transport_inline;
}

#z15plus-roads[zoom>=18][kind=major_road][is_link=yes][render=casing]
{
	line-width: 13;
	line-color: @color_transport;
}



#z15plus-roads[zoom>=18][is_tunnel=yes][render=casing]
{
	line-width: 22;
    line-opacity: 0.4;
    line-color: @color_transport_tunnel;
}
#z15plus-roads[zoom>=18][is_tunnel=yes][render=inline]
{
	line-width: 18;
    line-opacity: 0.7;
    line-color: @color_transport_tunnel;
}

#z15plus-roads[zoom>=18][is_tunnel=yes][is_link=yes][render=casing]
{
	line-width: 9;
    line-opacity: 0.4;
    line-color: @color_transport_casing;
}

/*
#z15plus-roads[zoom>=18][is_tunnel=yes][render=casing]
{
	line-width: 18;
    line-opacity: 0.7;
    line-color: @color_transport_tunnel;
}

#z15plus-roads[zoom>=18][is_tunnel=yes][is_link=yes][render=casing]
{
	line-width: 9;
    line-opacity: 0.7;
    line-color: @color_transport_tunnel;
}*/


#z15plus-roads[zoom>=18][kind=minor_road][render=inline]
{
	line-width: 13;
	line-color: @color_transport_casing;
}

#z15plus-roads[zoom>=18][kind=minor_road][render=casing]
{
	line-width: 17;
	line-color: @color_transport;
}

#z15plus-roads[zoom=18][kind=rail][render=inline]
{
	line-width: 2;
}

#z15plus-roads[zoom=18][kind=rail][render=casing]
{
	line-width: 7;
	line-dasharray: 2,6;
	line-cap: butt;
}

#z15plus-roads[zoom>=18][kind=path][render=inline]
{
	line-width: 2; 
	/*line-dasharray: 4,6;*/
	line-cap: butt;
}
.roads[zoom>=18][kind=path][render=casing]
{
	line-width: 5;
}


/*//////// Zoom Level 19+ */

#z15plus-roads[zoom>18][kind=highway][render=inline]
{
	line-width: 35;
	line-color: @color_transport_casing;
}

#z15plus-roads[zoom>18][kind=highway][render=casing]
{
	line-width: 49;
	line-color: @color_transport;
}

#z15plus-roads[zoom>18][kind=highway][is_link=yes][render=inline]
{
	line-width: 16;
	line-color: @color_transport_casing;
}

#z15plus-roads[zoom>18][kind=highway][is_link=yes][render=casing]
{
	line-width: 20;
	line-color: @color_transport;
}

#z15plus-roads[zoom>18][kind=major_road][render=inline]
{
	line-width: 26;
	line-color: @color_transport_casing;
}

#z15plus-roads[zoom>18][kind=major_road][render=casing]
{
	line-width: 30;
	line-color: @color_transport;
}

#z15plus-roads[zoom>18][kind=major_road][is_link=yes][render=inline]
{
	line-width: 13;
	line-color: @color_transport_casing;
}

#z15plus-roads[zoom>18][kind=major_road][is_link=yes][render=casing]
{
	line-width: 17;
	line-color: @color_transport;
}


#z15plus-roads[zoom>18][is_tunnel=yes][render=casing]
{
	line-width: 30;
    line-opacity: 0.4;
    line-color: @color_transport_tunnel;
}
#z15plus-roads[zoom>18][is_tunnel=yes][render=inline]
{
	line-width: 26;
    line-opacity: 0.7;
    line-color: @color_transport_tunnel;
}

#z15plus-roads[zoom>18][is_tunnel=yes][is_link=yes][render=casing]
{
	line-width: 13;
    line-opacity: 0.4;
    line-color: @color_transport_casing;
}

/*
#z15plus-roads[zoom>18][is_tunnel=yes][render=casing]
{
	line-width: 24;
    line-opacity: 0.7;
    line-color: @color_transport_tunnel;
}

#z15plus-roads[zoom>18][is_tunnel=yes][is_link=yes][render=casing]
{
	line-width: 12;
    line-opacity: 0.7;
    line-color: @color_transport_tunnel;
}
*/


#z15plus-roads[zoom>18][kind=minor_road][render=inline]
{
	line-width: 16;
	line-color: @color_transport_casing;
}

#z15plus-roads[zoom>18][kind=minor_road][render=casing]
{
	line-width: 20;
	line-color: @color_transport;
}

#z15plus-roads[zoom>18][kind=rail][render=inline]
{
	line-width: 4;
}

#z15plus-roads[zoom>18][kind=rail][render=casing]
{
	line-width: 9;
	line-dasharray: 4,7;
	line-cap: butt;
}

#z15plus-roads[zoom>18][kind=path][render=inline]
{
	line-width: 4; 
	/*line-dasharray: 4,6;*/
	line-cap: butt;
}

/* testing deploy */