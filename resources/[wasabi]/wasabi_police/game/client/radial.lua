local OX = exports.ox_lib

-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------

-- Création des menus
OX:registerRadial({ -- Police menu
	id = 'custom_police_menu',
	items = {
		{
			label = 'Menotter',
			icon = 'handcuffs',
			onSelect = function()
				TriggerEvent('wasabi_police:handcuffPlayer')
			end
		},
		{
			label = 'Escorter',
			icon = 'people-pulling',
			onSelect = function()
				TriggerEvent('wasabi_police:escortPlayer')
			end
		},
		{
			label = 'Fouiller',
			icon = 'search',
			onSelect = function()
				TriggerEvent('wasabi_police:searchPlayer')
			end
		},
		{
			label = 'Vérifier ID',
			icon = 'id-card',
			onSelect = function()
				TriggerEvent('wasabi_police:checkId')
			end
		},
		{
			label = 'Véhicule',
			icon = 'car',
			menu = 'custom_police_menu_vehicle'
		},
	}
})

OX:registerRadial({ -- Police vehicle menu
	id = 'custom_police_menu_vehicle',
	items = {
		{
			label = 'Info',
			icon = 'circle-info',
			onSelect = function()
				TriggerEvent('wasabi_police:vehicleInfo')
			end
		},
		{
			label = 'Lockpick',
			icon = 'key',
			onSelect = function()
				TriggerEvent('wasabi_police:lockpickVehicle')
			end
		},
		{
			label = 'Impound',
			icon = 'trailer',
			onSelect = function()
				TriggerEvent('wasabi_police:impoundVehicle')
			end
		},
		{
			label = 'Seat',
			icon = 'door-closed',
			onSelect = function()
				TriggerEvent('wasabi_police:inVehiclePlayer')
			end
		},
		{
			label = 'Unseat',
			icon = 'door-open',
			onSelect = function()
				TriggerEvent('wasabi_police:outVehiclePlayer')
			end
		},
		{
			label = 'Wrap',
			icon = 'spray-can',
			onSelect = function()
				ExecuteCommand("liveries")
			end
		},
		{
			label = 'Extras',
			icon = 'puzzle-piece',
			onSelect = function()
				ExecuteCommand("extras")
			end
		}
	}
})

local function addRadialItemCustomPoliceMenu()
	OX:addRadialItem({
		id = 'custom_police_menu',
		icon = 'shield-halved',
		label = "Menu Police",
		menu = 'custom_police_menu'
	})
end

local function removeRadialPoliceMenu()
	-- Supprime le menu radial de la police
	OX:removeRadialItem('custom_police_menu')
	OX:removeRadialItem('custom_police_menu_vehicle')
end

RegisterNetEvent('wasabi_police:client:checkDuty', function(src, toggleDuty)
	local dutyStatus = wsb.isOnDuty()
	
	if toggleDuty then
		dutyStatus = not dutyStatus
	end

	if dutyStatus then
		addRadialItemCustomPoliceMenu()

		OX:addRadialItem({
			id = 'toggleDuty',
			icon = 'user-xmark',
			label = "Prendre sa fin de service",
			onSelect = function()
				TriggerEvent('wasabi_police:toggleDuty')
			end
		})
	else
		removeRadialPoliceMenu()

		OX:addRadialItem({
			id = 'toggleDuty',
			icon = 'user-check',
			label = "Prendre son service",
			onSelect = function()
				TriggerEvent('wasabi_police:toggleDuty')
			end
		})
	end
end)