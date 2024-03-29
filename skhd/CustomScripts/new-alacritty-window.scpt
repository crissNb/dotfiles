on menu_click(mList)
	local appName, topMenu, r

	if mList's length < 3 then error "Menu list not long enough"

	set {appName, topMenu} to (items 1 through 2 of mList)
	set r to (items 3 through (mList's length) of mList)

	tell application "System Events" to my menu_click_recurse(r, ((process appName)'s ¬
		(menu bar 1)'s (menu bar item topMenu)'s (menu topMenu)))
end menu_click

on menu_click_recurse(mList, parentObject)
    local f, r

    -- `f` = first item, `r` = rest of items
    set f to item 1 of mList
    if mList's length > 1 then set r to (items 2 through (mList's length) of mList)

    -- either actually click the menu item, or recurse again
    tell app "System Events"
        if mList's length is 1 then
            click parentObject's menu item f
        else
            my menu_click_recurse(r, (parentObject's (menu item f)'s (menu f)))
        end if
    end tell
end menu_click_recurse

tell application "alacritty" to activate
