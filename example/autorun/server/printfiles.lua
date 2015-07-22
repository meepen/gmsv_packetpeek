require"packetpeek";

-- requires https://github.com/glua/gm_stringtable
require"stringtable"; 


local table = stringtable.Get"client_lua_files";

local function padright(str, count)
	str = tostring(str);
	count = count or 6;
	return str..(" "):rep(count - str:len());
end

hook.Add("ReadPacket", "PrintFiles", function(p, addr, name, arg)
	
	if(name == "RequestLuaFile") then
		
		print(addr.." ("..tostring(p)..") requested "..tostring(#arg).." files: ");
		
		for i = 1, #arg do
		
			if(table:Count() <= arg[i] or arg[i] < 0) then
				print("!\t"..padright(arg[i]).."INVALID FILE");
				continue;
			end
			
			print("!\t"..padright(arg[i])..table:GetString(arg[i]));
			
		end
		print"";
		
	end
	
end);