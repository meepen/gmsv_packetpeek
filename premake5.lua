solution "gmsv_packetpeek"
	language "C++"
	location "project"
	targetdir "bin"

	flags "StaticRuntime"

	architecture "x86"

	configurations {
		"Release"
	}

	configuration "Release"
		optimize "On"

	project "gmsv_packetpeek"
		kind "SharedLib"

		files {
			"src/**.cpp",
			"src/**.h"
		}

		include "SourceSDK/Tier0"
		include "SourceSDK/Tier1"
        include "LuaInterface"
