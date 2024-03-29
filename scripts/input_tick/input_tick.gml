function input_tick()
{
    var _any_changed = false;
    
    global.__input_frame++;
    
    #region Touch
    
    if (__INPUT_TOUCH_SUPPORT && INPUT_TOUCH_POINTER_ALLOWED)
    {
        if (__INPUT_ON_PS)
        {
            //Use first touch (of 2) on active PlayStation gamepad
            var _gamepad = input_player_gamepad_get();
            if (_gamepad >= 0 && _gamepad < 4)
            {
                global.__input_pointer_index = _gamepad * 2;
                global.__input_pointer_pressed  = gamepad_button_check_pressed(_gamepad, gp_select);
                global.__input_pointer_released = gamepad_button_check_released(_gamepad, gp_select);
            }
        }
        else
        {
            var _touch_index = undefined;
            var _touch_press_index = global.__input_pointer_pressed_index;
    
            //Track contact duration per index
            var _i = 0;
            repeat(INPUT_MAX_TOUCHPOINTS)
            {
                if (!device_mouse_check_button(_i, mb_left))
                {
                    global.__input_pointer_durations[_i] = 0;
                }
                else
                {
                    //Get recent active touch
                    global.__input_pointer_durations[_i] += delta_time;
                    if (_touch_index == undefined || (global.__input_pointer_durations[_i] < global.__input_pointer_durations[_touch_index]))
                    {
                        _touch_index = _i;
                    }
                }
    
                _i++;
            }
        
            //Set active pointer index
            if (_touch_index == undefined) _touch_index = 0;
            global.__input_pointer_pressed = device_mouse_check_button_pressed(_touch_index, mb_left);
            global.__input_pointer_released = (device_mouse_check_button_released(_touch_press_index, mb_left) && (_touch_press_index != undefined));

            //Touch edge testing
            var _w = display_get_gui_width();
            var _h = display_get_gui_height();
            if (INPUT_TOUCH_EDGE_DEADZONE > 0)
            {
                //Release
                if (global.__input_pointer_released)
                {
                    var _tx  = device_mouse_x_to_gui(_touch_press_index);
                    var _ty  = device_mouse_y_to_gui(_touch_press_index);
    
                    if ((_tx < INPUT_TOUCH_EDGE_DEADZONE) || (_tx > (_w - INPUT_TOUCH_EDGE_DEADZONE))
                    ||  (_ty < INPUT_TOUCH_EDGE_DEADZONE) || (_ty > (_h - INPUT_TOUCH_EDGE_DEADZONE)))
                    {
                        global.__input_pointer_released = false;
                    }
                }
        
                //Press
                if (global.__input_pointer_pressed)
                {
                    var _tx  = device_mouse_x_to_gui(_touch_index);
                    var _ty  = device_mouse_y_to_gui(_touch_index);

                    if ((_tx < INPUT_TOUCH_EDGE_DEADZONE) || (_tx > (_w - INPUT_TOUCH_EDGE_DEADZONE))
                    ||  (_ty < INPUT_TOUCH_EDGE_DEADZONE) || (_ty > (_h - INPUT_TOUCH_EDGE_DEADZONE)))
                    {
                        global.__input_pointer_pressed = false;
                    }
                }
            }
    
            //Update state
            global.__input_pointer_index = _touch_index;
            if (global.__input_pointer_pressed)  global.__input_pointer_pressed_index = _touch_index;
            if (global.__input_pointer_released) global.__input_pointer_pressed_index = undefined;
        }
    }
    
    #endregion
    
    #region Mouse
    
    var _mouse_x = 0;
    var _mouse_y = 0;
    
    switch (INPUT_MOUSE_MODE)
    {
        case 0:
            _mouse_x = device_mouse_x(global.__input_pointer_index);
            _mouse_y = device_mouse_y(global.__input_pointer_index);
        break;
        
        case 1:
            _mouse_x = device_mouse_x_to_gui(global.__input_pointer_index);
            _mouse_y = device_mouse_y_to_gui(global.__input_pointer_index);
        break;
        
        case 2:
            _mouse_x = device_mouse_raw_x(global.__input_pointer_index);
            _mouse_y = device_mouse_raw_y(global.__input_pointer_index);
        break;
        
        default:
            __input_error("Invalid mouse mode (", INPUT_MOUSE_MODE, ")");
        break;
    }
    
    global.__input_mouse_moved = (point_distance(_mouse_x, _mouse_y, global.__input_mouse_x, global.__input_mouse_y) > INPUT_MOUSE_MOVE_DEADZONE);
    global.__input_mouse_x = _mouse_x;
    global.__input_mouse_y = _mouse_y;
    
    //Track Window focus
    global.__input_window_focus_previous = global.__input_window_focus;
    global.__input_window_focus = (window_has_focus() != false);
    
    if (__INPUT_ON_DESKTOP && global.__input_window_focus)
    {
        if (!global.__input_window_focus_previous)
        {
            //Block mouse buttons on focus regain
            global.__input_mouse_blocked = true;
        }
        else
        {
            if (global.__input_mouse_blocked)
            {
                //Reevaluate mouse block if focus is sustained
                global.__input_mouse_blocked = false;
                global.__input_mouse_blocked = (__input_mouse_button() != mb_none);
            }
        }
    }
    
    //Windows mouse extensions
    global.__input_tap_click = false;
    if (os_type == os_windows)
    {
        //Track clicks from touchpad and touchscreen taps (system-setting dependent)
        //N.B. Fix *not* needed in UWP
        global.__input_tap_presses  += device_mouse_check_button_pressed( 0, mb_left);
        global.__input_tap_releases += device_mouse_check_button_released(0, mb_left);
    
        //Resolve press/release desync (where press failed to register on same frame as release)
        if (global.__input_tap_releases >= global.__input_tap_presses)
        {
            global.__input_tap_click    = (global.__input_tap_releases > global.__input_tap_presses);
            global.__input_tap_presses  = 0;
            global.__input_tap_releases = 0;
        }
    }
    
    #endregion
    
    #region Keyboard

    //Text entry
    if (__INPUT_KEYBOARD_SUPPORT || os_type == os_ios) 
    {
        if (!input_string_async_is_active())
        {
            var _string = keyboard_string;

            //Revert overflow
            if ((_string == "") && (string_length(global.__input_keyboard_prev_string) > 1))
            {
                _string = "";
            }
        
            input_string_set(_string);
        }
    }
    
    //Unstick
    if (__INPUT_KEYBOARD_SUPPORT && keyboard_check(vk_anykey))
    {
        var _platform = os_type;
        if (__INPUT_ON_WEB && __INPUT_ON_APPLE) _platform = "apple_web";

        switch (_platform)
        {
            case os_uwp:
                if ((INPUT_IGNORE_RESERVED_KEYS_LEVEL > 0) 
                && keyboard_check(vk_alt) && !keyboard_check_pressed(vk_alt))
                {
                    //Unstick Alt Tab
                    keyboard_key_release(vk_alt);
                }
            //UWP also uses Windows case
            case os_windows:
                if (keyboard_check(vk_alt) && keyboard_check_pressed(vk_space))
                {
                    //Unstick Alt Space
                    keyboard_key_release(vk_alt);
                    keyboard_key_release(vk_space);
                    keyboard_key_release(vk_lalt);
                    keyboard_key_release(vk_ralt);
                }
            break;            
            case "apple_web": //This case applies on iOS, tvOS, and MacOS
                if (keyboard_check_released(92) || keyboard_check_released(93))
                {
                    //Meta release sticks every key pressed during hold
                    //This is "the nuclear option", but the problem is severe
                    var _i = 8;
                    var _len = 255 - _i;
                    repeat(_len)
                    {
                        keyboard_key_release(_i);
                        ++_i;
                    }
                }
            break;                
            case os_macosx:
                //Unstick doubled-up control keys
                if (keyboard_check_released(vk_control))
                {
                    keyboard_key_release(vk_lcontrol);
                    keyboard_key_release(vk_rcontrol);
                }
            
                if (keyboard_check_released(vk_shift))
                {
                    keyboard_key_release(vk_lshift);
                    keyboard_key_release(vk_rshift);
                }
            
                if (keyboard_check_released(vk_alt))
                {
                    keyboard_key_release(vk_lalt);
                    keyboard_key_release(vk_ralt);
                }
            
                //Unstick Meta
                if (keyboard_check_released(vk_meta1))
                {
                    keyboard_key_release(vk_meta2);
                }
                else if (keyboard_check_released(vk_meta2) && keyboard_check(vk_meta1))
                {
                    keyboard_key_release(vk_meta1);
                }
            break;
        }
    }
    
    #endregion
    
    #region Update gamepads
    
    //Expand dynamic device count
    var _device_change = max(0, gamepad_get_device_count() - array_length(global.__input_gamepads))
    repeat(_device_change) array_push(global.__input_gamepads, undefined);
    
    var _g = 0;
    repeat(array_length(global.__input_gamepads))
    {
        var _gamepad = global.__input_gamepads[_g];
        if (is_struct(_gamepad))
        {
            if (gamepad_is_connected(_g))
            {
                if (os_type == os_switch)
                {
                    //When L+R assignment is used to pair two gamepads we won't see a normal disconnection/reconnection
                    //Instead we have to check for changes in the description to see if state has changed
                    if (_gamepad.description != gamepad_get_description(_g))
                    {
                        _gamepad.discover();
                    }
                    else
                    {
                        _gamepad.tick();
                    }
                }
                else
                {
                    _gamepad.tick();
                }
            }
            else
            {
                //Remove our gamepad handler
                __input_trace("Gamepad ", _g, " disconnected");
                
                global.__input_gamepads[@ _g] = undefined;
                
                //Also report gamepad changes for any active players
                var _p = 0;
                repeat(INPUT_MAX_PLAYERS)
                {
                    with(global.__input_players[_p])
                    {
                        if ((gamepad == _gamepad) && (source == INPUT_SOURCE.GAMEPAD))
                        {
                            __input_trace("Player ", _p, " gamepad disconnected");
                            
                            source = INPUT_SOURCE.NONE;
                            _any_changed = true;
                        }
                    }
                    
                    ++_p;
                }
            }
        }
        else
        {
            if (gamepad_is_connected(_g))
            {
                __input_trace("Gamepad ", _g, " connected");
                __input_trace("New gamepad = \"", gamepad_get_description(_g), "\", GUID=\"", gamepad_get_guid(_g), "\"");
                
                global.__input_gamepads[@ _g] = new __input_class_gamepad(_g);
            }
        }
        
        ++_g;
    }
    
    #endregion
    
    var _p = 0;
    repeat(INPUT_MAX_PLAYERS)
    {
        global.__input_players[_p].tick();
        ++_p;
    }
    
    return _any_changed;
}
