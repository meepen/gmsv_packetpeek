require"packetpeek";

hook.Add("InvalidPacket", "", function(p, addr, id)
	print("Received unknown '"..id.."' packet id from "..addr.." ("..tostring(p)..")");
	--player can be NULL ENTITY when just joining, fine when retrying connection
	--print(p:Nick().." gave invalid packet "..id.."!");
end);

hook.Add("ReadPacket", "", function(p, addr, name, arg)
	print("Received "..name.." packet from "..addr.." ("..tostring(p)..")");
	if(name == "LuaError") then
		print(p:Nick().." had a boo boo!"..arg);
	elseif(name == "NetMessage") then
		print(p:Nick().." sent us a net message! :D ("..util.NetworkIDToString(arg)..")");
	end
end);