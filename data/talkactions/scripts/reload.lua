	--  Made by oTibia.pl --
local reload = {
	{RELOAD_TYPE_ACTIONS, "actions", "action", "act"},
	{RELOAD_TYPE_MONSTERS, "monsters", "monster", "mon"},
	{RELOAD_TYPE_NPCS, "npcs", "npc"},
	{RELOAD_TYPE_CONFIG, "config", "conf"},
	{RELOAD_TYPE_TALKACTIONS, "talkactions", "talkaction", "talk"},
	{RELOAD_TYPE_MOVEMENTS, "movements", "movement", "move"},
	{RELOAD_TYPE_SPELLS, "spells", "spell"},
	{RELOAD_TYPE_RAIDS, "raids", "raid"},
	{RELOAD_TYPE_CREATURESCRIPTS, "creaturescripts", "creaturescript", "crea"},
	{RELOAD_TYPE_OUTFITS, "outfits", "outfit", "out"},
	{RELOAD_TYPE_MOUNTS, "mounts", "mount", "mou"},
	{RELOAD_TYPE_ITEMS, "items", "item"},
	{RELOAD_TYPE_GLOBALEVENTS, "globalevents", "globalevent", "glo"} --,
--	{RELOAD_TYPE_ALL, "all"} //@@ TODO
}

function onSay(cid, words, param)
	if (getPlayerFlagValue(cid, PLAYERFLAG_CANRELOADCONTENT) == false) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You don\'t have permissions to do that.")
		return false
	end

	param = param:lower()
	for _, o in ipairs(reload) do
		if (param == o) then
			doReloadInfo(o[1], cid)
			found = o[2]
			break
		end
	end

	if (param == "" or not found) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You need to type a good parameter: \"actions\", \"monsters\", \"npcs\", \"config\", \"talkactions\", \"movements\", \"spells\", \"raids\", \"creaturescripts\", \"outfits\", \"mounts\", \"items\", \"globalevents\", \"all\", .")
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Reloaded ".. found ..".")
	end
return true
end
