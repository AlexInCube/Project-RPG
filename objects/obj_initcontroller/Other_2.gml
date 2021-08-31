window_set_cursor(cr_none)

scribble_font_add_all()

scribble_glyph_set("fnt_verysmall", " ", SCRIBBLE_GLYPH.HEIGHT,  -8, true);
scribble_glyph_set("fnt_small",     " ", SCRIBBLE_GLYPH.HEIGHT, -10, true);
scribble_glyph_set("fnt_large",     " ", SCRIBBLE_GLYPH.HEIGHT, -20, true);
scribble_glyph_set("fnt_verylarge", " ", SCRIBBLE_GLYPH.HEIGHT, -20, true);

if !audio_group_is_loaded(ag_music)
   {
   audio_group_load(ag_music);
   }
   
if !audio_group_is_loaded(ag_sounds)
   {
   audio_group_load(ag_sounds);
   }

show_debug_message("myGMLib Loaded: "+string(gmlib_link_test()))

localization_load()

register_items()
register_effects()
register_quests()
register_spell_pieces()
register_screens()
register_story_tags()
register_craft_recipes()